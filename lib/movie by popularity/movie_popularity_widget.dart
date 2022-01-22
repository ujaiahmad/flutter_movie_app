import 'package:flutter/material.dart';
import 'package:flutter_movie_app/movie%20by%20year/movie_details.dart';
import 'package:flutter_movie_app/movie%20by%20year/movie_details_api.dart';
import 'movie_popularity.dart';
import 'movie_popularity_api.dart';

class MoviePopularityCustomCard extends StatefulWidget {
  MoviePopularityCustomCard({Key? key}) : super(key: key);

  @override
  _MoviePopularityCustomCardState createState() =>
      _MoviePopularityCustomCardState();
}

class _MoviePopularityCustomCardState extends State<MoviePopularityCustomCard>
    with AutomaticKeepAliveClientMixin<MoviePopularityCustomCard> {
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
    _moviePopularity = await MoviePopularityApi.geturl();
    for (var i = 0; i < _moviePopularity.length; i++) {
      _movieDetails =
          await MovieDetailsApi.getDetails(_moviePopularity[i].movie_id);
      //  _movieDetails
      //     .add(await MovieDetailsApi.getDetails(_movieYear[i].movie_id));
      movieDetailsList.add(_movieDetails);
      boolList.add(false);
    }
    // print(_moviePopularity);
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
                          //Text(_movieYear[index].movie_id),
                          //Text(_moviePopularity[index].movie_id),
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
                                  } else {
                                    boolList[index] = false;
                                  }
                                });
                              },
                              icon: Icon(boolList[index]
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
