import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

class Club {
  String name;
  String id;

  Club({
    required this.name,
    required this.id,
  });

  factory Club.fromJson(Map<String, dynamic> json) {
    return Club(
      name: json["name"],
      id: json["_id"],
    );
  }
}

Future<Club> fetchClub() async {
  final response =
      await http.get(Uri.parse('http://192.168.103.239:3000/api/v1/clubs'));

  print(jsonDecode(response.body));
  if (response.statusCode == 200) {
    return Club.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('failed to load clubs');
  }
}
