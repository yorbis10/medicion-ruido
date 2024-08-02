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
  // Registro
  {
    'w531dvea': {
      'es': 'Monitoreo y Alerta de Contaminación Acústica ',
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
      'es': 'Monitoreo y Alerta de Contaminación Acústica ',
      'en': 'Noise Pollution Monitoring and Alerts',
    },
    'jbm0vj4k': {
      'es': 'Bienvenido de nuevo',
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
    '0vdtqabf': {
      'es': '¿No tienes una cuenta?  ',
      'en': 'You do not have an account?',
    },
    '1qhjel88': {
      'es': 'Registrate aquí',
      'en': 'sign up here',
    },
    'mfyuz3o2': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // PaginaInicio
  {
    'yzdx0dhz': {
      'es': 'Monitoreo y Alerta de Contaminación Acústica ',
      'en': 'Noise Pollution Monitoring and Alerts',
    },
    '70bb80nr': {
      'es':
          '¡Gracias por unirte! ¡Acceda o cree su cuenta a continuación y comience su viaje!',
      'en':
          'Thank you for joining! Log in or create your account below and start your journey!',
    },
    '4979asxn': {
      'es': 'Ingresar',
      'en': 'Get into',
    },
    'kk3i0bg2': {
      'es': 'Home',
      'en': 'home',
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
  // Perfil
  {
    '7fnt7kbp': {
      'es': 'Active',
      'en': 'Active',
    },
    'lz2n0zo6': {
      'es': 'Editar perfil',
      'en': 'Edit profile',
    },
    'gamjts0z': {
      'es': 'Configuracion de la cuenta',
      'en': 'Account settings',
    },
    't02xr18p': {
      'es': 'Cerrar sesión',
      'en': 'Sign off',
    },
    'm0s6wl0q': {
      'es': '__',
      'en': '__',
    },
  },
  // Miscellaneous
  {
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
