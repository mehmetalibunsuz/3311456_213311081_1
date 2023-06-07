import 'package:flutter/material.dart';
import 'package:health/components/constants.dart';

import 'components/dialog_box.dart';
import 'components/todo_tile.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  final _controller = TextEditingController();
  List toDoList = [
    ["Make Tutorial", false],
    ["Do Exercise", false],
  ];
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  void saveNewTask() {
    setState(() {
      toDoList.add([_controller.text, false]);
    });
    Navigator.of(context).pop();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      backgroundColor: Theme.of(context).colorScheme.background,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 42.0, right: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'TO DO ',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 40,
                  fontFamily: 'BrunoAce',
                  fontWeight: FontWeight.bold),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: FloatingActionButton(
                backgroundColor: Theme.of(context).colorScheme.primary,
                onPressed: createNewTask,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16))),
                child: Icon(
                  Icons.add,
                  color: Theme.of(context).colorScheme.secondary,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: ListView.builder(
          itemCount: toDoList.length,
          itemBuilder: (context, index) {
            return ToDoTile(
              taskName: toDoList[index][0],
              taskCompleted: toDoList[index][1],
              onChanged: (value) => checkBoxChanged(value, index),
              deleteFunction: (context) => deleteTask(index),
            );
          },
        ),
      ),
    );
  }
}
