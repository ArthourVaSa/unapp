import 'package:flutter/material.dart';
import 'package:unapp/src/bloc/provider.dart';
import 'package:unapp/src/preferencias/preferencias_usuario.dart';
import 'package:unapp/src/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();
  return runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final prefs = new PreferenciasUsuario();
    print(prefs.token);

    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'UNAPP',
        initialRoute: '/',
        routes: getAplicationRoute(),
        theme: ThemeData(
          primaryColor: Colors.yellow,
        ),
      ),
    );
  }
}
