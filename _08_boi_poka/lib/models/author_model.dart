class AuthorsResponse {
  final List<Author> authors;

  AuthorsResponse({required this.authors});
}

class Author {
  final int id;
  final String name;

  Author({required this.id, required this.name});
}
