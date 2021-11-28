import 'package:final_app/Models/book.dart';
import 'package:final_app/Services/api_service.dart';
import 'package:final_app/Views/edit.dart';
import 'package:flutter/material.dart';

import 'home.dart';

// ignore: must_be_immutable
class DetailsPage extends StatefulWidget {
  Book book;
  DetailsPage({
    Key? key,
    required this.book,
  }) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  ApiService service = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: SafeArea(
        child: Center(
            child: Column(
          children: [
            const Icon(
              Icons.book,
              size: 200,
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  const Text(
                    'Id: ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  Text(
                    widget.book.id.toString(),
                    style: const TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  const Text(
                    'Title: ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  Text(
                    widget.book.title,
                    style: const TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  const Text(
                    'Author: ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  Text(
                    widget.book.author,
                    style: const TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(40.0),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditPage(book: widget.book)),
                        (Route<dynamic> route) => false);
                  },
                  child: const Text('Edit')),
            ),
            ElevatedButton(
                onPressed: () {
                  service.deleteData(widget.book.id);
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const Home()),
                      (Route<dynamic> route) => false);
                },
                child: const Text('Delete')),
          ],
        )),
      ),
    );
  }
}
