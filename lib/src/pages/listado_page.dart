import 'package:baf_corporativo/src/pages/addTask.dart';
import 'package:baf_corporativo/src/pages/detalletask.dart';
import 'package:baf_corporativo/src/providers/tarea_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListadoTareasPage extends StatelessWidget {
  static const routeName = 'inicio';

  ListadoTareasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var tareaProvider = Provider.of<TareasProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Listado de Tareas'),
      ),
      body: FutureBuilder(
        future: tareaProvider.obtenerTareas(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            var posts = snapshot.data;
            return ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  Map post = snapshot.data[index];

                  return GestureDetector(
                    onTap: () => Navigator.push<dynamic>(
                      context,
                      MaterialPageRoute<dynamic>(
                        builder: (BuildContext context) =>
                            DetallesTasksPage(post),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: Card(
                        child: Column(
                          children: <Widget>[
                            Center(
                              child: Text(
                                'Titulo: ' + post['title'].toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Vidaloka',
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                            ),
                            Text(
                              'Fecha: ' + post['due_date'],
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Vidaloka',
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                            ),
                            Text(
                              'Estado: ' + post['is_completed'].toString(),
                              style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Vidaloka',
                                  height: 2.8),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                });
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push<dynamic>(
            context,
            MaterialPageRoute<dynamic>(
              builder: (BuildContext context) => AddTask(),
            ),
          );
        },
        backgroundColor: Colors.lightBlue,
        child: const Icon(Icons.add),
      ),
    );
  }
}
