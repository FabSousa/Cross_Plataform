import 'dart:convert';

import 'package:http_demo/http_demo.dart' as http_demo;
import 'package:http/http.dart' as http;

void main(List<String> arguments) {
  getTodo(1);
  getTodos();
}

Future<Todo?> getTodo(int id) async {
  final uri = Uri.parse('https://jsonplaceholder.typicode.com/todos/$id');
  final response = await http.get(uri);

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = jsonDecode(response.body);

    final todo = Todo.fromJson(data);

    return todo;
  }

  return null;
}

Future<List<Todo>> getTodos() async {
  final uri = Uri.parse('https://jsonplaceholder.typicode.com/todos');
  final response = await http.get(uri);

  if(response.statusCode == 200){
    final data = jsonDecode(response.body);
    final List<Todo> todos = data.map<Todo>((map) => Todo.fromJson(map)).toList();
    return todos;
  }

  return [];
}

class Todo {
  int userId;
  int id;
  String title;
  bool completed;

  Todo(
      {required this.userId,
      required this.id,
      required this.title,
      this.completed = false});

  factory Todo.fromJson(Map<String, dynamic> map) {
    return Todo(
        userId: map['userId'],
        id: map['id'],
        title: map['title'],
        completed: map['completed']);
  }
}
