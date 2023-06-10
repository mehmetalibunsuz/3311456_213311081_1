import 'package:flutter/material.dart';
import 'components/dialog_box.dart';
import 'components/todo_tile.dart';
import 'helpers/helpers_database.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  final _controller = TextEditingController();
  List<List<dynamic>> toDoList = [];

  final dbHelper = DatabaseHelper();

  @override
  void initState() {
    super.initState();
    loadToDoList();
  }

  void loadToDoList() async {
    final data = await dbHelper.getToDoList();
    setState(() {
      toDoList = data.map((item) => [item['taskName'], item['taskCompleted'] == 1]).toList();
    });
  }

  void checkBoxChanged(bool? value, int index) async {
    final int id = index + 1; // Assuming the ID starts from 1
    final int completed = value! ? 1 : 0;
    await dbHelper.updateTask(id, completed);
    setState(() {
      toDoList[index][1] = value;
    });
  }

  void saveNewTask() async {
    final taskName = _controller.text;
    final taskCompleted = 0; // Assuming new tasks are not completed by default
    final int id = await dbHelper.insertTask(taskName, taskCompleted);
    setState(() {
      toDoList.add([taskName, taskCompleted == 1]);
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

  void deleteTask(int index) async {
    final int id = index + 1; // Assuming the ID starts from 1
    await dbHelper.deleteTask(id);
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
