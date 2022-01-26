import 'login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'main_page.dart';
import 'package:provider/provider.dart';
import 'auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey:
              'AAAALyPyB3U:APA91bHsIgwO1HzJR3dwz7h1TDHqsxEFRY35HDqY5lmz3jHXXlz4PYxX1W6BIqG3Jttkiej_WBfyqW9Bzn5wKYgN5iYXNNTZFgvPSWk1YA1gpeWmxy2eM1dV5lBMkd6uWRURrd-55nut',
          appId: '1:202466527093:ios:81a62b19c309dda593753c',
          messagingSenderId: '202466527093',
          projectId: 'flutter-movie-app-aa745'));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: LoginPage(),
    );
  }
}
