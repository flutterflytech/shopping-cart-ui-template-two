import 'dart:convert';
import 'package:http/http.dart' as http;
import 'data_json.dart';

class Repository {
  Future<List<Data>> fetchData() async {
    final response = await http.get(
        'https://my-json-server.typicode.com/ravishankarsingh1996/demoJsonRepo/db');

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON.
      var data = json.decode(response.body);
      var rest = data['data'] as List;
      List<Data> data_list = rest.map((json) => Data.fromJson(json)).toList();
      return data_list;
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
