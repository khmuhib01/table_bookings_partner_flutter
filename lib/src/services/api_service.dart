// lib/src/services/api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

const String BASE_URL = 'https://apiservice.tablebookings.co.uk/api/v1';

Future<void> saveToken(String token) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('token', token);
}

Future<String?> getToken() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('token');
}

Future<Map<String, dynamic>?> login(String username, String password) async {
  final url = Uri.parse('$BASE_URL/user/login');
  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({'username': username, 'password': password}),
  );

  // Console log raw response
  print('Login API body: ${response}');

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    print('Parsed login data: \$data');
    if (data['token'] != null) {
      await saveToken(data['token']);
    }
    return data;
  } else {
    return null;
  }
}

Future<http.Response> fetchBookings() async {
  final token = await getToken();
  final url = Uri.parse('$BASE_URL/bookings');
  return http.get(
    url,
    headers: {
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    },
  );
}
