import 'package:final_app/Models/book.dart';
import 'package:final_app/Services/api_service.dart';
import 'package:final_app/Views/create.dart';
import 'package:final_app/Widgets/books_list.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Auth/login.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late SharedPreferences prefs;
  var service = ApiService();
  late Future<List<Book>> books;

  @override
  void initState() {
    super.initState();
    checkLogin();
    books = service.getData();
  }

  _onRefresh() async {
    setState(() {
      books = service.getData();
    });
  }

  checkLogin() async {
    prefs = await SharedPreferences.getInstance();
    if (prefs.getString('token') == null) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
          (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Final App'),
          actions: [
            TextButton(
                onPressed: () {
                  prefs.clear();
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
                      (Route<dynamic> route) => false);
                },
                child: const Text(
                  'Logout',
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () => _onRefresh(),
          child: SafeArea(child: BooksList(books: books)),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const CreatePage()));
          },
          label: const Text('Add Book'),
          icon: const Icon(Icons.add),
        ));
  }
}
