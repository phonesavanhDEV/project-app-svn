import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthenticationService {
  UserApi _userApi;

  AuthenticationService(this._userApi);

  Future<String> login(String username, String password) async {
    // Validate input
    if (username.isEmpty || password.isEmpty) {
      throw Exception('Username and password are required.');
    }

    // Authenticate user
    final user = await _userApi.authenticateUser(username, password);

    // Generate token
    final token = generateToken(user);

    // Return token
    return token;
  }

  String generateToken(User user) {
    // Generate a random token based on user data
    return 'some-random-token';
  }
}

class User {
  final String username;

  User(this.username);
}

class UserApi {
  final String apiKey;
  UserApi(this.apiKey);
  Future<User> authenticateUser(String username, String password) async {
    // Make a request to the user API to authenticate the user
    // and return the authenticated user object
    // Pass the API key in the request headers
    final response = await http.post(
      Uri.parse('https://178.128.221.69/users'),
      headers: {
        'Authorization': 'Bearer $apiKey',
      },
      body: {
        'username': username,
        'password': password,
      },
    );

    // Parse the response and return the user object
    final userJson = jsonDecode(response.body);
    return User(userJson['username']);
  }
}
