import 'dart:async';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:unapp/src/clases/token.dart';

class NotificacionesPushProvider {
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  final _mensajeStreamController = StreamController<dynamic>.broadcast();
  Stream<dynamic> get mensajes => _mensajeStreamController.stream;

  initNotifications() {
    _firebaseMessaging.requestNotificationPermissions();

    _firebaseMessaging.configure(
      onMessage: (info) {
        print('On Message');
        print(info);

        var argumento;
        if (Platform.isAndroid) {
          argumento = info['data'];
        }

        print(argumento);

        _mensajeStreamController.sink.add(argumento);
      },
      onLaunch: (info) {
        print('On Lunch');
        print(info);

        final noti = info['data'];
        _mensajeStreamController.sink.add(noti);
      },
      onResume: (info) {
        print('On Resume');
        print(info);

        final noti = info['data'];
        _mensajeStreamController.sink.add(noti);
      },
    );
  }

  dispose() {
    _mensajeStreamController.close();
  }
}
