import 'dart:convert';

import 'package:baf_corporativo/src/global/variables.dart';
import 'package:baf_corporativo/src/models/tareas.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List> gettask() async {
    final response =
        await http.get(Variables.urltasks, headers: Variables.headers);
    var convertiarjson = jsonDecode(response.body);
    return convertiarjson;
  }

  Future<Tarea> getTaskById(String id) async {
    final response = await http.get(Uri.parse('$Variables.urltasks/$id'),
        headers: Variables.headers);

    if (response.statusCode == 200) {
      return Tarea.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load a task');
    }
  }

  Future<Tarea> createTask(Tarea task) async {
    Map data = {
      'token': Variables.token,
      'title': task.title,
      'is_completed': task.isCompleted,
      'due_date': task.dueDate,
      'description': task.descripcion,
      'comments': task.comentarios,
      'tags': task.tags,
    };

    final response = await http.post(
      Variables.urltasks,
      headers: Variables.headers,
      body: jsonEncode(data),
    );

    if (response.statusCode == 201) {
      return Tarea.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to post task');
    }
  }

  Future<Tarea> updateTask(String id, Tarea task) async {
    Map data = {
      'token': Variables.token,
      'title': task.title,
      'is_completed': task.isCompleted,
      'due_date': task.dueDate,
      'description': task.descripcion,
      'comments': task.comentarios,
      'tags': task.tags,
    };

    final http.Response response = await http.put(
      Uri.parse("https://ecsdevapi.nextline.mx/vdev/tasks-challenge/tasks/$id"),
      headers: Variables.headers,
      body: jsonEncode(data),
    );
    if (response.statusCode == 201) {
      return Tarea.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update a task');
    }
  }

  Future<void> deleteTask(String id) async {
    final res = await http.delete(
        Uri.parse(
            "https://ecsdevapi.nextline.mx/vdev/tasks-challenge/tasks/$id"),
        headers: Variables.headers);
    if (res.statusCode == 201) {
      print("Task deleted");
    } else {
      throw "Failed to delete a task.";
    }
  }
}
