import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/task.dart';

class ApiService {
  static Future<List<Task>> getTasksForCurrentWeek() async {
    final now = DateTime.now();
    final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    final endOfWeek = startOfWeek.add(const Duration(days: 6));

    final response = await http.get(Uri.parse(
        'https://your-backend.com/tasks?start=${startOfWeek.toIso8601String()}&end=${endOfWeek.toIso8601String()}'));

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((item) => Task.fromJson(item)).toList();
    } else {
      throw Exception('Не удалось загрузить задачи');
    }
  }
}
