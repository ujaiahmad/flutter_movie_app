import 'package:flutter/material.dart';
import 'package:flutter_movie_app/movie%20by%20year/movie_year_widget.dart';

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
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 1,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.purple[600],
            centerTitle: true,
            title: Text('Movie Bucket List'),
            bottom: TabBar(tabs: [
              Tab(
                child: Icon(Icons.trending_up_rounded),
              ),
              // Tab(
              //   child: Icon(Icons.library_add_check_outlined),
              // ),
              // Tab(
              //   child: Icon(Icons.arrow_circle_up_outlined),
              // )
            ]),
          ),
          body: TabBarView(
            children: [
              MovieYearCustomCard(),
            ],
          ),
        ));
  }
}
