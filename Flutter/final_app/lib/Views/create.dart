import 'package:final_app/Models/book.dart';
import 'package:final_app/Services/api_service.dart';
import 'package:final_app/Views/home.dart';
import 'package:flutter/material.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final TextEditingController idController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController authorController = TextEditingController();

  ApiService service = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create'),
      ),
      body: SafeArea(
          child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        children: [
          const Icon(Icons.book, size: 200),
          TextFormField(
            controller: idController,
            decoration: const InputDecoration(
              labelText: 'Id',
            ),
          ),
          TextFormField(
            controller: titleController,
            decoration: const InputDecoration(
              labelText: 'Title',
            ),
          ),
          TextFormField(
            controller: authorController,
            decoration: const InputDecoration(
              labelText: 'Author',
            ),
          ),
          Container(
            margin: const EdgeInsets.all(40.0),
            child: ElevatedButton(
                onPressed: () {
                  Book book = Book(
                      id: int.parse(idController.text),
                      title: titleController.text,
                      author: authorController.text);
                  service.postData(book);
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const Home()),
                      (Route<dynamic> route) => false);
                },
                child: const Text('Create')),
          ),
        ],
      )),
    );
  }
}
