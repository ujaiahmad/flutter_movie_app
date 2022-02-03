import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_movie_app/movie_bucket_list/send_to_firebase.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:flutter/material.dart';
import 'movie_details.dart';
import 'movie_details_api.dart';
import 'movie_year.dart';
import 'movie_year_api.dart';

class MovieYearCustomCard extends StatefulWidget {

  @override
  _MovieYearCustomCardState createState() => _MovieYearCustomCardState();
}

class _MovieYearCustomCardState extends State<MovieYearCustomCard>
    with AutomaticKeepAliveClientMixin<MovieYearCustomCard> {
  //preserve tab state
  late List<MovieYear> _movieYear;
  late List<MovieDetails> _movieDetails;
  bool _isLoading = true;
  List<bool> boolList = [];
  List movieDetailsList = [];
  List movieIDlsList = [];
 

  @override
  void initState() {
    super.initState();
    getMovieYear();
  }

  @override
  bool get wantKeepAlive => true;

  Future<void> getMovieYear() async {
    _movieYear = await MovieYearApi.geturl(); //with get the id of 2020 movies
    for (var i = 0; i < _movieYear.length; i++) {
      _movieDetails =
          await MovieDetailsApi.getDetails(//get movie details based on id
              _movieYear[i].movie_id); //pass the id of the 2020 movies
      //print(_movieDetails);
      //print(_movieYear[i].movie_id); // movie id
      movieIDlsList.add(_movieYear[i].movie_id);
      movieDetailsList.add(_movieDetails); //add the movie
      boolList.add(false); //the boolList to false
    }

    setState(() {
      _isLoading = false;
    });
  }

  //late final User? user ;
  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const Center(
            child: CircularProgressIndicator(), //display loading animation
          )
        : ListView.builder(
            itemCount: _movieYear.length,
            itemBuilder: (context, index) {
              return Card(
                child: Row(
                  children: [
                    Image(
                      image: NetworkImage(
                          movieDetailsList[index][0].img.toString()),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            movieDetailsList[index][0].movieTitle.toString(),
                            style: const TextStyle(
                                fontSize: 23, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          //Text('ID: ' + movieIDlsList[index]), //checking the id
                          Text('Genre: ' +
                              movieDetailsList[index][0].genre.toString()),
                          Text('Rating: ' +
                              movieDetailsList[index][0].rating.toString()),
                          Text('Content: ' +
                              movieDetailsList[index][0].pgRating.toString()),
                          Text('Length: ' +
                              movieDetailsList[index][0]
                                  .movieLength
                                  .toString()),
                          SizedBox(height: 20),
                          ElevatedButton(
                              child: Text('Add To My List'),
                              onPressed: () {
                                SendToFirebase(
                                        movieIDlsList[index], // movei id
                                        movieDetailsList[index][0]
                                            .movieTitle
                                            .toString(),
                                        movieDetailsList[index][0]
                                            .img
                                            .toString(),
                                        movieDetailsList[index][0]
                                            .genre
                                            .toString(),
                                        movieDetailsList[index][0]
                                            .rating
                                            .toString(),
                                        movieDetailsList[index][0]
                                            .pgRating
                                            .toString(),
                                        movieDetailsList[index][0]
                                            .movieLength
                                            .toString())
                                    .addToFirebase();
                              },
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            });
  }
}
