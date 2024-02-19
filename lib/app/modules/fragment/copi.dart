import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Contoh Fragment Flutter'),
        ),
        body: MyFragment(),
      ),
    );
  }
}

class MyFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: EdgeInsets.only(bottom: 20.0),
        child: Text(
          'Copyright ©Meildy 2024',
          style: TextStyle(
            fontSize: 14.0,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
