import 'package:flutter/material.dart';
import 'package:flutter_movie_app/movie%20by%20year/movie_details.dart';
import 'package:flutter_movie_app/movie%20by%20year/movie_details_api.dart';
import 'movie_popularity.dart';
import 'movie_popularity_api.dart';

class MoviePopularityCustomCard extends StatefulWidget {
  //get all passed variables
  MoviePopularityCustomCard(
      this.movieBucket, this.addMovieIntobucket, this.removeMovieFromBucket);
  List movieBucket;
  Function addMovieIntobucket;
  Function removeMovieFromBucket;

  @override
  _MoviePopularityCustomCardState createState() =>
      _MoviePopularityCustomCardState();
}

class _MoviePopularityCustomCardState extends State<MoviePopularityCustomCard>
    with AutomaticKeepAliveClientMixin<MoviePopularityCustomCard> {
  //preserve state of tab

  //initialisation
  late List<MoviePopularity> _moviePopularity;
  late List<MovieDetails> _movieDetails;
  bool _isLoading = true;
  List<bool> boolList = [];
  List movieDetailsList = [];

  @override
  void initState() {
    super.initState();
    getMoviePopularity();
  }

  @override
  bool get wantKeepAlive => true;

  Future<void> getMoviePopularity() async {
    _moviePopularity = await MoviePopularityApi.geturl(); //get popular movie id
    for (var i = 0; i < _moviePopularity.length; i++) {
      _movieDetails = await MovieDetailsApi.getDetails(
          _moviePopularity[i].movie_id); //get details based on id

      movieDetailsList.add(_movieDetails); // add into list
      boolList.add(false); //add boolList
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const Center(
            child: CircularProgressIndicator(), //display laoding animation
          )
        : ListView.builder(
            itemCount: _moviePopularity.length,
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
                                        boolList[index]); //add to bucket list
                                  } else {
                                    boolList[index] = false;
                                    widget.removeMovieFromBucket(movieDetailsList[
                                            index][0]
                                        .movieTitle
                                        .toString()); //remove from bucket list
                                  }
                                });
                              },
                              icon: Icon(boolList[index] //display fav icon
                                  ? Icons.favorite
                                  : Icons.favorite_border_outlined)),
                          // //Text(movieDetailsList[index][0].img.toString()),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            });
  }
}
