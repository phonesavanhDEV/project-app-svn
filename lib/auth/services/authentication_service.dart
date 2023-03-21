import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import '../models/user_model.dart';

class ApiService {
  final Dio dio;

  ApiService({required this.dio});

  Future<Response<dynamic>> login(
      {required String email, required String password}) async {
    final response = await dio
        .post('/users/login', data: {'email': email, 'password': password});
    return response;
  }
}
