import 'package:baf_corporativo/src/services/apiServices.dart';
import 'package:flutter/material.dart';

class TareasProvider extends ChangeNotifier {
  late List tareas;
  var service = ApiService();

  Future<List> obtenerTareas() async {
    tareas = await service.gettask();
    notifyListeners();
    return tareas;
  }

  Future<List> refrescarTareas() async {
    tareas = await service.gettask();
    notifyListeners();
    return tareas;
  }
}
