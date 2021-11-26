import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;
import 'package:unapp/src/clases/usuarios.dart';
import 'package:unapp/src/preferencias/preferencias_usuario.dart';

class UsuarioProvider {
  final String _firebaseToken = 'AIzaSyC9rJ0nBwQLg1El6RQzQ7HoekaMgoLC4YI';
  final _prefs = new PreferenciasUsuario();

  Future<Map<String, dynamic>> login(String email, String pass) async {
    final authdata = {
      'email': email,
      'password': pass,
      'returnSecureToken': true
    };

    final respuesta = await http.post(
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$_firebaseToken',
        body: json.encode(authdata));

    Map<String, dynamic> decodeResp = json.decode(respuesta.body);
    print(decodeResp);

    if (decodeResp.containsKey('idToken')) {
      _prefs.token = decodeResp['idToken'];
      return {'ok': true, 'token': decodeResp['idToken']};
    } else {
      return {'ok': false, 'mensaje': decodeResp['error']['message']};
    }
  }

  Future<Map<String, dynamic>> nuevoUsuario(String email, String pass) async {
    final authdata = {
      'email': email,
      'password': pass,
      'returnSecureToken': true
    };

    final respuesta = await http.post(
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$_firebaseToken',
        body: json.encode(authdata));

    Map<String, dynamic> decodeResp = json.decode(respuesta.body);
    print(decodeResp);

    if (decodeResp.containsKey('idToken')) {
      _prefs.token = decodeResp['idToken'];
      return {'ok': true, 'token': decodeResp['idToken']};
    } else {
      return {'ok': false, 'mensaje': decodeResp['error']['message']};
    }
  }

  final String _url = 'https://practicas-flutter.firebaseio.com/';

  Future<bool> crearUsuario(Usuario usuario) async {
    final url = '$_url/usuarios.json';

    final resp = await http.post(url, body: usuarioToJson(usuario));

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;
  }

  Future<String> guardarUsuario(String nombre, String apellido, String dni,
      String email, String pass, String facultad) async {
    FirebaseMessaging nuevo = new FirebaseMessaging();
    nuevo.requestNotificationPermissions();
    String token = await nuevo.getToken();
    final datos = {
      'name': nombre,
      'last_name': apellido,
      'dni': dni,
      'email': email,
      'password': pass,
      'token': token,
      'school': facultad
    };
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'authorization': 'Basic c3R1ZHlkb3RlOnN0dWR5ZG90ZTEyMw=='
    };
    final respuesta = await http.post(
        'http://goxx.pythonanywhere.com/add/user/',
        headers: headers,
        body: json.encode(datos));

    String res = json.decode(respuesta.body);
    print(res);

    if (res = null) {
      return res;
    } else {
      return res;
    }
  }
}
