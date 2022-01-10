import 'dart:convert';
import 'package:http/http.dart' as http;
import 'movie_year.dart';

class MovieYearApi {
  static Future<List<MovieYear>> geturl() async {
    //var notes = List<MovieYear>;
    //Map<String, dynamic> notes;
    final uri = Uri.https('data-imdb1.p.rapidapi.com', '/movie/byYear/2020/',
        {"page_size": "10"});

    final response = await http.get(uri, headers: {
      "x-rapidapi-host": "data-imdb1.p.rapidapi.com",
      "x-rapidapi-key": "0fc1623558mshfaf5b6486a1f2e2p1cb956jsn0d488a69c82f",
      "useQueryString": "true"
    });

    Map data = jsonDecode(response.body);
    List temp = [];

    for (var i in data['results']) {
      temp.add(i);
    }
    return MovieYear.movieYearFromSnapShot(temp);
  }
}
