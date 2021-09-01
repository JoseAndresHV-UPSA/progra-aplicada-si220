import 'dart:convert';
import 'album.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String url = 'https://jsonplaceholder.typicode.com/albums/';

  Future<List<Album>> getData() async {
    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      List<Album> albums = [];
      for (var model in jsonResponse) {
        Album album = Album.fromJson(model);
        albums.add(album);
      }

      return albums;
    } else {
      throw Exception('Error al llamar al API');
    }
  }
}
