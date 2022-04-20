import 'dart:math';

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Selamat Datang',
      home: RandomWord(),
    );
  }
}

class RandomWord extends StatefulWidget {
  @override
  _RandomWordState createState() => _RandomWordState();
}

class _RandomWordState extends State<RandomWord> {
  String randomWord = WordPair.random().asString;

  void _changeWord() {
    setState(() {
      randomWord = WordPair.random().asString;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Aplikasi Flutter ke 2')),
      body: Center(child: Text(randomWord, style: TextStyle(fontSize: 40))),
      floatingActionButton: FloatingActionButton(
          onPressed: _changeWord, child: Icon(Icons.play_arrow)),
    );
  }
}
