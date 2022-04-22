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
  var saveWords = [];
  String randomWord = WordPair.random().asString;

  void _changeWord() {
    setState(() {
      randomWord = WordPair.random().asString;
    });
  }

  void _saveWords() {
    saveWords.add(randomWord);
    Navigator.push(context, MaterialPageRoute(builder: (context) => saveWordScreen(savedWords: saveWords))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Aplikasi Flutter ke 2')),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(randomWord, style: TextStyle(fontSize: 40)),
          IconButton(icon: Icon(Icons.favorite_border), onPressed: _saveWords)
        ])),
        floatingActionButton: FloatingActionButton(
            onPressed: _changeWord, child: Icon(Icons.play_arrow)));
  }
}

class saveWordScreen extends StatelessWidget {
  var savedWords = [];

  saveWordScreen({this.savedWords });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Word'),
      ),
      body: Center(
        child: Text(savedWords.join(" - "), style: TextStyle(fontSize: 40)))
      ),
    )
  }
}
