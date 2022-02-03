//import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/movie%20by%20popularity/movie_popularity_widget.dart';
import 'package:flutter_movie_app/movie%20by%20year/movie_year_widget.dart';
import 'package:flutterfire_ui/auth.dart';

import 'movie_bucket_list/movie_bucket_list.dart';
// import 'package:firebase_auth/firebase_auth.dart'; // new
// import 'package:firebase_core/firebase_core.dart'; // new
// import 'package:provider/provider.dart'; // new
// import 'firebase_options.dart'; // new
// import 'src/authentication.dart'; // new
//import 'src/widgets.dart';

// void main() {
//   runApp(MaterialApp(
//     home: MainPage(),
//   ));
// }

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

 

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  
  User? currenUser = FirebaseAuth.instance.currentUser; //get current user information

  @override
  Widget build(BuildContext context) {
    // print(widget.user!); // this give all , need to send it to other 2
    // print(widget.user!.email); // this give email of thee user
    // print(widget.user!.uid); // this give user id
    // print(currenUser); // this give all , need to send it to other 2
    // print(currenUser!.email); // this give email of thee user
    // print(currenUser!.uid); // this give user id
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.purple[600],
            title: const Text('Movie App'),
            actions: [SignOutButton()],
            bottom: const TabBar(tabs: [
              Tab(child: Text('2020 Movies')),
              Tab(
                child: Text('Popular Movies'),
              ),
              Tab(
                child: Text('My Bucket List'),
              )
            ]),
          ),
          body: TabBarView (
            children: [
              MovieYearCustomCard(),
              MoviePopularityCustomCard(),
              MovieBucketListWidget(),
            ],
          ),
        ));
  }
}
