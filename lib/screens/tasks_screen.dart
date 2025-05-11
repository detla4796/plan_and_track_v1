import 'package:flutter/material.dart';
import '../models/task.dart';
import '../widgets/task_tile.dart';

class TasksScreen extends StatelessWidget {
  final List<Task> tasks;

  const TasksScreen({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Задачи недели'),
      ),
      body: tasks.isEmpty ? const Center(child: Text('Нет задач на эту неделю')) : ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return TaskTile(task: tasks[index]);
        },
      ),
    );
  }
}
