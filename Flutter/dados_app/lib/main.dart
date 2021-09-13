import 'package:flutter/material.dart';
import 'package:shake/shake.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DadosApp',
      theme: ThemeData(primarySwatch: Colors.green),
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
  static const List<String> imgs = [
    'https://previews.123rf.com/images/imagevectors/imagevectors1803/imagevectors180300007/97719825-dados-blancos-n%C3%BAmero-1-icono-.jpg',
    'https://previews.123rf.com/images/imagevectors/imagevectors1803/imagevectors180300003/97719821-icono-de-dados-blancos-n%C3%BAmero-2-.jpg',
    'https://previews.123rf.com/images/imagevectors/imagevectors1803/imagevectors180300009/97719827-dados-blancos-n%C3%BAmero-3-icono-de-vector-.jpg',
    'https://previews.123rf.com/images/imagevectors/imagevectors1803/imagevectors180300001/97719819-dados-blancos-n%C3%BAmero-4-icono-.jpg',
    'https://previews.123rf.com/images/imagevectors/imagevectors1803/imagevectors180300005/97719823-dados-blancos-n%C3%BAmero-5-icono-.jpg',
    'https://previews.123rf.com/images/imagevectors/imagevectors1803/imagevectors180300002/97719820-dados-blancos-n%C3%BAmero-6-icono-.jpg'
  ];

  String imgDado1 = imgs.first;
  String imgDado2 = imgs.first;

  int random(int min, int max) {
    final rnd = new Random();
    return min + rnd.nextInt(max - min);
  }

  void tirarDados() {
    setState(() {
      this.imgDado1 = imgs.elementAt(random(0, 5));
      this.imgDado2 = imgs.elementAt(random(0, 5));
    });
  }

  ShakeDetector? detector;

  @override
  void initState() {
    super.initState();

    detector = ShakeDetector.autoStart(onPhoneShake: tirarDados);
  }

  @override
  void dispose() {
    detector!.stopListening();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tira dados'),
      ),
      body: Container(
        padding: EdgeInsets.all(48),
        child: Column(
          children: [Image.network(imgDado1), Image.network(imgDado2)],
        ),
      ),
    );
  }
}
