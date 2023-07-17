import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:suitmedia_flutter/models/user_model.dart';

Future<UserModel> fetchUsers({page = 1}) async {
  final response = await http
      .get(Uri.parse('https://reqres.in/api/users?page=$page&per_page=10'));

  if (response.statusCode == 200) {
    return UserModel.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load users');
  }
}
