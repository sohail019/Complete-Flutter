class GetBookAnalyticsModel {
  String message;
  BookDetailsData data;

  GetBookAnalyticsModel({required this.message, required this.data});

  factory GetBookAnalyticsModel.fromJson(Map<String, dynamic> json) {
    return GetBookAnalyticsModel(
      message: json['message'] ?? '',
      data: BookDetailsData.fromJson(json['data'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {'message': message, 'data': data.toJson()};
  }

  @override
  String toString() {
    return 'ApiResponse(message: $message, data: $data)';
  }
}

class BookDetailsData {
  String book;
  String authors;
  Map<String, int> popularityCountry;
  Map<String, int> bookReadMood;
  List<String> genres;
  List<String> themes;
  Sentiment sentiment;
  List<ExpertReview> expertReviews;
  List<FanFiction> fanFiction;

  BookDetailsData({
    required this.book,
    required this.authors,
    required this.popularityCountry,
    required this.bookReadMood,
    required this.genres,
    required this.themes,
    required this.sentiment,
    required this.expertReviews,
    required this.fanFiction,
  });

  factory BookDetailsData.fromJson(Map<String, dynamic> json) {
    return BookDetailsData(
      book: json['book'] ?? 'Unknown Book',
      authors:
          (json['authors'] is List)
              ? (json['authors'] as List).join(', ')
              : (json['authors'] ?? 'Unknown Author'),
      popularityCountry: Map<String, int>.from(
        json['popularity_country']?.map(
              (k, v) => MapEntry(k, (v is double) ? v.toInt() : v),
            ) ??
            {},
      ),
      bookReadMood: Map<String, int>.from(
        json['book_read_mood']?.map(
              (k, v) => MapEntry(k, (v is double) ? v.toInt() : v),
            ) ??
            {},
      ),
      genres: List<String>.from(json['genres'] ?? []),
      themes: List<String>.from(json['themes'] ?? []),
      sentiment: Sentiment.fromJson(json['sentiment'] ?? {}),
      expertReviews:
          (json['expert_reviews'] as List? ?? [])
              .map((e) => ExpertReview.fromJson(e))
              .toList(),
      fanFiction:
          (json['fan_fiction'] as List? ?? [])
              .map((e) => FanFiction.fromJson(e))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'book': book,
      'authors': authors,
      'popularity_country': popularityCountry,
      'book_read_mood': bookReadMood,
      'genres': genres,
      'themes': themes,
      'sentiment': sentiment.toJson(),
      'expert_reviews': expertReviews.map((e) => e.toJson()).toList(),
      'fan_fiction': fanFiction.map((e) => e.toJson()).toList(),
    };
  }

  @override
  String toString() {
    return 'BookData(book: $book, authors: $authors, popularityCountry: $popularityCountry, bookReadMood: $bookReadMood, genres: $genres, themes: $themes, sentiment: $sentiment, expertReviews: $expertReviews, fanFiction: $fanFiction)';
  }
}

class Sentiment {
  int positive;
  int neutral;
  int negative;

  Sentiment({
    required this.positive,
    required this.neutral,
    required this.negative,
  });

  factory Sentiment.fromJson(Map<String, dynamic> json) {
    return Sentiment(
      positive:
          (json['positive'] is double)
              ? json['positive'].toInt()
              : (json['positive'] ?? 0),
      neutral:
          (json['neutral'] is double)
              ? json['neutral'].toInt()
              : (json['neutral'] ?? 0),
      negative:
          (json['negative'] is double)
              ? json['negative'].toInt()
              : (json['negative'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    return {'positive': positive, 'neutral': neutral, 'negative': negative};
  }

  @override
  String toString() {
    return 'Sentiment(positive: $positive, neutral: $neutral, negative: $negative)';
  }
}

class ExpertReview {
  String name;
  String text;
  double rating;

  ExpertReview({required this.name, required this.text, required this.rating});

  factory ExpertReview.fromJson(Map<String, dynamic> json) {
    return ExpertReview(
      name: json['name'] ?? 'Anonymous',
      text: json['text'] ?? 'No review',
      rating: (json['rating'] ?? 0.0).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'text': text, 'rating': rating};
  }

  @override
  String toString() {
    return 'ExpertReview(name: $name, text: $text, rating: $rating)';
  }
}

class FanFiction {
  String author;
  String shortDescription;
  int likes;
  String publishedAt;
  String rated;

  FanFiction({
    required this.author,
    required this.shortDescription,
    required this.likes,
    required this.publishedAt,
    required this.rated,
  });

  factory FanFiction.fromJson(Map<String, dynamic> json) {
    return FanFiction(
      author: json['author'] ?? 'Unknown Author',
      shortDescription: json['short_description'] ?? 'No description available',
      likes:
          (json['likes'] is double)
              ? json['likes'].toInt()
              : (json['likes'] ?? 0),
      publishedAt: json['publishedAt'] ?? 'Unknown date',
      rated: json['Rated'] ?? 'Not rated',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'author': author,
      'short_description': shortDescription,
      'likes': likes,
      'published_at': publishedAt,
      'rated': rated,
    };
  }

  @override
  String toString() {
    return 'FanFiction(author: $author, shortDescription: $shortDescription, likes: $likes, publishedAt: $publishedAt, rated: $rated)';
  }
}
