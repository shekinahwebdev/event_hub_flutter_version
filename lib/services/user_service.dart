import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class UserService {
  static String get _baseUrl {
    if (kIsWeb) {
      return 'http://localhost:5009/api';
    }

    if (defaultTargetPlatform == TargetPlatform.android) {
      return 'http://10.0.2.2:5009/api';
    }

    return 'http://localhost:5009/api';
  }

  static Future<Map<String, dynamic>> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/auth/signup'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'name': name, 'email': email, 'password': password}),
    );

    final data = _decodeBody(response.body);
    if (response.statusCode != 201) {
      final message = (data['message'] ?? 'Sign up failed') as String;
      final error = data['error'] as String?;
      throw Exception(error == null ? message : '$message ($error)');
    }

    return data;
  }

  static Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    final data = _decodeBody(response.body);
    if (response.statusCode != 200) {
      final message = (data['message'] ?? 'Login failed') as String;
      final error = data['error'] as String?;
      throw Exception(error == null ? message : '$message ($error)');
    }

    return data;
  }

  static Map<String, dynamic> _decodeBody(String body) {
    if (body.isEmpty) {
      return {};
    }
    final dynamic decoded = jsonDecode(body);
    if (decoded is Map<String, dynamic>) {
      return decoded;
    }

    return {};
  }

  static Map<String, String> _authHeaders(String token) {
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }
}
