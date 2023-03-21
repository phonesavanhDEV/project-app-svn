import 'package:flutter/foundation.dart';
import '../models/user_model.dart';
import '../services/authentication_service.dart';

class UserRepository {
  final ApiService apiService;

  UserRepository({required this.apiService});

  Future<User?> login({required String email, required String password}) async {
    final response = await apiService.login(email: email, password: password);
    if (response.statusCode == 200) {
      final jsonData = response.data;
      final user = User.fromJson(jsonData);
      return user;
    } else {
      // Handle login error
      return null;
    }
  }
}
