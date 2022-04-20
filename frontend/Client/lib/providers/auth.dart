import 'dart:convert';
// import 'package:dio/dio.dart';

import 'package:flutter/widgets.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Auth with ChangeNotifier {
  String _token = '';
  DateTime _expiryDate = DateTime.now();
  String _userId = '';

  Future<void> signup(
    String firstName,
    String lastName,
    String email,
    String password,
  ) async {
    // return _authenticate(email, password, 'signup');

    const url = 'http://10.2.83.33:3000/api/v1/users/signup';
    final response = await http.post(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'firstName': firstName,
          'lastName': lastName,
          'email': email,
          'password': password,
        }));
    print(jsonDecode(response.body));
  }

  Future<void> login(String email, String password) async {
    // return _authenticate(email, password, 'login');
    const url = 'http://10.2.83.33:3000/api/v1/users/login';
    final response = await http.post(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({'email': email, 'password': password}));
  }
}
