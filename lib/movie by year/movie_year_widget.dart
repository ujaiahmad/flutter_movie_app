import 'package:flutter/material.dart';
import 'movie_details.dart';
import 'movie_details_api.dart';
import 'movie_year.dart';
import 'movie_year_api.dart';

class MovieYearCustomCard extends StatefulWidget {
  MovieYearCustomCard(
      this.movieBucket, this.addMovieIntobucket, this.removeMovieFromBucket);

  List movieBucket;
  Function addMovieIntobucket;
  Function removeMovieFromBucket;

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

      movieDetailsList.add(_movieDetails); //add the movie
      boolList.add(false); //the boolList to false
    }

    setState(() {
      _isLoading = false;
    });
  }

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
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  if (boolList[index] == false) {
                                    boolList[index] = true;
                                    widget.addMovieIntobucket(
                                        movieDetailsList[index][0]
                                            .movieTitle
                                            .toString(),
                                        boolList[
                                            index]); //add liked movie into bucket list
                                  } else {
                                    boolList[index] = false;
                                    widget.removeMovieFromBucket(movieDetailsList[
                                            index][0]
                                        .movieTitle
                                        .toString()); //removed like movie from bucket
                                  }
                                });
                              },
                              icon: Icon(boolList[index] //display fav button
                                  ? Icons.favorite
                                  : Icons.favorite_border_outlined)),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            });
  }
}
