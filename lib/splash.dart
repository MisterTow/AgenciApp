import 'package:agencia/main.dart';
import 'package:flutter/material.dart';

void main() => runApp(splash());

class splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MaterialApp',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('App Bar'),
        ),
        body: Center(
          child: Container(
            child: const Text('Hello Work hola'),
          ),
        ),
      ),
    );
  }
}
