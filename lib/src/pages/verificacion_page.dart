import 'package:flutter/material.dart';

class VerificacionPage extends StatefulWidget {
  @override
  _VerificacionPageState createState() => _VerificacionPageState();
}

class _VerificacionPageState extends State<VerificacionPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(6, 110, 6, 1.0),
        body: Center(
          child: Container(
            child: Column(
              children: <Widget>[
                _textoRegistro(),
                SizedBox(
                  height: 180.0,
                ),
                _imagenRegistro(),
                SizedBox(
                  height: 180.0,
                ),
                _registroBoton(context),
              ],
            ),
            padding: EdgeInsets.symmetric(vertical: 110, horizontal: 90),
          ),
        ),
      ),
    );
  }

  Widget _textoRegistro() {
    return Text(
      'Registro Completado',
      style: TextStyle(
        color: Colors.white,
        fontSize: 35.0,
        fontFamily: 'Open Sans',
      ),
    );
  }

  Widget _imagenRegistro() {
    return Image(
      image: AssetImage('assets/check.png'),
      width: 120,
    );
  }

  Widget _registroBoton(BuildContext context) {
    return Container(
      width: 200,
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
                "Continuar",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              left: 35,
              top: 13,
            ),
          ],
        ),
        onPressed: () => _registro(context),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        color: Colors.yellow,
      ),
    );
  }

  _registro(BuildContext context) {
    Navigator.pushReplacementNamed(context, 'home');
  }
}
