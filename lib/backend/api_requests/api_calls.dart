import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start statusAlumno Group Code

class StatusAlumnoGroup {
  static String baseUrl =
      'https://wso2am.um.edu.mx/t/um.contabilidad/academico/1.0/alumno';
  static Map<String, String> headers = {
    'Authentication': 'Bearer [token]',
  };
  static ObtieneCarreraCall obtieneCarreraCall = ObtieneCarreraCall();
}

class ObtieneCarreraCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? matricula = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'obtieneCarrera',
      apiUrl: '${StatusAlumnoGroup.baseUrl}/obtiene/carrera/${matricula}',
      callType: ApiCallType.GET,
      headers: {
        ...StatusAlumnoGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End statusAlumno Group Code

class AreasCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'areas',
      apiUrl: 'https://am.um.edu.mx/buzon/api/cuestionario/areas',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
    );
  }
}

class PreguntasCall {
  static Future<ApiCallResponse> call({
    String? areaId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'preguntas',
      apiUrl:
          'https://am.um.edu.mx/buzon/api/cuestionario/preguntas/${areaId}/N',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'areaId': areaId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
    );
  }

  static dynamic preguntas(dynamic response) => getJsonField(
        response,
        r'''$[:].descripcion''',
        true,
      );
  static dynamic departamento(dynamic response) => getJsonField(
        response,
        r'''$[:].area.nombre''',
        true,
      );
  static dynamic idPreguntaN(dynamic response) => getJsonField(
        response,
        r'''$[:].preguntaId''',
        true,
      );
}

class PreguntaTextoCall {
  static Future<ApiCallResponse> call({
    String? areaId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'PreguntaTexto',
      apiUrl:
          'https://am.um.edu.mx/buzon/api/cuestionario/preguntas/${areaId}/T',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'areaId': areaId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
    );
  }

  static dynamic preguntaUltima(dynamic response) => getJsonField(
        response,
        r'''$[:].descripcion''',
      );
  static dynamic preguntaId(dynamic response) => getJsonField(
        response,
        r'''$[:].preguntaId''',
        true,
      );
  static dynamic departamento(dynamic response) => getJsonField(
        response,
        r'''$[:].area.nombre''',
      );
}

class RespuestaApiCall {
  static Future<ApiCallResponse> call({
    String? preguntaId = '',
    double? respuestaNumero,
    int? codigo,
    String? respuestaTexto = '',
  }) {
    final body = '''
{
  "pregunta": {
    "preguntaId": "${preguntaId}"
  },
  "respuestaNumero": ${respuestaNumero},
  "codigo": ${codigo},
  "respuestaTexto": "${respuestaTexto}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'RespuestaApi',
      apiUrl: 'https://am.um.edu.mx/buzon/api/cuestionario/respuesta',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class LogCall {
  static Future<ApiCallResponse> call({
    String? grantType = 'password',
    String? username = '',
    String? password = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'log',
      apiUrl:
          'https://wso2am.um.edu.mx/t/um.movil/um-security/1.0/oauth2/token',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Basic ZmtUTURVamhOOG53WjNHRXNLbF9YWlFqdWRZYTpzZXJBV1JrWl9BdnJsck5CekNaeFpISXJranNh',
      },
      params: {
        'grant_type': grantType,
        'username': username,
        'password': password,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UserCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'user',
      apiUrl:
          'https://wso2is.um.edu.mx/t/um.movil/api/identity/user/v1.0/me?schem=openId',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'schema': "openId",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class RecoveryPasswordCall {
  static Future<ApiCallResponse> call({
    String? username = '',
  }) {
    final body = '''
{
  "user": {
    "username": "${username}",
    "realm": "PRIMARY",
    "tenant-domain": "um.movil"
  },
  "properties": []
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'recoveryPassword',
      apiUrl:
          'https://wso2is.um.edu.mx/t/um.movil/api/identity/recovery/v0.9/recover-password?type=email&notify=true',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Basic bGFmdWVudGVAdW0ubW92aWw6Sm9rZXIyNDA0',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class SelfRegistrationCall {
  static Future<ApiCallResponse> call({
    String? username = '',
    String? password = '',
    String? emailAddress = '',
  }) {
    final body = '''
{
  "user": {
    "username": "${username}",
    "realm": "PRIMARY",
    "password": "${password}",
    "claims": [
      {
        "uri": "http://wso2.org/claims/emailaddress",
        "value": "${emailAddress}"
      }
    ]
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'selfRegistration',
      apiUrl: 'https://wso2is.um.edu.mx/t/um.movil/api/identity/user/v1.0/me',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Basic bGFmdWVudGVAdW0ubW92aWw6Sm9rZXIyNDA0',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class CalendarEventsCall {
  static Future<ApiCallResponse> call({
    String? cliendId = '',
    String? token = '',
    String? grantType = '',
    String? clientSecret = '',
    String? username = '',
    String? password = '',
    String? calendarId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'calendarEvents',
      apiUrl:
          'https://www.googleapis.com/calendar/v3/calendars/${calendarId}/events',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'access_type': "offline",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic googleEvents(dynamic response) => getJsonField(
        response,
        r'''$.items''',
        true,
      );
  static dynamic googleEventType(dynamic response) => getJsonField(
        response,
        r'''$.items[:].eventType''',
        true,
      );
  static dynamic googleDescription(dynamic response) => getJsonField(
        response,
        r'''$.items[:].description''',
        true,
      );
  static dynamic googleStartD(dynamic response) => getJsonField(
        response,
        r'''$.items[:].start.date''',
        true,
      );
  static dynamic googleStartDT(dynamic response) => getJsonField(
        response,
        r'''$.items[:].start.dateTime''',
        true,
      );
  static dynamic googleEndD(dynamic response) => getJsonField(
        response,
        r'''$.items[:].end.date''',
        true,
      );
  static dynamic googleEndDT(dynamic response) => getJsonField(
        response,
        r'''$.items[:].end.dateTime''',
        true,
      );
}

class TestMetodoCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'testMetodo',
      apiUrl: 'https://accounts.google.com/o/oauth2/v2/auth',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'scope': "scope",
        'response_type': "code",
        'state':
            "security_token%3D138r5719ru3e1%26url%3Dhttps%3A%2F%2Foauth2.example.com%2Ftoken",
        'redirect_uri':
            "https://testdemo-5f4be.firebaseapp.com/__/auth/handler",
        'client_id':
            "400384978728-lg0fh12vobpuq862c70emlgr4fo01qs2.apps.googleusercontent.com",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetCodeVerifCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'getCodeVerif',
      apiUrl: 'https://oauth2.googleapis.com/device/code',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'client_id':
            "400384978728-8rhtmk337hidlqk9f8us7b5kon0vipne.apps.googleusercontent.com",
        'scope': "email",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic deviceCode(dynamic response) => getJsonField(
        response,
        r'''$.device_code''',
      );
  static dynamic userCode(dynamic response) => getJsonField(
        response,
        r'''$.user_code''',
      );
}

class GetTokenApiCall {
  static Future<ApiCallResponse> call({
    String? deviceCode = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getTokenApi',
      apiUrl: 'https://oauth2.googleapis.com/token',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {
        'client_id':
            "400384978728-8rhtmk337hidlqk9f8us7b5kon0vipne.apps.googleusercontent.com",
        'client_secret': "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",
        'device_code': deviceCode,
        'grant_type': "urn:ietf:params:oauth:grant-type:device_code",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
