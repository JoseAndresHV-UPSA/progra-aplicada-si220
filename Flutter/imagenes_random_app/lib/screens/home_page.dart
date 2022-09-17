import 'package:flutter/material.dart';
import '../models/random_image.dart';
import '../services/api_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<RandomImage> _randomList = [];
  bool _isLoading = false;

  _getRandom() async {
    setState(() {
      _isLoading = true;
    });
    var image = await ApiService.getRandom();
    setState(() {
      _randomList.add(image);
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Primer Parcial'),
        actions: [
          ElevatedButton(
            onPressed: _getRandom,
            child: const Text('Nueva Foto'),
          ),
        ],
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: _randomList.length,
            itemBuilder: (context, index) {
              return Card(
                child: Image.network(
                  _randomList[index].message,
                  fit: BoxFit.fill,
                ),
              );
            },
          ),
          if (_isLoading)
            const Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}
