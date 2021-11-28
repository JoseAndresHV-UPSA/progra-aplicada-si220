import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../Models/book.dart';

class ApiService {
  final String url = 'https://jwtcoreapi.azurewebsites.net/api/Books/';

  Future<List<Book>> getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    List<Book> books = [];

    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);

      for (var model in jsonResponse) {
        Book book = Book.fromJson(model);
        books.add(book);
      }
    }
    return books;
  }

  Future<Book> getDataById(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    final response = await http.get(Uri.parse(url + id.toString()), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      return Book.fromJson(jsonResponse);
    } else {
      throw Exception('Error al llamar al API');
    }
  }

  Future<Book> postData(Book book) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    Map data = {'title': book.title, 'author': book.author};

    final response = await http.post(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(data));

    if (response.statusCode == 201) {
      var jsonResponse = jsonDecode(response.body);
      return Book.fromJson(jsonResponse);
    } else {
      throw Exception('Error al llamar al API');
    }
  }

  Future<void> updateData(Book book) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    Map data = {'id': book.id, 'title': book.title, 'author': book.author};

    await http.put(Uri.parse(url + book.id.toString()),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(data));
  }

  Future<void> deleteData(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    await http.delete(Uri.parse(url + id.toString()), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
  }
}
