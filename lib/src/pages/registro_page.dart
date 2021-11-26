import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unapp/src/bloc/provider.dart';
import 'package:unapp/src/clases/token.dart';
import 'package:unapp/src/providers/push_notificaciones_provider.dart';
import 'package:unapp/src/providers/usuario_provider.dart';
import 'package:unapp/src/clases/token.dart';
import 'package:unapp/src/utils/utils.dart' as utils;
import 'package:http/http.dart' as http;

class RegistroPage extends StatefulWidget {
  @override
  _RegistroPageState createState() => _RegistroPageState();
}

class _RegistroPageState extends State<RegistroPage> {
  final usuarioProvider = new UsuarioProvider();

  String seleccionNombre;

  List datos = List();

  Future getNombres() async {
    var response = await http.get("http://goxx.pythonanywhere.com/school/",
        headers: {"Accept": "application/json"});
    var jsonBody = response.body;
    var jsonData = jsonDecode(jsonBody);

    final prueba = jsonData;
    print('esto es del json al prueba');
    print(prueba['facultades']);

    setState(() {
      print('esto es del set state');
      datos = prueba['facultades'];
    });

    print(jsonData);
    return "success";
  }

  @override
  void initState() {
    super.initState();
    getNombres();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _loginForm(context),
        ],
      ),
      backgroundColor: Color.fromRGBO(6, 110, 6, 1.0),
    );
  }

  Widget _loginForm(BuildContext context) {
    final bloc = Provider.of(context);

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(
            height: 50.0,
          ),
          _containerImagenes(),
          SizedBox(
            height: 50.0,
          ),
          _inputNombre(bloc),
          SizedBox(
            height: 30.0,
          ),
          _inputApellido(bloc),
          SizedBox(
            height: 30.0,
          ),
          _inputDni(bloc),
          SizedBox(
            height: 30.0,
          ),
          _inputEmail(bloc),
          SizedBox(
            height: 30.0,
          ),
          _inputPass(bloc),
          SizedBox(
            height: 30.0,
          ),
          _crearLista(),
          SizedBox(
            height: 30.0,
          ),
          _crearBoton(bloc),
          SizedBox(
            height: 30.0,
          ),
          FlatButton(
            child: Text(
              '¿Ya tienes cuenta?',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () => Navigator.pushReplacementNamed(context, '/'),
          ),
        ],
      ),
    );
  }

  Widget _inputEmail(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 35.0),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                icon: Icon(
                  Icons.email,
                  color: Colors.yellow,
                ),
                hintText: 'ejemplo@gmail.com',
                labelText: 'Email',
                labelStyle: TextStyle(color: Colors.yellow),
                counterText: snapshot.data,
                counterStyle: TextStyle(color: Colors.yellow),
                border: InputBorder.none),
            onChanged: bloc.changeEmail,
            style: TextStyle(color: Colors.white),
          ),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.yellow, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          width: 300,
        );
      },
    );
  }

  Widget _inputPass(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.passStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 35.0),
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
                icon: Icon(
                  Icons.lock_outline,
                  color: Colors.yellow,
                ),
                hintText: 'Contraseña',
                labelText: 'Contraseña',
                labelStyle: TextStyle(color: Colors.yellow),
                counterText: snapshot.data,
                counterStyle: TextStyle(color: Colors.yellow),
                border: InputBorder.none),
            onChanged: bloc.changePass,
            style: TextStyle(color: Colors.white),
          ),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.yellow, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          width: 300,
        );
      },
    );
  }

  Widget _crearLista() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 35.0),
      child: DropdownButton(
        value: seleccionNombre,
        dropdownColor: Color.fromRGBO(6, 110, 6, 1.0),
        hint: Text(
          'Seleccionar Facultad',
          style: TextStyle(color: Colors.yellow),
        ),
        icon: Icon(Icons.add, color: Colors.yellow),
        items: datos.map((list) {
          return DropdownMenuItem(
            child: Text(list['name']),
            value: list['id'].toString(),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            seleccionNombre = value;
          });
        },
        style: TextStyle(color: Colors.white),
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.yellow, width: 2),
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      width: 350,
    );
  }

  _inputNombre(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.nombreStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 35.0),
          child: TextField(
            decoration: InputDecoration(
              icon: Icon(Icons.person, color: Colors.yellow),
              hintText: 'Nombres',
              labelText: 'Nombres',
              labelStyle: TextStyle(color: Colors.yellow),
              counterText: snapshot.data,
              counterStyle: TextStyle(color: Colors.yellow),
              border: InputBorder.none,
            ),
            onChanged: bloc.changeNombre,
            style: TextStyle(color: Colors.white),
          ),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.yellow, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          width: 300,
        );
      },
    );
  }

  _inputApellido(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.apellidoStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 35.0),
          child: TextField(
            decoration: InputDecoration(
              icon: Icon(Icons.person, color: Colors.yellow),
              hintText: 'Apellidos',
              labelText: 'Apellidos',
              labelStyle: TextStyle(color: Colors.yellow),
              counterText: snapshot.data,
              counterStyle: TextStyle(color: Colors.yellow),
              border: InputBorder.none,
            ),
            onChanged: bloc.changeApellido,
            style: TextStyle(color: Colors.white),
          ),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.yellow, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          width: 300,
        );
      },
    );
  }

  _inputDni(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.dniStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 35.0),
          child: TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              icon: Icon(
                Icons.web_asset,
                color: Colors.yellow,
              ),
              hintText: 'DNI',
              labelText: 'DNI',
              labelStyle: TextStyle(color: Colors.yellow),
              counterText: snapshot.data.toString(),
              counterStyle: TextStyle(color: Colors.yellow),
              border: InputBorder.none,
            ),
            onChanged: bloc.changeDni,
            style: TextStyle(color: Colors.white),
          ),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.yellow, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          width: 300,
        );
      },
    );
  }

  _registro(LoginBloc bloc, BuildContext context) async {
    // usuarioProvider.guardarUsuario(bloc.nombre, bloc.apellido, bloc.dni,
    //     bloc.email, bloc.pass, seleccionNombre);
    FirebaseMessaging nuevo = new FirebaseMessaging();
    nuevo.requestNotificationPermissions();
    String token = await nuevo.getToken();

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'authorization': 'Basic c3R1ZHlkb3RlOnN0dWR5ZG90ZTEyMw=='
    };

    var respuesta;
    var res;
    final response =
        await http.post('http://goxx.pythonanywhere.com/add/user/', headers: {
      "Accept": "application/json"
    }, body: {
      'name': bloc.nombre,
      'last_name': bloc.apellido,
      'dni': bloc.dni,
      'email': bloc.email,
      'password': bloc.pass,
      'token': token,
      'school': seleccionNombre
    });
    setState(() {
      respuesta = json.decode(response.body);
      print(respuesta['estado']);
    });

    res = respuesta['estado'];

    if (res == 'Cuenta creada') {
      Navigator.pushReplacementNamed(context, 'verificacion');
    } else {
      utils.mostrarAlerta(context, 'No se pudo registrar.');
    }
  }

  Widget _crearBoton(LoginBloc bloc) {
    return Container(
      width: 500,
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(
          color: Color.fromRGBO(6, 110, 6, 1.0),
          width: 1,
        ),
      ),
      child: RaisedButton(
        child: Stack(
          children: <Widget>[
            Positioned(
              child: Text(
                "Registrarse",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              left: 135,
              top: 13,
            ),
          ],
        ),
        onPressed: () => _registro(bloc, context),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        color: Colors.yellow,
      ),
    );
  }

  Widget _containerImagenes() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image(
            image: AssetImage('assets/logo_registro.png'),
            width: 150,
          ),
          Text(
            "Registro",
            style: TextStyle(fontSize: 30.0, color: Colors.white),
          )
        ],
      ),
    );
  }
}
