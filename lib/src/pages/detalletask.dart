import 'package:baf_corporativo/src/pages/editarTask.dart';
import 'package:baf_corporativo/src/services/apiServices.dart';
import 'package:flutter/material.dart';

class DetallesTasksPage extends StatefulWidget {
  final Map infotask;

  const DetallesTasksPage(this.infotask, {Key? key}) : super(key: key);

  @override
  _DetailWidgetState createState() => _DetailWidgetState();
}

class _DetailWidgetState extends State<DetallesTasksPage> {
  _DetailWidgetState();

  final ApiService api = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Detalle de la Tarea",
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Vidaloka',
            ),
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView(
        children: <Widget>[
          const Padding(padding: EdgeInsets.fromLTRB(0, 5, 0, 5)),
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
              child: Text(
                widget.infotask['title'].toUpperCase(),
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Vidaloka',
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(15, 5, 0, 0),
            child: Center(
              child: Row(
                children: [
                  const Text(
                    'Estado: ',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Vidaloka',
                    ),
                  ),
                  Text(
                    widget.infotask["is_completed"].toString() == '1'
                        ? 'Completada'
                        : 'No Completada',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Vidaloka',
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(15, 5, 0, 0),
            child: Center(
              child: Row(
                children: [
                  const Text(
                    'Fecha: ',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Vidaloka',
                    ),
                  ),
                  Text(
                    widget.infotask['due_date'].toString(),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Vidaloka',
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(15, 5, 0, 0),
            child: Center(
              child: Row(children: [
                const Text(
                  'Comentarios: ',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ![null].contains(widget.infotask["comentarios"].toString()) ==
                        true
                    ? const Text(
                        'No hay Información',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Vidaloka',
                        ),
                      )
                    : Text(
                        widget.infotask["comentarios"].toString(),
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Vidaloka',
                        ),
                      ),
              ]),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(15, 5, 0, 0),
            child: Center(
              child: Row(children: [
                const Text(
                  'Descripción: ',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ![null].contains(widget.infotask["descripcion"].toString()) ==
                        true
                    ? const Text(
                        'No hay Información',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Vidaloka',
                        ),
                      )
                    : Text(
                        widget.infotask["descripcion"].toString(),
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Vidaloka',
                        ),
                      ),
              ]),
            ),
          ),
          Container(
            child: Center(
              child: Row(
                children: [
                  const Text(
                    'Tags: ',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ![null].contains(widget.infotask["tags"].toString()) == true
                      ? const Text(
                          'No hay Información',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Vidaloka',
                          ),
                        )
                      : Text(
                          widget.infotask["tags"].toString(),
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Vidaloka',
                          ),
                        ),
                ],
              ),
            ),
            padding: const EdgeInsets.fromLTRB(15, 5, 0, 10),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(100, 20, 0, 0),
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push<dynamic>(
                      context,
                      MaterialPageRoute<dynamic>(
                        builder: (BuildContext context) =>
                            UpdateTask(widget.infotask),
                      ),
                    );
                  },
                  child: const Text('Update',
                      style: TextStyle(color: Colors.white)),
                ),
                const Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20)),
                ElevatedButton(
                  onPressed: () {
                    api.deleteTask(widget.infotask["id"].toString());
                  },
                  child: const Text('Delete',
                      style: TextStyle(color: Colors.white)),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
