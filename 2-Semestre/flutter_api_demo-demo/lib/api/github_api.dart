// https://api.github.com/users/octocat
// https://api.github.com/users/octocat/following

import 'dart:convert';

import 'package:github_api_demo/models/user.dart';
import 'package:http/http.dart' as http;

const token = "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";

Future<User?> getUserByName(String name) async {
  final uri = Uri.parse("https://api.github.com/users/$name");
  final response = await http.get(uri,  headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },);

  if(response.statusCode == 200){
    final Map<String, dynamic> data = jsonDecode(response.body);
    final user = User.fromJson(data);
    return user;
  }

  return null;
}

Future<List<User>?> getFollowing(String name) async {
  final uri = Uri.parse("https://api.github.com/users/$name/following");
  final response = await http.get(uri,  headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },);

  if (response.statusCode == 200){
    final data = jsonDecode(response.body);
    final List<User> users = data.map<User>((map) => User.fromJson(map)).toList();
    return users;
  }

  return null;
}