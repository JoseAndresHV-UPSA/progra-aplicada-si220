import 'dart:convert';
import 'package:final_app/Views/Auth/login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isLoading = false;

  final TextEditingController userController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  register(String user, email, pass) async {
    String url =
        'https://jwtcoreapi.azurewebsites.net/api/Authenticate/register';
    var response = await http.post(Uri.parse(url),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        },
        body: jsonEncode({
          "username": user,
          "email": email,
          "password": pass,
        }));
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      if (jsonResponse != null) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
            (Route<dynamic> route) => false);
      }
    } else {
      _alert('Register Error', 'Mensaje de error');
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
          title: const Text('Register user'),
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
                        controller: emailController,
                        decoration: const InputDecoration(
                          labelText: 'Email',
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
                                register(userController.text,
                                    emailController.text, passController.text);
                              },
                              child: const Text(
                                'Register',
                              ))),
                      TextButton(
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginPage()),
                                (Route<dynamic> route) => false);
                          },
                          child: const Text('Login user'))
                    ],
                  ),
          ),
        ));
  }
}
