import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificacionesPage extends StatefulWidget {
  @override
  _NotificacionesPageState createState() => _NotificacionesPageState();
}

class _NotificacionesPageState extends State<NotificacionesPage> {
  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context).settings.arguments;
    Map<String, dynamic> datos = json.decode(arg.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Nueva Notifiación',
          style: TextStyle(color: Color.fromRGBO(6, 110, 6, 1.0)),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _fondoImagen(context),
            SizedBox(
              height: 20.0,
            ),
            _texto(context),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 50,
                ),
                _bloqueUno(context),
                SizedBox(
                  width: 120,
                ),
                _bloqueDos(context),
              ],
            ),
            _asunto(context),
          ],
        ),
      ),
    );
  }

  Widget _fondoImagen(BuildContext context) {
    final arg = ModalRoute.of(context).settings.arguments;
    Map<String, dynamic> datos = json.decode(arg);

    final size = MediaQuery.of(context).size;

    final imagen = Container(
      height: size.height * 0.3,
      width: double.infinity,
      child: FadeInImage(
        image: NetworkImage(
            'http://goxx.pythonanywhere.com/${datos['image-url'].toString()}'),
        placeholder: AssetImage('assets/cargando.gif'),
        fadeInDuration: Duration(milliseconds: 200),
      ),
      decoration: BoxDecoration(
        color: Colors.black,
        boxShadow: [
          BoxShadow(color: Colors.black),
        ],
      ),
    );

    return Stack(
      children: <Widget>[
        imagen,
      ],
    );
  }

  Widget _texto(BuildContext context) {
    final arg = ModalRoute.of(context).settings.arguments;
    Map<String, dynamic> datos = json.decode(arg.toString());
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            Text(
              datos['tittle'],
              style: TextStyle(
                  color: Color.fromRGBO(6, 110, 6, 1.0),
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 5.0,
            ),
            Container(
              height: 5.0,
              decoration: BoxDecoration(
                color: Color.fromRGBO(6, 110, 6, 1.0),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(-1.0, 1.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      height: 50,
      width: 450,
    );
  }

  Widget _bloqueUno(BuildContext context) {
    final arg = ModalRoute.of(context).settings.arguments;
    Map<String, dynamic> datos = json.decode(arg);

    if (datos['numero-facultades'] > 1) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 18),
        width: 90,
        height: 30,
        child: Text('General'),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.yellow,
        ),
      );
    } else {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 18),
        width: 90,
        height: 30,
        child: Text(
          'Privado',
          style: TextStyle(color: Colors.white),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.red,
        ),
      );
    }
  }

  Widget _asunto(BuildContext context) {
    final arg = ModalRoute.of(context).settings.arguments;
    Map<String, dynamic> datos = json.decode(arg.toString());

    return Container(
      child: Text(
        datos['body'],
      ),
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 100),
    );
  }

  Widget _bloqueDos(BuildContext context) {
    final arg = ModalRoute.of(context).settings.arguments;
    Map<String, dynamic> datos = json.decode(arg.toString());

    var fecha = datos['created-at'].split(' ');
    return Container(
      child: Row(
        children: <Widget>[
          Icon(
            Icons.date_range,
            color: Color.fromRGBO(6, 110, 6, 1.0),
          ),
          Text(
            fecha[0],
            style: TextStyle(
                color: Color.fromRGBO(6, 110, 6, 1.0),
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
