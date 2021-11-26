import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:unapp/src/bloc/login_bloc.dart';
import 'package:unapp/src/bloc/provider.dart';
import 'package:unapp/src/providers/usuario_provider.dart';
import 'package:unapp/src/utils/utils.dart' as utils;
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usuarioProvider = UsuarioProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _loginForm(context),
          ],
        ),
        padding: EdgeInsets.symmetric(horizontal: 60),
      ),
      backgroundColor: Color.fromRGBO(6, 110, 6, 1.0),
    );
  }

  Widget _loginForm(BuildContext context) {
    final bloc = Provider.of(context);

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _imagenFondo(),
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
          _crearBoton(bloc),
          SizedBox(
            height: 20.0,
          ),
          FlatButton(
            child: Text(
              'Registrarse',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () =>
                Navigator.pushReplacementNamed(context, 'registro'),
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
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              icon: Icon(
                Icons.email,
                color: Colors.yellow,
              ),
              hintText: '12345678',
              labelText: 'DNI',
              labelStyle: TextStyle(color: Colors.yellow),
              counterText: snapshot.data,
              counterStyle: TextStyle(color: Colors.yellow),
              border: InputBorder.none,
            ),
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
              border: InputBorder.none,
            ),
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

  _login(LoginBloc bloc, BuildContext context) async {
    // final Map info = await usuarioProvider.login(bloc.email, bloc.pass);

    // if (info['ok']) {
    //   Navigator.pushReplacementNamed(context, 'home');
    // } else {
    //   mostrarAlerta(context, info['mensaje']);
    // }

    var respuesta;
    var res;
    final response =
        await http.post('http://goxx.pythonanywhere.com/login/', headers: {
      "Accept": "application/json"
    }, body: {
      'dni': bloc.email,
      'password': bloc.pass,
    });

    setState(() {
      respuesta = json.decode(response.body);
      print(respuesta['estado']);
    });

    res = respuesta['estado'];

    if (res) {
      Navigator.pushReplacementNamed(context, 'home');
    } else {
      utils.mostrarAlerta(context, 'DNI y/o contraseña incorrectos');
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
                "Ingresar",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              left: 85,
              top: 13,
            ),
          ],
        ),
        onPressed: () => _login(bloc, context),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        color: Colors.yellow,
      ),
    );
  }

  Widget _imagenFondo() {
    return Image(
      image: AssetImage('assets/logo_registro.png'),
    );
  }
}
