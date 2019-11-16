import 'package:binary_project/Tasks/ToDo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToDoListCareTaker extends StatefulWidget {
	@override
	_ToDoListCareTakerState createState() => _ToDoListCareTakerState();
}

class _ToDoListCareTakerState extends State<ToDoListCareTaker> {
	List<ToDo> todos = [];

	_toggleToDo(ToDo todo, bool isChecked) {
		setState(() {
			todo.isDone = isChecked;
		});
	}

	_addToFireBase(){
		return;
	}

	Widget _buildItem(ToDo todo) {
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
				child: Column(
					children: <Widget>[
						Row(
							children: <Widget>[
								RaisedButton(
									//to add function presed button
									onPressed: _addToFireBase,
									child: Text('Add new task'),
								),
							],
						),
						_buildItem(ToDo("Make breakfast",
							"Would you like an omlette or a bagel, this morning?")),
						_buildItem(ToDo("Go out for a walk",
							"Should you take a walk in Regent's Park or St James's Park?")),
						_buildItem(ToDo("Call a loved one",
							"Why don't we give your son, Mark, a call?")),
					],
				),
			),
		);
	}
}
