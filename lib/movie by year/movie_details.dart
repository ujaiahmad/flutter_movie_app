class MovieDetails {
  late String movieTitle;
  late int year;
  late double rating;
  late String img;
  late String pgRating;
  late int movieLength;
  late String plot;
  late String genre;

  MovieDetails(
      {required this.movieTitle,
      required this.year,
      required this.rating,
      required this.img,
      required this.pgRating,
      required this.movieLength,
      required this.plot,
      required this.genre});

  factory MovieDetails.fromJson(dynamic json) {
    return MovieDetails(
        movieTitle: json['title'],
        year: json['year'],
        rating: json['rating'],
        img: json['image_url'],
        pgRating: json['content_rating'],
        movieLength: json['movie_length'],
        plot: json['plot'],
        genre: json['gen'][0]['genre']);
  }

  static List<MovieDetails> movieDetailsFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return MovieDetails.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Title: $movieTitle, Year: $year, Rating: $rating, Image: $img, Rating: $pgRating';
  }
}
