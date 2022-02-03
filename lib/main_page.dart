import 'package:flutter/material.dart';
import 'package:flutter_movie_app/movie%20by%20popularity/movie_popularity_widget.dart';
import 'package:flutter_movie_app/movie%20by%20year/movie_year_widget.dart';
import 'package:flutterfire_ui/auth.dart';

import 'movie_bucket_list/movie_bucket_list.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

 

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  
  //User? currenUser = FirebaseAuth.instance.currentUser; //get current user information
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.purple[600],
            title: const Text('Movie App'),
            actions: const [SignOutButton()],
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
              const MovieYearCustomCard(),
              const MoviePopularityCustomCard(),
              MovieBucketListWidget(),
            ],
          ),
        ));
  }
}
