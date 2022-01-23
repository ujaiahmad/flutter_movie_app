import 'form_screen.dart';
import 'package:flutter/material.dart';

import 'main_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home:
          MainPage(), //you guys can change this... i merged movie api and forgot to replace this, but the code should work fine
    );
  }
}
