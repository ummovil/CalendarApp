import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['es', 'en', 'fr', 'pt'];

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
    String? frText = '',
    String? ptText = '',
  }) =>
      [esText, enText, frText, ptText][languageIndex] ?? '';

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
  // Login
  {
    '818a6qcb': {
      'es': 'Matrícula',
      'en': 'Tuition',
      'fr': 'Frais de scolarité',
      'pt': 'Mensalidade',
    },
    '17j1ptlt': {
      'es': 'Contraseña',
      'en': 'Password',
      'fr': 'Mot de passe',
      'pt': 'Senha',
    },
    'zhvyrg86': {
      'es': 'LOGIN',
      'en': 'LOGIN',
      'fr': 'SE CONNECTER',
      'pt': 'CONECTE-SE',
    },
    '9fiwrl4e': {
      'es': '¿Has olvidado tu contraseña?  ',
      'en': 'have you forgotten your password?',
      'fr': 'Avez-vous oublié votre mot de passe?',
      'pt': 'Esqueceu sua senha?',
    },
    '7ve4xhin': {
      'es': 'Aviso de privacidad UM  ',
      'en': 'UM Privacy Notice',
      'fr': 'Avis de confidentialité de la messagerie unifiée',
      'pt': 'Aviso de privacidade da UM',
    },
  },
  // Perfil
  {
    'bqtffn1j': {
      'es': 'Matrícula',
      'en': 'Tuition',
      'fr': 'Frais de scolarité',
      'pt': 'Mensalidade',
    },
    'ox9ti546': {
      'es': 'Credencial de estudiante',
      'en': 'Student ID',
      'fr': 'Carte d\'étudiant',
      'pt': 'Identidade estudantil',
    },
    'rxj25bru': {
      'es': 'Av. Libertad 1300 Pte.',
      'en': 'Av. Libertad 1300 Pte.',
      'fr': 'Av. Libertad 1300 Pte.',
      'pt': 'Av. Libertad 1300 Pte.',
    },
    'bb9is59m': {
      'es': 'Montemorelos, N.L.; México 67500',
      'en': 'Montemorelos, N.L.; Mexico 67500',
      'fr': 'Montemorelos, T.-N.-L. ; Mexique 67500',
      'pt': 'Montemorelos, NL; México 67500',
    },
    'ecg7yuz4': {
      'es': 'www.um.edu.mx',
      'en': 'www.um.edu.mx',
      'fr': 'www.um.edu.mx',
      'pt': 'www.um.edu.mx',
    },
    'ndgaqazj': {
      'es':
          'LA UNIVERSIDAD DE MONTEMORELOS ES PROPIETARIA DE ESTA CREDENCIAL REPÓRTALA SI LA ENCONTRASTE',
      'en':
          'THE UNIVERSITY OF MONTEMORELOS IS THE OWNER OF THIS CREDENTIAL REPORT IT IF YOU FIND IT',
      'fr':
          'L\'UNIVERSITÉ DE MONTEMORELOS EST PROPRIÉTAIRE DE CE RAPPORT DE CRÉDITATION SI VOUS LE TROUVEZ',
      'pt':
          'A UNIVERSIDADE DE MONTEMORELOS É A PROPRIETÁRIA DESTA CREDENCIAL RELATE SE A ENCONTRAR',
    },
    'nxb9yrq5': {
      'es': '01.800.821.7500',
      'en': '01.800.821.7500',
      'fr': '01.800.821.7500',
      'pt': '01.800.821.7500',
    },
    '9atiec8n': {
      'es': 'JUN-AGO',
      'en': 'JUNE-AUG',
      'fr': 'JUIN-AOÛT',
      'pt': 'JUNHO-AGOSTO',
    },
    '0febwnaz': {
      'es': 'AGO-ENE',
      'en': 'AUG-JAN',
      'fr': 'AOÛT-JANVIER',
      'pt': 'AGO-JAN',
    },
    '2gx8bnab': {
      'es': 'ENE-MAY',
      'en': 'JAN-MAY',
      'fr': 'JAN-MAI',
      'pt': 'JAN-MAIO',
    },
    'g367z0ss': {
      'es': 'Home',
      'en': 'home',
      'fr': 'maison',
      'pt': 'lar',
    },
  },
  // HomePage
  {
    '55f9xryg': {
      'es': 'CÓDIGO QR',
      'en': 'QR CODE',
      'fr': 'QR CODE',
      'pt': 'CÓDIGO QR',
    },
    'c7n4462z': {
      'es': 'Escanear QR',
      'en': 'Scan QR',
      'fr': 'Scanner le QR',
      'pt': 'Digitalize QR',
    },
    'fbh9jcbi': {
      'es': 'Home',
      'en': 'home',
      'fr': 'maison',
      'pt': 'lar',
    },
  },
  // Formulario
  {
    'lh6rxfuu': {
      'es':
          'Este formulario consta de cinco opciones de respuesta que van desde \"Totalmente en desacuerdo\" hasta \"Totalmente de acuerdo\" representadas por estrellas.',
      'en':
          'This form consists of five response options ranging from “Strongly Disagree” to “Strongly Agree” represented by stars.',
      'fr':
          'Ce formulaire se compose de cinq options de réponse allant de « Fortement en désaccord » à « Tout à fait d’accord » représentées par des étoiles.',
      'pt':
          'Este formulário consiste em cinco opções de resposta que vão de “Discordo totalmente” a “Concordo totalmente” representadas por estrelas.',
    },
    'w0fw58pz': {
      'es': 'Comentario',
      'en': 'Comment',
      'fr': 'Commentaire',
      'pt': 'Comente',
    },
    'hgwnt9n2': {
      'es': 'PREGUNTAS',
      'en': 'QUESTIONS',
      'fr': 'DES QUESTIONS',
      'pt': 'QUESTÕES',
    },
    '0tipiqah': {
      'es': 'Enviar',
      'en': 'Send',
      'fr': 'Envoyer',
      'pt': 'Enviar',
    },
    'mvfjqkg3': {
      'es': 'Field is required',
      'en': 'Field is required',
      'fr': 'Champ requis',
      'pt': 'Campo é obrigatório',
    },
    'ug2osjp1': {
      'es': 'Field is required',
      'en': 'Field is required',
      'fr': 'Champ requis',
      'pt': 'Campo é obrigatório',
    },
    '4rtuqvvy': {
      'es': 'Field is required',
      'en': 'Field is required',
      'fr': 'Champ requis',
      'pt': 'Campo é obrigatório',
    },
    '93mspd5c': {
      'es': 'Field is required',
      'en': 'Field is required',
      'fr': 'Champ requis',
      'pt': 'Campo é obrigatório',
    },
  },
  // Calendario
  {
    'k58usv4e': {
      'es': 'Calendario Personal',
      'en': 'Personal Calendar',
      'fr': 'Calendrier personnel',
      'pt': 'Calendário Pessoal',
    },
    '5i9q1wxd': {
      'es': 'Cancel',
      'en': 'Cancel',
      'fr': 'Annuler',
      'pt': 'Cancelar',
    },
    'uwztbati': {
      'es': 'Tema',
      'en': 'Issue',
      'fr': 'Problème',
      'pt': 'Emitir',
    },
    'qld174op': {
      'es': 'Configuraciones',
      'en': 'Settings',
      'fr': 'Paramètres',
      'pt': 'Configurações',
    },
    'xsejeknv': {
      'es': 'Idioma',
      'en': 'Language',
      'fr': 'langage',
      'pt': 'Linguagem',
    },
    'nc8uvitk': {
      'es': 'Cerrar Sesión',
      'en': 'Sign off',
      'fr': 'Fermer la session',
      'pt': 'Fechar Sessão',
    },
    'ohxqgci5': {
      'es': 'Home',
      'en': 'home',
      'fr': 'maison',
      'pt': 'lar',
    },
  },
  // Settings
  {
    'qw8o96z4': {
      'es': 'CONFIGURACIÓN',
      'en': 'SETTING',
      'fr': 'PARAMÈTRE',
      'pt': 'CONTEXTO',
    },
    '5zhvcjkh': {
      'es': 'Seleccionar Tema',
      'en': 'Select Theme',
      'fr': 'Sélectionne un thème',
      'pt': 'Selecione o tema',
    },
    'kuknn1ya': {
      'es': 'Seleccionar Idioma',
      'en': 'Select language',
      'fr': 'Choisir la langue',
      'pt': 'Selecione o idioma',
    },
    'nf9s6bix': {
      'es': 'Home',
      'en': 'home',
      'fr': 'maison',
      'pt': 'lar',
    },
  },
  // Pagos
  {
    '3fkn80d5': {
      'es': 'Home',
      'en': 'home',
      'fr': 'maison',
      'pt': 'lar',
    },
  },
  // mobileNav
  {
    'hy74yavn': {
      'es': 'Inicio',
      'en': 'Start',
      'fr': 'Début',
      'pt': 'Começar',
    },
  },
  // detailsItemDialog
  {
    'vkq1ealv': {
      'es': 'Editar',
      'en': 'Edit',
      'fr': 'Modifier',
      'pt': 'Editar',
    },
  },
  // recuperaPassword
  {
    'dju1y9ne': {
      'es': 'Recuperacion de contraseña',
      'en': 'Password recovery',
      'fr': 'Récupération de mot de passe',
      'pt': 'Recuperação de senha',
    },
    'ktoresp6': {
      'es':
          'Ingresa tu matrícula, haz clic en el botón de abajo y te mandarémos una dirección url de recuperación.',
      'en':
          'Enter your license plate, click the button below and we will send you a recovery URL.',
      'fr':
          'Entrez votre plaque d\'immatriculation, cliquez sur le bouton ci-dessous et nous vous enverrons une URL de récupération.',
      'pt':
          'Insira sua placa, clique no botão abaixo e enviaremos um URL de recuperação.',
    },
    'l9e1owd1': {
      'es': 'Ingresa tu numero de matricula',
      'en': 'Enter your registration number',
      'fr': 'Entrez votre numéro d\'immatriculation',
      'pt': 'Digite seu número de registro',
    },
    'y91g32yl': {
      'es': 'Enviar',
      'en': 'Send',
      'fr': 'Envoyer',
      'pt': 'Enviar',
    },
  },
  // createEventDialog
  {
    'nora2xfr': {
      'es': 'Título',
      'en': 'Qualification',
      'fr': 'Qualification',
      'pt': 'Qualificação',
    },
    'bqyguuex': {
      'es': 'Descripción',
      'en': 'Description',
      'fr': 'Description',
      'pt': 'Descrição',
    },
    '2h855u3o': {
      'es': 'Ubicación',
      'en': 'Location',
      'fr': 'Emplacement',
      'pt': 'Localização',
    },
    'my2vhbia': {
      'es': 'Todo el día',
      'en': 'All day',
      'fr': 'Toute la journée',
      'pt': 'Todo o dia',
    },
    'z6g43ev3': {
      'es': 'Color predeterminado',
      'en': 'Default color',
      'fr': 'Couleur par défaut',
      'pt': 'Cor padrão',
    },
  },
  // Miscellaneous
  {
    'hhgl8hs8': {
      'es': '',
      'en': '',
      'fr': '',
      'pt': '',
    },
    'xq164c6c': {
      'es': 'inicia sesion con tu huella o faceID',
      'en': 'log in with your fingerprint or faceID',
      'fr': 'connectez-vous avec votre empreinte digitale ou votre faceID',
      'pt': 'faça login com sua impressão digital ou faceID',
    },
    'r51qh8mv': {
      'es': 'Recibe mensajes siempre',
      'en': 'Always receive messages',
      'fr': 'Recevez toujours des messages',
      'pt': 'Sempre receba mensagens',
    },
    'v9f5wl4d': {
      'es': 'Calendar',
      'en': 'Calendar',
      'fr': 'Calendrier',
      'pt': 'Calendário',
    },
    'i14v8w4v': {
      'es': '',
      'en': '',
      'fr': '',
      'pt': '',
    },
    'l08w7kdp': {
      'es': '',
      'en': '',
      'fr': '',
      'pt': '',
    },
    'xp4qdrcv': {
      'es': '',
      'en': '',
      'fr': '',
      'pt': '',
    },
    'vrrd9gym': {
      'es': '',
      'en': '',
      'fr': '',
      'pt': '',
    },
    'hthq8t6t': {
      'es': '',
      'en': '',
      'fr': '',
      'pt': '',
    },
    '4txrjfjb': {
      'es': '',
      'en': '',
      'fr': '',
      'pt': '',
    },
    'eo7lfxda': {
      'es': '',
      'en': '',
      'fr': '',
      'pt': '',
    },
    '9nujg2mq': {
      'es': '',
      'en': '',
      'fr': '',
      'pt': '',
    },
    '1yeah5a9': {
      'es': '',
      'en': '',
      'fr': '',
      'pt': '',
    },
    'ml5g5pec': {
      'es': '',
      'en': '',
      'fr': '',
      'pt': '',
    },
    'i04gfqd2': {
      'es': '',
      'en': '',
      'fr': '',
      'pt': '',
    },
    'n7b6zjzp': {
      'es': '',
      'en': '',
      'fr': '',
      'pt': '',
    },
    '3fb6n773': {
      'es': '',
      'en': '',
      'fr': '',
      'pt': '',
    },
    'z0k1o2e6': {
      'es': '',
      'en': '',
      'fr': '',
      'pt': '',
    },
    'pqo43kva': {
      'es': '',
      'en': '',
      'fr': '',
      'pt': '',
    },
    'd53d25o0': {
      'es': '',
      'en': '',
      'fr': '',
      'pt': '',
    },
    '1trxoces': {
      'es': '',
      'en': '',
      'fr': '',
      'pt': '',
    },
    'g5rb80o8': {
      'es': '',
      'en': '',
      'fr': '',
      'pt': '',
    },
    'rwzkiohs': {
      'es': '',
      'en': '',
      'fr': '',
      'pt': '',
    },
    'liwclaxx': {
      'es': '',
      'en': '',
      'fr': '',
      'pt': '',
    },
    'v5gxly55': {
      'es': '',
      'en': '',
      'fr': '',
      'pt': '',
    },
    '9k6ojchf': {
      'es': '',
      'en': '',
      'fr': '',
      'pt': '',
    },
    'vegvdpz8': {
      'es': '',
      'en': '',
      'fr': '',
      'pt': '',
    },
  },
].reduce((a, b) => a..addAll(b));
