import 'package:baf_corporativo/src/models/tareas.dart';
import 'package:baf_corporativo/src/services/apiServices.dart';
import 'package:flutter/material.dart';

class UpdateTask extends StatefulWidget {
  UpdateTask(this.infotask);

  final Map infotask;

  @override
  _UpdateTaskState createState() => _UpdateTaskState();
}

class _UpdateTaskState extends State<UpdateTask> {
  _UpdateTaskState();

  final ApiService api = ApiService();
  final _addFormKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _completadaController = TextEditingController();
  final _fechaController = TextEditingController();
  final _tagsController = TextEditingController();
  final _commentsController = TextEditingController();
  final _descriptionController = TextEditingController();
  int cont = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Task'),
      ),
      body: Form(
        key: _addFormKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Card(
              child: Container(
                padding: const EdgeInsets.all(10.0),
                width: 440,
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Column(
                        children: <Widget>[
                          const Text('Title'),
                          TextFormField(
                            controller: _titleController,
                            initialValue: widget.infotask["title"],
                            decoration: const InputDecoration(
                              hintText: 'Title',
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter title';
                              }
                              return null;
                            },
                            onChanged: (value) {},
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Column(
                        children: <Widget>[
                          const Text('Completada'),
                          TextFormField(
                            controller: _completadaController,
                            decoration: const InputDecoration(
                              hintText: 'Completada',
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter is_complete';
                              }
                              return null;
                            },
                            onChanged: (value) {},
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Column(
                        children: <Widget>[
                          const Text('Fecha'),
                          TextFormField(
                            controller: _fechaController,
                            decoration: const InputDecoration(
                              hintText: 'YYYY-MM-DD',
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter fecha';
                              }
                              return null;
                            },
                            onChanged: (value) {},
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Column(
                        children: <Widget>[
                          const Text('Descripcion'),
                          TextFormField(
                            controller: _descriptionController,
                            decoration: const InputDecoration(
                              hintText: 'Descripcion',
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Column(
                        children: <Widget>[
                          const Text('Comentarios'),
                          TextFormField(
                            controller: _commentsController,
                            decoration: const InputDecoration(
                              hintText: 'Comentarios',
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Column(
                        children: <Widget>[
                          const Text('Tags'),
                          TextFormField(
                            controller: _tagsController,
                            decoration: const InputDecoration(
                              hintText: 'Tags',
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Column(
                        children: <Widget>[
                          ElevatedButton(
                            onPressed: () {
                              api.updateTask(
                                  widget.infotask["id"].toString(),
                                  Tarea(
                                    title: _titleController.text,
                                    isCompleted:
                                        int.parse(_completadaController.text),
                                    dueDate: _fechaController.text,
                                    comentarios: _commentsController.text,
                                    descripcion: _descriptionController.text,
                                    tags: _tagsController.text,
                                  ));
                              _addFormKey.currentState!.save();
                              Navigator.pop(context);
                            },
                            child: const Text('Update',
                                style: TextStyle(color: Colors.white)),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
