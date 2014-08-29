# vim:fileencoding=utf-8:noet
from __future__ import absolute_import, unicode_literals, division, print_function

import atexit

import zsh

from weakref import WeakValueDictionary, ref

from powerline.shell import ShellPowerline
from powerline.lib import parsedotval
from powerline.lib.unicode import unicode


used_powerlines = WeakValueDictionary()


def shutdown():
	for powerline in tuple(used_powerlines.values()):
		powerline.shutdown()


def get_var_config(var):
	try:
		return [parsedotval(i) for i in zsh.getvalue(var).items()]
	except:
		return None


class Args(object):
	__slots__ = ('last_pipe_status', 'last_exit_code')
	ext = ['shell']
	renderer_module = '.zsh'

	@property
	def config(self):
		try:
			return get_var_config('POWERLINE_CONFIG')
		except IndexError:
			return None

	@property
	def theme_option(self):
		try:
			return get_var_config('POWERLINE_THEME_CONFIG')
		except IndexError:
			return None

	@property
	def config_path(self):
		try:
			ret = zsh.getvalue('POWERLINE_CONFIG_PATHS')
		except IndexError:
			return None
		else:
			if isinstance(ret, (unicode, str, bytes)):
				return ret.split(type(ret)(':'))
			else:
				return ret

	@property
	def jobnum(self):
		return zsh.getvalue('_POWERLINE_JOBNUM')


def string(s):
	if type(s) is bytes:
		return s.decode('utf-8', 'replace')
	else:
		return str(s)


class Environment(object):
	@staticmethod
	def __getitem__(key):
		try:
			return string(zsh.getvalue(key))
		except IndexError as e:
			raise KeyError(*e.args)

	@staticmethod
	def get(key, default=None):
		try:
			return string(zsh.getvalue(key))
		except IndexError:
			return default

	@staticmethod
	def __contains__(key):
		try:
			zsh.getvalue(key)
			return True
		except IndexError:
			return False


environ = Environment()


class ZshPowerline(ShellPowerline):
	def init(self, **kwargs):
		super(ZshPowerline, self).init(Args(), **kwargs)

	def precmd(self):
		self.args.last_pipe_status = zsh.pipestatus()
		self.args.last_exit_code = zsh.last_exit_code()

	def do_setup(self, zsh_globals):
		set_prompt(self, 'PS1', 'left', None, above=True)
		set_prompt(self, 'RPS1', 'right', None)
		set_prompt(self, 'PS2', 'left', 'continuation')
		set_prompt(self, 'RPS2', 'right', 'continuation')
		set_prompt(self, 'PS3', 'left', 'select')
		used_powerlines[id(self)] = self
		zsh_globals['_powerline'] = self


class Prompt(object):
	__slots__ = ('powerline', 'side', 'savedpsvar', 'savedps', 'args', 'theme', 'above', '__weakref__')

	def __init__(self, powerline, side, theme, savedpsvar=None, savedps=None, above=False):
		self.powerline = powerline
		self.side = side
		self.above = above
		self.savedpsvar = savedpsvar
		self.savedps = savedps
		self.args = powerline.args
		self.theme = theme

	def __str__(self):
		zsh.eval('_POWERLINE_PARSER_STATE="${(%):-%_}"')
		segment_info = {
			'args': self.args,
			'environ': environ,
			'client_id': 1,
			'local_theme': self.theme,
			'parser_state': zsh.getvalue('_POWERLINE_PARSER_STATE'),
			'shortened_path': zsh.getvalue('_POWERLINE_SHORTENED_PATH'),
		}
		r = ''
		if self.above:
			for line in self.powerline.render_above_lines(
				width=zsh.columns() - 1,
				segment_info=segment_info,
			):
				r += line + '\n'
		r += self.powerline.render(
			width=zsh.columns(),
			side=self.side,
			segment_info=segment_info,
		)
		if type(r) is not str:
			if type(r) is bytes:
				return r.decode('utf-8')
			else:
				return r.encode('utf-8')
		return r

	def __del__(self):
		if self.savedps:
			zsh.setvalue(self.savedpsvar, self.savedps)
		self.powerline.shutdown()


def set_prompt(powerline, psvar, side, theme, above=False):
	try:
		savedps = zsh.getvalue(psvar)
	except IndexError:
		savedps = None
	zpyvar = 'ZPYTHON_POWERLINE_' + psvar
	prompt = Prompt(powerline, side, theme, psvar, savedps, above)
	zsh.eval('unset ' + zpyvar)
	zsh.set_special_string(zpyvar, prompt)
	zsh.setvalue(psvar, '${' + zpyvar + '}')
	return ref(prompt)


def reload():
	for powerline in tuple(used_powerlines.values()):
		powerline.reload()


def setup(zsh_globals):
	powerline = ZshPowerline()
	powerline.setup(zsh_globals)
	atexit.register(shutdown)
