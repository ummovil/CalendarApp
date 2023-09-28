// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

//Esta accion importa el paquete de onesignal para poder utilizar las funciones de la dependencia.
import 'package:onesignal_flutter/onesignal_flutter.dart';

Future setConfigOneSignalV3() async {
  // Esta línea activa el modo debug y configura los logs. Es útil
// cuando estamos comenzando con nuestra integración para tener información
// en caso de errores. Si pasamos a producción, la podemos eliminar.
  //OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

// En esta línea debemos indicar el ID de nuestra app de OneSignal.
  //OneSignal.shared.setAppId("b774795e-7e1a-4ab9-a19b-661e98b9267a");
  OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

// En esta línea debemos indicar el ID de nuestra app de OneSignal.
  OneSignal.shared.setAppId("b774795e-7e1a-4ab9-a19b-661e98b9267a");

// Este método muestra la pantalla nativa para que el usuario otorgue
// permisos para recibir notificaciones. Si nuestra aplicación tiene
// una pantalla de "onboarding" o "introducción", podemos llamar esta función
// en la pantalla correspondiente para mejorar la experiencia de usuario
  OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
    print("Accepted permission: $accepted");
  });
}
