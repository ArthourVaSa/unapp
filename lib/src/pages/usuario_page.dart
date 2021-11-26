import 'package:flutter/material.dart';

class UsuarioPage extends StatefulWidget {
  @override
  _UsuarioPageState createState() => _UsuarioPageState();
}

class _UsuarioPageState extends State<UsuarioPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
        backgroundColor: Color.fromRGBO(6, 110, 6, 1.0),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          _crearFondo(context),
          _crearFondo2(context),
        ],
      ),
    );
  }

  Widget _crearFondo2(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 350.0,
          ),
          SafeArea(
            child: Center(
              child: Column(
                children: <Widget>[
                  _primerContainer(),
                  SizedBox(
                    height: 45.0,
                  ),
                  _segundoContainer(),
                  SizedBox(
                    height: 45.0,
                  ),
                  _tercerContainer(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _crearFondo(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final fondo = Container(
      height: size.height * 0.3,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: <Color>[
          Color.fromRGBO(6, 110, 6, 1.0),
          Color.fromRGBO(37, 157, 37, 1.0)
        ]),
        boxShadow: [
          BoxShadow(color: Colors.black),
        ],
      ),
    );

    final texto = Container(
      child: CircleAvatar(
        backgroundImage: AssetImage('assets/fondo_perfil.png'),
        radius: 50,
      ),
    );

    final texto2 = Container(
      child: Text(
        'Nombre del usuario',
        style: TextStyle(
          fontFamily: 'Open Sans',
          fontSize: 15,
          color: const Color(0xffffffff),
          letterSpacing: 0.04,
          fontWeight: FontWeight.w600,
        ),
      ),
    );

    return Stack(
      children: <Widget>[
        fondo,
        Positioned(
          top: 50.0,
          left: 40.0,
          child: texto,
        ),
        Positioned(
          right: 0,
          child: Image(
            image: AssetImage('assets/unap_fondo.png'),
            width: 170.0,
          ),
        ),
        Positioned(
          top: 180.0,
          left: 20.0,
          child: texto2,
        ),
      ],
    );
  }

  Widget _primerContainer() {
    return Container(
      width: 350,
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
              child: Icon(
                Icons.edit,
                color: Color.fromRGBO(6, 110, 6, 1.0),
              ),
              left: 20,
              top: 13,
            ),
            Positioned(
              child: Text(
                "Ver Perfil",
                style: TextStyle(
                    fontSize: 20.0, color: Color.fromRGBO(6, 110, 6, 1.0)),
              ),
              left: 130,
              top: 13,
            ),
          ],
        ),
        onPressed: () {},
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
  }

  Widget _segundoContainer() {
    return Container(
      width: 350,
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
              child: Icon(
                Icons.notifications,
                color: Color.fromRGBO(6, 110, 6, 1.0),
              ),
              left: 20,
              top: 13,
            ),
            Positioned(
              child: Text(
                "Notificaciones",
                style: TextStyle(
                    fontSize: 20.0, color: Color.fromRGBO(6, 110, 6, 1.0)),
              ),
              left: 100,
              top: 13,
            ),
          ],
        ),
        onPressed: () {},
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
  }

  Widget _tercerContainer(BuildContext context) {
    return Container(
      width: 350,
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
              child: Icon(
                Icons.logout,
                color: Color.fromRGBO(6, 110, 6, 1.0),
              ),
              left: 20,
              top: 13,
            ),
            Positioned(
              child: Text(
                "Cerrar Sesión",
                style: TextStyle(
                    fontSize: 20.0, color: Color.fromRGBO(6, 110, 6, 1.0)),
              ),
              left: 100,
              top: 13,
            ),
          ],
        ),
        onPressed: () => Navigator.pushReplacementNamed(context, '/'),
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
  }
}
