import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BarajaApp',
      home: Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final String url = 'https://magico.azurewebsites.net/Baraja';
  String img = 'https://www.seekpng.com/png/detail/77-778644_use-these-cartas-clip-art-on-cartas-de.png';

  Future<void> getData() async {
    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      print(jsonData);

      String nuevaImg = jsonData['carta'];
      setState(() {
        img = nuevaImg;
      });

    } else {
      throw Exception('Error al llamar al API');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi nombre - Registro'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        children: [
          ElevatedButton(
              child: Text('Obtener carta'),
              onPressed: () {
                getData();
              }),
          Image.network(img),
        ],
      ),
    );
  }
}
