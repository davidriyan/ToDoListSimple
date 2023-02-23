import 'package:flutter/material.dart';
import './add_task_screen.dart';
import 'package:todolist_simple/task_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Task> _tasks = []; //membuat list tugas atau pekerjaan

  @override
  void initState() {
    super.initState();
  }

//membuat function boolean untuk button done
  void _toggleTask(Task task) {
    setState(() {
      task.isDone = !task.isDone;
    });
  }

//membuat funtiom untuk menambahkan tugas atau pekerjaan
  void _addTask(String title, String description) {
    setState(() {
      _tasks.add(Task(title: title, description: description));
    });
  }

//membuat function untuk delete button
  void _deleteTask(Task task) {
    setState(() {
      _tasks.remove(task);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: ListView.builder(
        itemCount: _tasks.length,
        itemBuilder: (context, index) {
          final task = _tasks[index];
          return
              //membuat listile yang akan menampung jumlah list task atau pekerjaan
              ListTile(
            title: Text(
              task.title,
              style: TextStyle(
                fontSize: 18.0,
                decoration: task.isDone ? TextDecoration.lineThrough : null,
              ),
            ),
            subtitle: Text(task.description),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => _deleteTask(task),
            ),
            onTap: () => _toggleTask(task),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AddTaskScreen(onAddTask: _addTask)),
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}
