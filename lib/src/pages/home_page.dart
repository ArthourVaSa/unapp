import 'package:flutter/material.dart';
import 'package:unapp/src/pages/home_page_original.dart';
import 'package:unapp/src/pages/usuario_page.dart';
import 'package:unapp/src/providers/push_notificaciones_provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _paginaActual = 0;

  @override
  void initState() {
    super.initState();

    final pushProvider = new NotificacionesPushProvider();
    pushProvider.initNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _callPage(_paginaActual),
      bottomNavigationBar: _crearBottomNavigationBar(),
    );
  }

  Widget _crearBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _paginaActual,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.dashboard),
          title: Text('Inicio'),
          backgroundColor: Color.fromRGBO(6, 110, 6, 1.0),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_balance),
          title: Text('Facultad'),
          backgroundColor: Color.fromRGBO(6, 110, 6, 1.0),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          title: Text('Usuario'),
          backgroundColor: Color.fromRGBO(6, 110, 6, 1.0),
        ),
      ],
      backgroundColor: Colors.yellow,
      fixedColor: Color.fromRGBO(6, 110, 6, 1.0),
      onTap: _onItemTapped,
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _paginaActual = index;
    });
  }

  Widget _callPage(int paginaActual) {
    switch (paginaActual) {
      case 0:
        return HomePageOriginal();
        break;
      case 1:
        return UsuarioPage();
        break;
      case 2:
        return UsuarioPage();
        break;
      default:
        return HomePageOriginal();
    }
  }
}
