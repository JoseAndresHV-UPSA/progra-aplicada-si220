import 'package:final_app/Models/book.dart';
import 'package:final_app/Services/api_service.dart';
import 'package:final_app/Views/home.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EditPage extends StatefulWidget {
  Book book;
  EditPage({
    Key? key,
    required this.book,
  }) : super(key: key);

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final TextEditingController idController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController authorController = TextEditingController();

  ApiService service = ApiService();

  @override
  void initState() {
    idController.text = widget.book.id.toString();
    titleController.text = widget.book.title;
    authorController.text = widget.book.author;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit'),
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
                  service.updateData(book);
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const Home()),
                      (Route<dynamic> route) => false);
                },
                child: const Text('Update')),
          ),
        ],
      )),
    );
  }
}
