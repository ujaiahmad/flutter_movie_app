import 'package:http/http.dart' as http;

class MovieYear {
  late String movie_id;
  //late String movie_title;

  MovieYear({required this.movie_id
      //required this.movie_title
      });

  factory MovieYear.fromJson(dynamic json) {
    return MovieYear(movie_id: json['imdb_id'] as String
        //movie_title: json['title'] as String);
        );
  }

  static List<MovieYear> movieYearFromSnapShot(List snapshot) {
    return snapshot.map((data) {
      return MovieYear.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Movie {Movie id: $movie_id';
  }
}
