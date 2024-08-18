import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['es', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? esText = '',
    String? enText = '',
  }) =>
      [esText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // RegistroUsuario
  {
    'w531dvea': {
      'es': 'MACA',
      'en': 'Noise Pollution Monitoring and Alerts',
    },
    'ndp48nv5': {
      'es': 'Crear Cuenta',
      'en': 'Create Account',
    },
    'hbjiirfp': {
      'es': 'Comencemos completando el formulario a continuación.',
      'en': 'Let\'s get started by filling out the form below.',
    },
    'wn2568he': {
      'es': 'Nombre Competo',
      'en': 'Full Name',
    },
    '1ezchuqn': {
      'es': 'Email',
      'en': 'E-mail',
    },
    'y2ar1ncb': {
      'es': 'Telefono',
      'en': 'Phone',
    },
    '360n3j5u': {
      'es': 'Contraseña',
      'en': 'Password',
    },
    'cx5sg8yj': {
      'es': 'Confirmar Contraseña',
      'en': 'Confirm Password',
    },
    'h5p1lte6': {
      'es': 'Crear Cuenta',
      'en': 'Create Account',
    },
    'jdn1og69': {
      'es': 'Si ya tienes una cuenta  ',
      'en': 'If you already have an account',
    },
    'lrlqcvhm': {
      'es': 'Ingresa Aqui',
      'en': 'Enter Here',
    },
    'hvkuw0ar': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // login
  {
    'fcf8sww7': {
      'es': 'MACA',
      'en': 'Noise Pollution Monitoring and Alerts',
    },
    'jbm0vj4k': {
      'es': 'Monitoreo y Alerta de Contaminación Acústica ',
      'en': 'Welcome back',
    },
    '2inq44ae': {
      'es': 'Comencemos completando el formulario a continuación.',
      'en': 'Let\'s get started by filling out the form below.',
    },
    'dh2q240o': {
      'es': 'Email',
      'en': 'E-mail',
    },
    'io5j2n68': {
      'es': 'Contraseña',
      'en': 'Password',
    },
    'll2nvrhv': {
      'es': 'Iniciar sesión',
      'en': 'Log in',
    },
    '1qhjel88': {
      'es': 'Registrate aquí',
      'en': 'sign up here',
    },
    'kahc4m9v': {
      'es': '¿Olvidaste la clave?',
      'en': '',
    },
    'mfyuz3o2': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // PaginaInicio
  {
    'w8wi580t': {
      'es': 'MACA',
      'en': 'Noise Pollution Monitoring and Alerts',
    },
    '70bb80nr': {
      'es': 'Monitoreo y Alerta de Contaminación Acústica ',
      'en':
          'Thank you for joining! Log in or create your account below and start your journey!',
    },
    '4979asxn': {
      'es': 'Ingresar',
      'en': 'Get into',
    },
    'csgbpopf': {
      'es': 'Home',
      'en': '',
    },
  },
  // dash1
  {
    '73bv5nhd': {
      'es': 'Tasks',
      'en': 'Tasks',
    },
    'fb97yhwx': {
      'es': 'Completed',
      'en': 'Completed',
    },
    'g9nbl1jg': {
      'es': 'Last 30 Days',
      'en': 'Last 30 Days',
    },
    'ee6x2u8j': {
      'es': 'Avg. Grade',
      'en': 'Avg. Grade',
    },
    'ji2sfpm8': {
      'es': 'Tasks',
      'en': 'Tasks',
    },
    'dmvphtyt': {
      'es': 'A summary of outstanding tasks.',
      'en': 'A summary of outstanding tasks.',
    },
    'g9a8twf8': {
      'es': 'Task Type',
      'en': 'Task Type',
    },
    'wzjo2hdk': {
      'es':
          'Task Description here this one is really long and it goes over maybe? And goes to two lines.',
      'en':
          'Task Description here this one is really long and it goes over maybe? And it goes to two lines.',
    },
    'ylf8gsz0': {
      'es': 'Due',
      'en': 'Due',
    },
    'xeilczr7': {
      'es': 'Today, 5:30pm',
      'en': 'Today, 5:30pm',
    },
    'o2lwwg4k': {
      'es': 'Update',
      'en': 'Update',
    },
    '4aw554ci': {
      'es': '1',
      'en': '1',
    },
    'v0ec18ks': {
      'es': 'Task Type',
      'en': 'Task Type',
    },
    '4glpna1a': {
      'es':
          'Task Description here this one is really long and it goes over maybe? And goes to two lines.',
      'en':
          'Task Description here this one is really long and it goes over maybe? And it goes to two lines.',
    },
    'fzx9iccj': {
      'es': 'Due',
      'en': 'Due',
    },
    'k3cievzb': {
      'es': 'Today, 5:30pm',
      'en': 'Today, 5:30pm',
    },
    'qzv4np63': {
      'es': 'Update',
      'en': 'Update',
    },
    'm05zzexx': {
      'es': '1',
      'en': '1',
    },
    '7yfbc8ae': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // PerfilAdmin
  {
    'lz2n0zo6': {
      'es': 'Editar Perfil',
      'en': 'Edit profile',
    },
    'qnq7h7ay': {
      'es': 'Cambiar Contraseña',
      'en': '',
    },
    'gamjts0z': {
      'es': 'Panel de Administacion',
      'en': 'Account settings',
    },
    't02xr18p': {
      'es': 'Cerrar sesión',
      'en': 'Sign off',
    },
    '8bbey2lz': {
      'es': 'Perfil de Administración',
      'en': '',
    },
    'm0s6wl0q': {
      'es': '__',
      'en': '__',
    },
  },
  // EditarPerfil
  {
    '257l0k26': {
      'es': 'Guardar Cambios',
      'en': '',
    },
    'ncna7nbx': {
      'es': 'Editar perfil',
      'en': '',
    },
  },
  // RecuperarClave
  {
    'mle41a9i': {
      'es': 'Has olvidado tu contraseña',
      'en': '',
    },
    'tdlcm4ob': {
      'es':
          'Le enviaremos un correo electrónico con un enlace para restablecer su contraseña; ingrese el correo electrónico asociado con su cuenta a continuación.',
      'en': '',
    },
    'ayuklw2h': {
      'es': 'Correo electronico ...',
      'en': '',
    },
    'hchqh82b': {
      'es': 'Ecribe tu correo ...',
      'en': '',
    },
    '4cx6gnlh': {
      'es': 'Recuperar',
      'en': '',
    },
    'xstolvq4': {
      'es': 'Recuperación de Contraseña',
      'en': '',
    },
    'wa825cy3': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // PerfilUsuario
  {
    'yg1r02kp': {
      'es': 'Editar Perfil',
      'en': '',
    },
    'g3g3rn49': {
      'es': 'Cambiar Contraseña',
      'en': '',
    },
    'w5hdj8z1': {
      'es': 'Eliminar Cuenta',
      'en': '',
    },
    '08powxhm': {
      'es': 'Cerrar sesión',
      'en': '',
    },
    'h3s495y9': {
      'es': 'Perfil de Usuario',
      'en': '',
    },
    'p5cu33np': {
      'es': '__',
      'en': '',
    },
  },
  // AdministrarUsuarios
  {
    'wn8g8ms0': {
      'es': 'Buscar...',
      'en': '',
    },
    'a6yzujlr': {
      'es': 'Conincidencia de busqueda',
      'en': '',
    },
    '08qyz6hf': {
      'es': '24',
      'en': '',
    },
    '7zg1c4qw': {
      'es': 'Gestionar Usuarios',
      'en': '',
    },
    '4zq0q4kd': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // MenuAministracion
  {
    'p2mp4roa': {
      'es': 'Este es el munu para los usuarios con rol de administrador',
      'en': '',
    },
    '8ag2yi0d': {
      'es': 'Menu Administracion',
      'en': '',
    },
    'g6tlcyj2': {
      'es': 'Usuarios',
      'en': '',
    },
    'lcykfkva': {
      'es': 'Tableros',
      'en': '',
    },
    'n1pl51rp': {
      'es': '56.4k',
      'en': '',
    },
    '3hsqsgxs': {
      'es': 'Customers',
      'en': '',
    },
    'bsesskj7': {
      'es': '56.4k',
      'en': '',
    },
    'flp5ulgz': {
      'es': 'Customers',
      'en': '',
    },
    'yxabhsv4': {
      'es': 'Panel de Administración',
      'en': '',
    },
    'zwv83t39': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // Detalleusuario
  {
    'oq63vs4h': {
      'es': 'Es Administrador',
      'en': '',
    },
    '2v9kn4ay': {
      'es': '',
      'en': '',
    },
    '1swir9bp': {
      'es': 'Eliminar',
      'en': '',
    },
    'm3zjshu0': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // pass55
  {
    'aa8miz9p': {
      'es': 'Back',
      'en': '',
    },
    '5f45e282': {
      'es': 'Forgot Password',
      'en': '',
    },
    '96n751n1': {
      'es':
          'We will send you an email with a link to reset your password, please enter the email associated with your account below.',
      'en': '',
    },
    '96keum7e': {
      'es': 'Your email address...',
      'en': '',
    },
    'ura0f8xg': {
      'es': 'Enter your email...',
      'en': '',
    },
    '5qx2kzje': {
      'es': 'Send Link',
      'en': '',
    },
    'j75o20hv': {
      'es': 'Page Title',
      'en': '',
    },
    'jwq5qu3k': {
      'es': 'Home',
      'en': '',
    },
  },
  // CambiarClave
  {
    'vjyexf7b': {
      'es': 'Cambiar la contraseña',
      'en': '',
    },
    'io5t7hlr': {
      'es': 'Contraseña actual',
      'en': '',
    },
    '6xosvjrv': {
      'es': 'Nueva contraseña',
      'en': '',
    },
    'iuovvwrc': {
      'es': 'Confirmar nueva contraseña',
      'en': '',
    },
    'l9varrp3': {
      'es': 'Cambiar la contraseña',
      'en': '',
    },
  },
  // EliminarUsuario
  {
    'gftuzb6t': {
      'es': 'Deseas eliminar la cuenta del usuario?',
      'en': '',
    },
    '73fzdvpu': {
      'es': 'Eliminar Cuenta',
      'en': '',
    },
    'qgqt0jia': {
      'es': 'Cancelar',
      'en': '',
    },
  },
  // Miscellaneous
  {
    '3dx6ti5b': {
      'es': '',
      'en': '',
    },
    '5doy0473': {
      'es': '',
      'en': '',
    },
    'ssei8db2': {
      'es': '',
      'en': 'Error',
    },
    'tkiv6fyr': {
      'es': 'Se envió  correo electrónico de restablecimiento de contraseña',
      'en': 'Password reset email sent',
    },
    's0fyy6rp': {
      'es': 'Correo electronico requerido !',
      'en': 'Email required !',
    },
    'g2hzu2s3': {
      'es': 'Se requiere número de teléfono',
      'en': 'Phone number required',
    },
    'tgm817m2': {
      'es': 'Las contraseñas no coinciden',
      'en': 'Passwords do not match',
    },
    '896fs5r8': {
      'es': 'ingrese el código de verificación enviado por SMS',
      'en': 'Enter the verification code sent by SMS',
    },
    'pf6i6bvm': {
      'es':
          'Ha pasado demasiado tiempo desde el inicio de sesión más reciente. Inicie sesión nuevamente antes de eliminar su cuenta.',
      'en':
          'It\'s been too long since your last login. Please log in again before deleting your account.',
    },
    'edsz3fq0': {
      'es':
          'Ha pasado demasiado tiempo desde el inicio de sesión más reciente. Inicie sesión nuevamente antes de actualizar su correo electrónico.',
      'en':
          'It\'s been too long since your last login. Please log in again before updating your email.',
    },
    '4j62x84a': {
      'es': '¡Confirmación de cambio por correo electrónico enviada!',
      'en': 'Confirmation of change by email sent!',
    },
    '2fh23tou': {
      'es': 'Correo electrónico ya en uso por otra cuenta',
      'en': 'Email already in use by another account',
    },
    'ohsoj2e3': {
      'es':
          'la credencial de autenticación proporcionada es incorrecta, está mal formada o ha caducado',
      'en':
          'The authentication credential provided is incorrect, malformed, or expired',
    },
    '6x6eb5ry': {
      'es': '',
      'en': '',
    },
    'u5bt4k7f': {
      'es': '',
      'en': '',
    },
    'bfo0t3jz': {
      'es': '',
      'en': '',
    },
    'jvjxs8xk': {
      'es': '',
      'en': '',
    },
    'szziuwj4': {
      'es': '',
      'en': '',
    },
    '7imp5912': {
      'es': '',
      'en': '',
    },
    'edh5nsya': {
      'es': '',
      'en': '',
    },
    'yarius84': {
      'es': '',
      'en': '',
    },
    'wxdn2kcv': {
      'es': '',
      'en': '',
    },
    '2vx9gs71': {
      'es': '',
      'en': '',
    },
    'lj2jlir3': {
      'es': '',
      'en': '',
    },
    '9ni9ee1i': {
      'es': '',
      'en': '',
    },
    '82ofja17': {
      'es': '',
      'en': '',
    },
    'ko5gqag8': {
      'es': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
