import 'package:flutter/material.dart';
import 'package:albums_app/api_service.dart';

import 'album.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Albums App',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        debugShowCheckedModeBanner: false,
        home: Home());
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ApiService service = ApiService();
  late Future<List<Album>> futureAlbums;

  @override
  void initState() {
    super.initState();
    futureAlbums = service.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Albums'),
      ),
      body: Center(
          child: FutureBuilder<List<Album>>(
              future: futureAlbums,
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title:
                            Text('Id: ' + snapshot.data[index].id.toString()),
                        subtitle: Text('Titulo: ' + snapshot.data[index].title),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Center(
                      child: Text('Ocurrio un error: ${snapshot.error}'));
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              })),
    );
  }
}
