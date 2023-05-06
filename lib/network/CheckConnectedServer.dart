import 'dart:async';
import 'package:http/http.dart' as http;

Future<bool> checkServerConnection(String url) async {
  try {
    final response = await http.head(Uri.parse(url));
    return response.statusCode == 200;
  } catch (e) {
    return false;
  }
}
