import 'package:flutter/material.dart';
import '../models/task.dart';
import '../widgets/task_tile.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Task> tasks = [
      Task(
        id: 1,
        title: 'Сходить в магазин',
        description: 'Купить молоко и хлеб',
        date: DateTime.now(),
        isCompleted: false,
      ),
      Task(
        id: 2,
        title: 'Сделать дз',
        description: 'Лабораторная по Flutter',
        date: DateTime.now().add(Duration(days: 1)),
        isCompleted: true,
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Мои задачи')),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return TaskTile(task: tasks[index]);
        },
      ),
    );
  }
}
