import 'dart:convert';
import 'package:final_app/Views/Auth/register.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;

  final TextEditingController userController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  login(String user, pass) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String url = 'https://jwtcoreapi.azurewebsites.net/api/Authenticate/login';
    var response = await http.post(Uri.parse(url),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        },
        body: jsonEncode({
          "username": user,
          "password": pass,
        }));
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      if (jsonResponse != null) {
        var token = jsonResponse['token'];
        prefs.setString('token', token);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const Home()),
            (Route<dynamic> route) => false);
      }
    } else {
      _alert('Login Error', 'Mensaje de error');
    }
    setState(() {
      _isLoading = false;
    });
  }

  _alert(String title, body) {
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(body),
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login user'),
        ),
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(48),
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : ListView(
                    children: [
                      const Icon(Icons.person, size: 200),
                      TextFormField(
                        controller: userController,
                        decoration: const InputDecoration(
                          labelText: 'Username',
                        ),
                      ),
                      TextFormField(
                        controller: passController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                        ),
                      ),
                      Container(
                          padding: const EdgeInsets.symmetric(vertical: 48),
                          child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _isLoading = true;
                                });
                                login(userController.text, passController.text);
                              },
                              child: const Text(
                                'Login',
                              ))),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const RegisterPage()));
                          },
                          child: const Text('Register user'))
                    ],
                  ),
          ),
        ));
  }
}
