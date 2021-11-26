import 'dart:async';

import 'package:rxdart/rxdart.dart';

class LoginBloc {
  final _emailController = BehaviorSubject<String>();
  final _passController = BehaviorSubject<String>();
  final _nombreController = BehaviorSubject<String>();
  final _apellidoController = BehaviorSubject<String>();
  final _dniController = BehaviorSubject<String>();

  //Recuperar los datos del Stream
  Stream<String> get emailStream => _emailController.stream;
  Stream<String> get passStream => _passController.stream;
  Stream<String> get nombreStream => _nombreController.stream;
  Stream<String> get apellidoStream => _apellidoController.stream;
  Stream<String> get dniStream => _dniController.stream;

  //Insertar valores al steam
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePass => _passController.sink.add;
  Function(String) get changeNombre => _nombreController.sink.add;
  Function(String) get changeApellido => _apellidoController.sink.add;
  Function(String) get changeDni => _dniController.sink.add;

  //Obtener valor de los streams
  String get email => _emailController.value;
  String get pass => _passController.value;
  String get nombre => _nombreController.value;
  String get apellido => _apellidoController.value;
  String get dni => _dniController.value;

  despose() {
    _emailController?.close();
    _passController?.close();
    _nombreController.close();
    _apellidoController.close();
    _dniController.close();
  }
}
