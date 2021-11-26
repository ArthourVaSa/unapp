import 'package:flutter/material.dart';
import 'package:unapp/src/clases/usuarios.dart';
import 'package:unapp/src/providers/usuario_provider.dart';
import 'package:unapp/src/utils/utils.dart' as utils;

class DatosPage extends StatefulWidget {
  @override
  _DatosPageState createState() => _DatosPageState();
}

class _DatosPageState extends State<DatosPage> {
  Usuario usuario = new Usuario();
  final usuarioProvider = new UsuarioProvider();

  final formKey = GlobalKey<FormState>();

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
      ),
    );
  }

  Widget _loginForm(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      padding: EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            Icon(
              Icons.account_circle,
              size: 50.0,
            ),
            _inputNombre(),
            SizedBox(
              height: 30.0,
            ),
            _inputApellido(),
            SizedBox(
              height: 30.0,
            ),
            _inputDni(),
            SizedBox(
              height: 30.0,
            ),
            _crearBoton(),
            SizedBox(
              height: 30.0,
            ),
          ],
        ),
      ),
    ));
  }

  Widget _inputNombre() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Nombre',
        labelText: 'Nombre',
      ),
      onSaved: (value) => usuario.nombre = value,
    );
  }

  Widget _inputApellido() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Apellido',
        labelText: 'Apellido',
      ),
      onSaved: (value) => usuario.apellido = value,
    );
  }

  Widget _inputDni() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'DNI',
        labelText: 'DNI',
      ),
      onSaved: (value) => usuario.dni = int.parse(value),
    );
  }

  Widget _crearBoton() {
    return RaisedButton(
      child: Container(
        child: Text('Registrarse'),
      ),
      onPressed: _submit,
    );
  }

  void _submit() {
    formKey.currentState.save();

    print('Este es el nombre');
    print(usuario.nombre);
    print(usuario.apellido);
    print(usuario.dni);

    usuarioProvider.crearUsuario(usuario);
  }
}
