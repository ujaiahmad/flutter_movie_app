import 'package:http/http.dart' as http;

class MoviePopularity {
  late String movie_id;
  //late String movie_title;

  MoviePopularity({required this.movie_id
      //required this.movie_title
      });

  factory MoviePopularity.fromJson(dynamic json) {
    return MoviePopularity(movie_id: json['imdb_id'] as String
        //movie_title: json['title'] as String);
        );
  }

  static List<MoviePopularity> moviePopularityFromSnapShot(List snapshot) {
    return snapshot.map((data) {
      return MoviePopularity.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Movie popularity{Movie id: $movie_id';
  }
}
