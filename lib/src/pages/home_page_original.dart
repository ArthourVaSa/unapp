import 'package:flutter/material.dart';
import 'package:unapp/src/providers/push_notificaciones_provider.dart';
import 'package:unapp/src/widgets/card_swiper_widget.dart';

class HomePageOriginal extends StatefulWidget {
  @override
  _HomePageOriginalState createState() => _HomePageOriginalState();
}

class _HomePageOriginalState extends State<HomePageOriginal> {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();

    final pushProvider = new NotificacionesPushProvider();
    pushProvider.initNotifications();

    pushProvider.mensajes.listen((data) {
      var datos = data['data'];
      print(datos);
      Navigator.pushNamed(context, 'notificaciones', arguments: datos);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: navigatorKey,
      appBar: AppBar(
        title: Text('Novedades'),
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
          SafeArea(
            child: Container(
              height: 150.0,
            ),
          ),
          Container(
            width: size.width * 0.90,
            child: Column(
              children: <Widget>[
                _swiperNoticias(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _swiperNoticias() {
    return CardSwiper(
      peliculas: [1, 2, 3, 4],
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
      child: Text(
        '¡Hola usuario!',
        style: TextStyle(
          fontFamily: 'Open Sans',
          fontSize: 20,
          color: const Color(0xffffffff),
          letterSpacing: 0.04,
          fontWeight: FontWeight.w600,
        ),
      ),
    );

    final texto2 = Container(
      child: Text(
        'Estas son tus novedades',
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
          left: 20.0,
          child: texto,
        ),
        Positioned(
          top: 100.0,
          left: 20.0,
          child: texto2,
        ),
        Positioned(
          right: 0,
          child: Image(
            image: AssetImage('assets/unap_fondo.png'),
            width: 170.0,
          ),
        ),
      ],
    );
  }
}
