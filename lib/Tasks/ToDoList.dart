import 'package:binary_project/DataObjects/TaskObject.dart';
import 'package:binary_project/Tasks/ToDo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Global.dart';

class ToDoList extends StatefulWidget {
  @override
  _ToDoListState createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  var global = Global();
  List<ToDo> todos = [];

  _toggleToDo(ToDo todo, bool isChecked) {
    setState(() {
      todo.isDone = isChecked;
    });
  }

  Widget _buildItem(DocumentSnapshot data) {
    Task todo = Task.fromSnapshot(data);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      color: Colors.white,
      elevation: 10,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.blur_circular, size: 50),
            title: Text(todo.title,
                style: TextStyle(
                    fontSize: 17,
                    fontFamily: 'raleway',
                    fontWeight: FontWeight.w700)),
            subtitle: Text(todo.description,
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'raleway',
                    fontWeight: FontWeight.w700)),
            trailing: InkWell(
                onTap: () {
                  setState(() {
                    setDone(data);
                    todo.isDone = true;
                  });
                },
                child: todo.isDone
                    ? Icon(Icons.check_box)
                    : Icon(Icons.check_box_outline_blank)),
          )
        ],
      ),
    );
  }

  setDone(DocumentSnapshot data) async {
    await data.reference.updateData({'isDone' : true});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.deepPurple.shade300,
        title: new Text(
          "Routine of the day",
          style: new TextStyle(
            fontFamily: 'Raleway',
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: <Color>[
          Colors.blue.shade200,
          Colors.deepPurpleAccent.shade100.withOpacity(.5)
        ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: buildBody(),
      ),
    );
  }

  Widget buildBody() {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('tasks').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
        global.tasks = snapshot.data.documents;
        return buildList(global.tasks);
      },
    );
  }

  Widget buildList(List<DocumentSnapshot> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 5.0),
      children: snapshot.map((data) => _buildItem(data)).toList(),
    );
  }

//  Column(
//  children: <Widget>[
//  _buildItem(ToDo("Make breakfast",
//  "Would you like an omlette or a bagel, this morning?")),
//  _buildItem(ToDo("Go out for a walk",
//  "Should you take a walk in Regent's Park or St James's Park?")),
//  _buildItem(ToDo("Call a loved one",
//  "Why don't we give your son, Mark, a call?")),
//  ],
//  )
}
