import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:user_app/user.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UserApp',
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
  TextEditingController idController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController suiteController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController zipcodeController = TextEditingController();
  TextEditingController latController = TextEditingController();
  TextEditingController lngController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController websiteController = TextEditingController();
  TextEditingController nameCompanyController = TextEditingController();
  TextEditingController catchPhraseController = TextEditingController();
  TextEditingController bsController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  final String url = 'https://jsonplaceholder.typicode.com/users/';

  Future<void> getData(int id) async {
    final response = await http.get(Uri.parse(url + id.toString()), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      print(jsonData);
      User user = User.fromJson(jsonData);
      nameController.text = 'name: ' + user.name;
      usernameController.text = 'username: ' + user.username;
      emailController.text = 'email: ' + user.email;
      streetController.text = 'street: ' + user.address.street;
      suiteController.text = 'suite: ' + user.address.suite;
      cityController.text = 'city: ' + user.address.city;
      zipcodeController.text = 'zipcode: ' + user.address.zipcode;
      latController.text = 'lat: ' + user.address.geo.lat.toString();
      lngController.text = 'lng: ' + user.address.geo.lng.toString();
      phoneController.text = 'phone: ' + user.phone;
      websiteController.text = 'website: ' + user.website;
      nameCompanyController.text = 'name: ' + user.company.name;
      catchPhraseController.text = 'catchPhrase: ' + user.company.name;
      bsController.text = 'bs: ' + user.company.bs;
    } else {
      throw Exception('Error al llamar al API');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.network("https://i.postimg.cc/7Z3DXLcN/30439829.png"),
            Center(child: Text('Mi nombre - Registro'))
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        children: [
          TextFormField(
              controller: idController,
              decoration: InputDecoration(hintText: "Ingresar id:")),
          ElevatedButton(
              child: Text('Obtener informacion'),
              onPressed: () {
                getData(int.parse(idController.text));
              }),
          Container(child: Divider()),
          TextFormField(
              controller: nameController,
              readOnly: true,
              decoration:
                  InputDecoration(hintText: "name:", border: InputBorder.none)),
          TextFormField(
              controller: usernameController,
              readOnly: true,
              decoration: InputDecoration(
                  hintText: "username:", border: InputBorder.none)),
          TextFormField(
              controller: emailController,
              readOnly: true,
              decoration: InputDecoration(
                  hintText: "email:", border: InputBorder.none)),
          Container(child: Divider()),
          Text('Address:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          TextFormField(
            controller: streetController,
            readOnly: true,
            decoration:
                InputDecoration(hintText: "street:", border: InputBorder.none),
          ),
          TextFormField(
            controller: suiteController,
            readOnly: true,
            decoration:
                InputDecoration(hintText: "suite:", border: InputBorder.none),
          ),
          TextFormField(
            controller: cityController,
            readOnly: true,
            decoration:
                InputDecoration(hintText: "city:", border: InputBorder.none),
          ),
          TextFormField(
            controller: zipcodeController,
            readOnly: true,
            decoration:
                InputDecoration(hintText: "zipcode:", border: InputBorder.none),
          ),
          Container(child: Divider()),
          Text('Geo:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          TextFormField(
            controller: latController,
            readOnly: true,
            decoration:
                InputDecoration(hintText: "lat:", border: InputBorder.none),
          ),
          TextFormField(
            controller: lngController,
            readOnly: true,
            decoration:
                InputDecoration(hintText: "lng:", border: InputBorder.none),
          ),
          TextFormField(
            controller: phoneController,
            readOnly: true,
            decoration:
                InputDecoration(hintText: "phone:", border: InputBorder.none),
          ),
          TextFormField(
            controller: websiteController,
            readOnly: true,
            decoration:
                InputDecoration(hintText: "website:", border: InputBorder.none),
          ),
          Container(child: Divider()),
          Text('Company:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          TextFormField(
            controller: nameCompanyController,
            readOnly: true,
            decoration:
                InputDecoration(hintText: "name:", border: InputBorder.none),
          ),
          TextFormField(
            controller: catchPhraseController,
            readOnly: true,
            decoration: InputDecoration(
                hintText: "catchPhrase:", border: InputBorder.none),
          ),
          TextFormField(
            controller: bsController,
            readOnly: true,
            decoration:
                InputDecoration(hintText: "bs:", border: InputBorder.none),
          ),
          Container(child: Divider()),
        ],
      ),
    );
  }
}
