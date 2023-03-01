class AuthenticationService {
  get http => null;

  Future<String> login(String email, String password) async {
    // Add logic to log the user in using the email and password
    try {
      // Make a network request to log the user in
      final response = await http.post(
        Uri.parse('localhost:3000/users'),
        body: {'email': email, 'password': password},
      );

      if (response.statusCode == 200) {
        // Return the authentication token if the request was successful
        final token = response.body;
        return token;
      } else {
        // Throw an exception if the request was not successful
        throw Exception('Failed to log in');
      }
    } catch (e) {
      // Catch any exceptions thrown during the authentication process
      print('Error logging in: $e');
      rethrow;
    }
  }
}
