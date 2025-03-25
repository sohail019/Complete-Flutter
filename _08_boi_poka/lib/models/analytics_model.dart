class AnalyticsModel {
  final String? message;
  final AnalyticsData? data;

  AnalyticsModel({this.message, this.data});

  factory AnalyticsModel.fromJson(Map<String, dynamic> json) {
    return AnalyticsModel(
      message: json['message'],
      data: AnalyticsData.fromJson(json['data']),
    );
  }
}

class AnalyticsData {
  final int? userBooksCount;
  final List<BookSource>? booksBySource;
  final int? physicalBookCount;
  final int? eBookCount;
  final int? audioBookCount;
  final int? numberOfGenres;
  final List<GenreCategory>? booksByGenreCategory;
  final int? fictionPercentage;
  final int? nonFictionPercentage;
  final int? academicPercentage;
  final int? leisurePercentage;
  final int? indianAuthorsPercentage;
  final int? foreignAuthorsPercentage;
  final List<DistributionCount>? distributionCount;
  final List<BooksByLanguage>? booksByLanguage;
  final List<BooksByIsIndian>? booksByIsIndian;
  final List<AuthorList>? booksByAuthorOrigin;
  final List<GenrePercentage>? genrePercentages;

  AnalyticsData({
    this.userBooksCount,
    this.booksBySource,
    this.physicalBookCount,
    this.eBookCount,
    this.audioBookCount,
    this.numberOfGenres,
    this.booksByGenreCategory,
    this.fictionPercentage,
    this.nonFictionPercentage,
    this.academicPercentage,
    this.leisurePercentage,
    this.indianAuthorsPercentage,
    this.foreignAuthorsPercentage,
    this.distributionCount,
    this.booksByLanguage,
    this.booksByIsIndian,
    this.booksByAuthorOrigin,
    this.genrePercentages,
  });

  factory AnalyticsData.fromJson(Map<String, dynamic> json) {
    return AnalyticsData(
      userBooksCount: json['userBooksCount'],
      booksBySource:
          (json['booksBySource'] as List?)
              ?.map((e) => BookSource.fromJson(e))
              .toList(),
      physicalBookCount: json['physicalBookCount'],
      eBookCount: json['eBookCount'],
      audioBookCount: json['audioBookCount'],
      numberOfGenres: json['numberOfGenres'],
      booksByGenreCategory:
          (json['booksByGenreCategory'] as List?)
              ?.map((e) => GenreCategory.fromJson(e))
              .toList(),
      booksByAuthorOrigin:
          (json['booksByAuthorOrigin'] as List?)
              ?.map((e) => AuthorList.fromJson(e))
              .toList(),
      fictionPercentage: json['fictionPercentage'],
      nonFictionPercentage: json['nonFictionPercentage'],
      academicPercentage: json['academicPercentage'],
      leisurePercentage: json['leisurePercentage'],
      indianAuthorsPercentage: json['indianAuthorsPercentage'],
      foreignAuthorsPercentage: json['foreignAuthorsPercentage'],
      distributionCount:
          (json['distributionCount'] as List?)
              ?.map((e) => DistributionCount.fromJson(e))
              .toList(),
      booksByLanguage:
          (json['booksByLanguage'] as List?)
              ?.map((e) => BooksByLanguage.fromJson(e))
              .toList(),
      booksByIsIndian:
          (json['booksByIsIndian'] as List?)
              ?.map((e) => BooksByIsIndian.fromJson(e))
              .toList(),
      genrePercentages:
          (json['genrePercentages'] as List?)
              ?.map((e) => GenrePercentage.fromJson(e))
              .toList(),
    );
  }
}

class BookSource {
  final int? bookCount;
  final List<String>? sourceType;

  BookSource({this.bookCount, this.sourceType});

  factory BookSource.fromJson(Map<String, dynamic> json) {
    return BookSource(
      bookCount: json['bookCount'],
      sourceType:
          (json['sourceType'] as List?)?.map((e) => e.toString()).toList(),
    );
  }
}

class GenreCategory {
  final int? bookCount;
  final String? genreCategory;

  GenreCategory({this.bookCount, this.genreCategory});

  factory GenreCategory.fromJson(Map<String, dynamic> json) {
    return GenreCategory(
      bookCount: json['bookCount'],
      genreCategory: json['genreCategory'],
    );
  }
}

class AuthorList {
  final int? count;
  final String? authorOrigin;

  AuthorList({this.count, this.authorOrigin});

  factory AuthorList.fromJson(Map<String, dynamic> json) {
    return AuthorList(count: json['count'], authorOrigin: json['authorOrigin']);
  }
}

class DistributionCount {
  final int? count;
  final List<String>? sourceType;
  final String? genreCategory;

  DistributionCount({this.count, this.sourceType, this.genreCategory});

  factory DistributionCount.fromJson(Map<String, dynamic> json) {
    return DistributionCount(
      count: json['count'],
      sourceType:
          (json['sourceType'] as List?)?.map((e) => e.toString()).toList(),
      genreCategory: json['genreCategory'],
    );
  }
}

class BooksByLanguage {
  final int? count;
  final List<dynamic>? language;

  BooksByLanguage({this.count, this.language});

  factory BooksByLanguage.fromJson(Map<String, dynamic> json) {
    return BooksByLanguage(count: json['count'], language: json['language']);
  }
}

class BooksByIsIndian {
  final int? count;
  final bool? isIndian;

  BooksByIsIndian({this.count, this.isIndian});

  factory BooksByIsIndian.fromJson(Map<String, dynamic> json) {
    return BooksByIsIndian(count: json['count'], isIndian: json['isIndian']);
  }
}

class GenrePercentage {
  final String? category;
  final List<GenreDetail>? genrePercentage;

  GenrePercentage({this.category, this.genrePercentage});

  factory GenrePercentage.fromJson(Map<String, dynamic> json) {
    return GenrePercentage(
      category: json['category'],
      genrePercentage:
          (json['genrePercentage'] as List?)
              ?.map((e) => GenreDetail.fromJson(e))
              .toList(),
    );
  }
}

class GenreDetail {
  final String? genre;
  final double? percentage;

  GenreDetail({this.genre, this.percentage});

  factory GenreDetail.fromJson(Map<String, dynamic> json) {
    return GenreDetail(
      genre: json['genre'],
      percentage: (json['percentage'] as num?)?.toDouble(),
    );
  }
}
