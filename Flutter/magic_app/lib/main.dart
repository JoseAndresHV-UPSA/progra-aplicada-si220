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
      title: 'MagicApp',
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController numberLuckController = TextEditingController();
  TextEditingController luckyController = TextEditingController();

  final String url = 'https://magico.azurewebsites.net/magic';

  Future<void> getData() async {
    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      print(jsonData);

      String number = jsonData['numberLuck'].toString();
      String lucky = jsonData['lucky'].toString();

      numberLuckController.text = 'numberLuck: ' + number;
      luckyController.text = 'lucky: ' + lucky;
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
              child: Text('Obtener informacion'),
              onPressed: () {
                getData();
              }),
          TextFormField(
              controller: numberLuckController,
              readOnly: true,
              decoration:
                  InputDecoration(hintText: "numberLuck:", border: InputBorder.none)),
          TextFormField(
              controller: luckyController,
              readOnly: true,
              decoration:
                  InputDecoration(hintText: "lucky:", border: InputBorder.none)),
          Image.network(
              'http://assets.stickpng.com/images/58ee80993545163ec1942cb5.png'),
        ],
      ),
    );
  }
}
