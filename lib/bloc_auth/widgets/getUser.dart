import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../path/pathContact.dart';
import '../models/User.dart';

Future<User> fetchUserData(String username) async {
  final pathContact contactPath = pathContact();
  final response = await http.post(
    Uri.parse(contactPath.getRepoPathUser()),
    body: {'username': username},
  );

  if (response.statusCode == 200) {
    final userData = jsonDecode(response.body);
    final employee_code = userData['employee_code'];
    final user_fullname = userData['user_fullname'];
    return User(employee_code: employee_code, user_fullname: user_fullname);
  } else {
    throw Exception('Failed to fetch user data');
  }
}
