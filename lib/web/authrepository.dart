import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthRepository {
  final String baseUrl = "https://example.com/login.php";

  Future<Map<String, dynamic>> login(String phone, String password) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      body: {
        "phone": phone,
        "password": password,
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Failed to login");
    }
  }




}
