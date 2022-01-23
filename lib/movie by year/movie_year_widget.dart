import 'package:flutter/material.dart';
import 'movie_details.dart';
import 'movie_details_api.dart';
import 'movie_year.dart';
import 'movie_year_api.dart';

class MovieYearCustomCard extends StatefulWidget {
  MovieYearCustomCard(
      this.movieBucket, this.addMovieIntobucket, this.removeMovieFromBucket);
  //List movieBucket;
  List movieBucket;
  Function addMovieIntobucket;
  Function removeMovieFromBucket;

  @override
  _MovieYearCustomCardState createState() => _MovieYearCustomCardState();
}

class _MovieYearCustomCardState extends State<MovieYearCustomCard>
    with AutomaticKeepAliveClientMixin<MovieYearCustomCard> {
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
    _movieYear = await MovieYearApi.geturl();
    for (var i = 0; i < _movieYear.length; i++) {
      _movieDetails = await MovieDetailsApi.getDetails(_movieYear[i].movie_id);
      //  _movieDetails
      //     .add(await MovieDetailsApi.getDetails(_movieYear[i].movie_id));
      movieDetailsList.add(_movieDetails);
      boolList.add(false);
    }
    // print(_movieYear);
    // print(movieDetailsList);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const Center(
            child: CircularProgressIndicator(),
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
                          //Text(_movieYear[index].movie_id),
                          //Text(_movieYear[index].movie_title),
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
                          // Container(
                          //   alignment: Alignment.center,
                          //   child: Text(
                          //     customText,
                          //     //overflow: TextOverflow.ellipsis,
                          //     style: TextStyle(fontFamily: 'Arial'),
                          //   ),
                          //   padding: EdgeInsets.all(10),
                          // ),
                          IconButton(
                              onPressed: () {
                                //changeisPressed(_isPressed);
                                setState(() {
                                  if (boolList[index] == false) {
                                    boolList[index] = true;
                                    widget.addMovieIntobucket(
                                        movieDetailsList[index][0]
                                            .movieTitle
                                            .toString(),
                                        boolList[index]);
                                  } else {
                                    boolList[index] = false;
                                    widget.removeMovieFromBucket(
                                        movieDetailsList[index][0]
                                            .movieTitle
                                            .toString());
                                  }
                                });
                              },
                              icon: Icon(boolList[index]
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
