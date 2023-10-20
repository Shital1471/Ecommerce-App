import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class API {
  static Future<List<dynamic>> getCategories() async {
    try {
      final response = await http.get(Uri.parse('https://api.escuelajs.co/api/v1/products'));
      log('API call: $response');

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        // log('Data: ${jsonEncode(data)}');
        return data;
      } else {
        log('Failed to load categories. Status code: ${response.statusCode}');
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      log('Error: $e');
      throw e;
    }
  }
}
