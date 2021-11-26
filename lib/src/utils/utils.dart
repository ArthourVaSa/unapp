import 'package:flutter/material.dart';

void mostrarAlerta(BuildContext context, String mensaje) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Información incorrecta'),
        content: Text(mensaje),
        actions: <Widget>[
          FlatButton(
            child: Text('OK'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      );
    },
  );
}

// void getFacultades_service(List<String> facultades) {
//   final url = 'https://practicas-flutter.firebaseio.com/Facultades.json';
//   http.get(url).then((res) {
//     final traerFacultades = facultadesFromJson(res.body);

//     facultades
//       ..add(traerFacultades.facen)
//       ..add(traerFacultades.fia)
//       ..add(traerFacultades.fiq)
//       ..add(traerFacultades.fisi);
//   }).catchError((error) => print);
// }
