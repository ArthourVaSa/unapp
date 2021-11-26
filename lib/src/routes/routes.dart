import 'package:flutter/material.dart';
import 'package:unapp/src/pages/datos_page.dart';
import 'package:unapp/src/pages/home_page.dart';
import 'package:unapp/src/pages/home_page_original.dart';
import 'package:unapp/src/pages/login_page.dart';
import 'package:unapp/src/pages/notificaciones_page.dart';
import 'package:unapp/src/pages/registro_page.dart';
import 'package:unapp/src/pages/usuario_page.dart';
import 'package:unapp/src/pages/verificacion_page.dart';

Map<String, WidgetBuilder> getAplicationRoute() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => LoginPage(),
    'registro': (BuildContext context) => RegistroPage(),
    'home': (BuildContext context) => HomePage(),
    'homeOriginal': (BuildContext context) => HomePageOriginal(),
    'usuario': (BuildContext context) => UsuarioPage(),
    'datosPage': (BuildContext context) => DatosPage(),
    'verificacion': (BuildContext context) => VerificacionPage(),
    'notificaciones': (BuildContext context) => NotificacionesPage()
  };
}
