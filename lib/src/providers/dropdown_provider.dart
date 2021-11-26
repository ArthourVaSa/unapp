import 'dart:convert';

import 'package:flutter/services.dart';

class DropdownProvider {
  List<String> facultades = [];

  Future<List<String>> cargarFacultades() async {
    final resp = await rootBundle
        .loadString('http://goxx.pythonanywhere.com/school/?format=json');

    Map dataMap = json.decode(resp);
    facultades = dataMap['name'];

    print(facultades);
    return facultades;
  }
}

final dropdownProvider = new DropdownProvider();
