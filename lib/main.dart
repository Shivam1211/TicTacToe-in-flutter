import 'package:flutter/material.dart';
import 'HomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tic Tac Toe',
        home: HomePage(),
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
      ),
    );
  }
}