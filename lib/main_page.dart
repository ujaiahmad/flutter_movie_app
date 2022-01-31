//import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_movie_app/movie%20by%20popularity/movie_popularity_widget.dart';
import 'package:flutter_movie_app/movie%20by%20year/movie_year_widget.dart';

import 'movie bucket list/movie_bucket_list.dart';
// import 'package:firebase_auth/firebase_auth.dart'; // new
// import 'package:firebase_core/firebase_core.dart'; // new
// import 'package:provider/provider.dart'; // new
// import 'firebase_options.dart'; // new
// import 'src/authentication.dart'; // new
//import 'src/widgets.dart';

void main() {
  runApp(MaterialApp(
    home: MainPage(),
  ));
}

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

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
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.purple[600],
            centerTitle: true,
            title: const Text('Movie Bucket List'),
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
