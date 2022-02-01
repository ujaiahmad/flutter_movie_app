//import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/movie%20by%20popularity/movie_popularity_widget.dart';
import 'package:flutter_movie_app/movie%20by%20year/movie_year_widget.dart';
import 'package:flutterfire_ui/auth.dart';

import 'movie bucket list/movie_bucket_list.dart';
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
  MainPage({Key? key, required this.user}) : super(key: key);

  final User? user;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List movieBucket =
      []; //store the liked movie name and the boolList(true/false)

  //function add movie title + boollist into the bucket list
  addMovieIntobucket(movie, boolList) {
    movieBucket.add([movie, !boolList]);

    //print(movieBucket); //for debugging
  }

  removeMovieFromBucket(movie) {
    //get the index of the unliked movie and remove ti
    movieBucket
        .removeAt(movieBucket.indexWhere((element) => element[0] == movie));
    //print(movieBucket); //for debuggin
  }

  @override
  Widget build(BuildContext context) {
      print(widget.user!); // this give all , need to send it to other 2
     print(widget.user!.email); // this give email of thee user
     print(widget.user!.uid); // this give user id
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.purple[600],
            title: const Text('Movie App'),
            actions: [
                  SignOutButton()
                      ],
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
          body: TabBarView(
            children: [
              MovieYearCustomCard(
                  movieBucket, addMovieIntobucket, removeMovieFromBucket),
              MoviePopularityCustomCard(
                  movieBucket, addMovieIntobucket, removeMovieFromBucket),
              MovieBucketListWidget(movieBucket)
            ],
          ),
        ));
  }
}
