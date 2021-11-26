import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:unapp/src/providers/push_notificaciones_provider.dart';

class Token {
  String token;

  get traerToken {
    return this.token.toString();
  }

  set recibirToken(String tok) {
    this.token = tok;
  }

  // Token(String token) {
  //   this.token = token;
  // }
}
