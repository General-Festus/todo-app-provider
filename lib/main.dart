import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_project/todomodel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChangeNotifierProvider(
        create: (context) => TaskDo(),
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[900],
      appBar: AppBar(
        title: Text('Todo Application'),
        centerTitle: true,
        actions: <Widget>[IconButton(icon: Icon(Icons.menu), onPressed: () {})],
        leading: Icon(Icons.menu),
        backgroundColor: Colors.lightBlue[900],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  'Time   :',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  '30:34',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Text('Current Time',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
              )),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      topLeft: Radius.circular(50))),
              child: Consumer<TaskDo>(
                builder: (context, todo, child) => ListView.builder(
                    itemCount: todo.task.length,
                    itemBuilder: (BuildContext context, int) {
                      return Padding(
                        padding: EdgeInsets.all(8.0),
                        child: ListTile(
                          title: Text(
                            todo.task[int].title,
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black87,
                                fontWeight: FontWeight.w700),
                          ),
                          subtitle: Text(
                            todo.task[int].detail,
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.bold),
                          ),
                          trailing:
                              Icon(Icons.delete, color: Colors.greenAccent),
                        ),
                      );
                    }),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Provider.of<TaskDo>(context, listen: false).addTaskDo();
        },
      ),
    );
  }
}
