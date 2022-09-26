import 'dart:convert';

Tarea tareaFromJson(String str) => Tarea.fromJson(json.decode(str));

String tareaToJson(Tarea data) => json.encode(data.toJson());

class Tarea {
  Tarea(
      {required this.title,
      required this.isCompleted,
      required this.dueDate,
      required this.comentarios,
      required this.descripcion,
      required this.tags});

  String title;
  int isCompleted;
  String dueDate;
  String comentarios;
  String descripcion;
  String tags;

  factory Tarea.fromJson(Map<String, dynamic> json) => Tarea(
        title: json["title"],
        isCompleted: json["is_completed"],
        dueDate: json["due_date"],
        comentarios: json["comentarios"],
        descripcion: json["descripcion"],
        tags: json["tags"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "is_completed": isCompleted,
        "due_date": dueDate,
        "comentarios": comentarios,
        "descripcion": descripcion,
        "tags": tags
      };
}
