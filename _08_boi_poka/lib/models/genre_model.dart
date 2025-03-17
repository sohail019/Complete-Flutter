class GenresResponse {
  final List<Genre> genres;

  GenresResponse({required this.genres});
}

class Genre {
  final int id;
  final String name;

  Genre({required this.id, required this.name});
}
