import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/random_image.dart';

class ApiService {
  static String url = 'https://dog.ceo/api/breeds/image/random';

  static Future<RandomImage> getRandom() async {
    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      // ignore: avoid_print
      print(jsonResponse);
      return RandomImage.fromJson(jsonResponse);
    } else {
      throw Exception('Error al llamar al API');
    }
  }
}
