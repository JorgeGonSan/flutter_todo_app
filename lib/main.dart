import 'package:flutter/material.dart';

void main() {
  runApp(const MyTodoApp());
}

class MyTodoApp extends StatefulWidget {
  const MyTodoApp({super.key});

  @override
  State<MyTodoApp> createState() => _MyTodoAppState();
}

class _MyTodoAppState extends State<MyTodoApp> {
  List<String> tareas = [];
  final miControler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Todo app")),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50),
                child: TextField(
                  decoration: InputDecoration(border: OutlineInputBorder()),
                  controller: miControler,
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (miControler.text.isNotEmpty) {
                      tareas.add(miControler.text);
                      miControler.clear();
                    }
                  });
                },
                child: Text("añadir"),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: tareas.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      key: ValueKey(tareas[index]),
                      title: Text(tareas[index]),
                      trailing: IconButton(
                        onPressed: () {
                          setState(() {
                            tareas.removeAt(index);
                          });
                        },
                        icon: Icon(Icons.delete),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
