import 'package:final_app/Views/details.dart';
import 'package:flutter/material.dart';

import '../Models/book.dart';

// ignore: must_be_immutable
class BooksList extends StatefulWidget {
  Future<List<Book>> books;
  BooksList({Key? key, required this.books}) : super(key: key);

  @override
  _BooksListState createState() => _BooksListState();
}

class _BooksListState extends State<BooksList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Book>>(
        future: widget.books,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data[index].title),
                  subtitle: Text(snapshot.data[index].author),
                  leading: const Icon(Icons.book),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Book book = Book(
                      id: snapshot.data[index].id,
                      title: snapshot.data[index].title,
                      author: snapshot.data[index].author,
                    );
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailsPage(book: book)));
                  },
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Ocurrio un error: ${snapshot.error}'));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
