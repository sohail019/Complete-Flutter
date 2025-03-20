import '../models/analytics_model.dart';

final dummyAnalyticsData = AnalyticsModel(
  message: "Success",
  data: AnalyticsData(
    userBooksCount: 100,
    booksBySource: [
      BookSource(bookCount: 50, sourceType: ["Online", "Library"]),
      BookSource(bookCount: 30, sourceType: ["Purchased"]),
    ],
    physicalBookCount: 40,
    eBookCount: 50,
    audioBookCount: 10,
    numberOfGenres: 5,
    booksByGenreCategory: [
      GenreCategory(bookCount: 20, genreCategory: "Fiction"),
      GenreCategory(bookCount: 15, genreCategory: "Non-Fiction"),
    ],
    fictionPercentage: 40,
    nonFictionPercentage: 30,
    academicPercentage: 20,
    leisurePercentage: 10,
    indianAuthorsPercentage: 50,
    foreignAuthorsPercentage: 50,
    distributionCount: [
      DistributionCount(
        count: 20,
        sourceType: ["Library"],
        genreCategory: "Fiction",
      ),
      DistributionCount(
        count: 15,
        sourceType: ["Purchased"],
        genreCategory: "Non-Fiction",
      ),
    ],
    booksByLanguage: [
      BooksByLanguage(count: 30, language: ["English"]),
      BooksByLanguage(count: 20, language: ["Hindi"]),
    ],
    booksByIsIndian: [
      BooksByIsIndian(count: 50, isIndian: true),
      BooksByIsIndian(count: 50, isIndian: false),
    ],
    booksByAuthorOrigin: [
      AuthorList(count: 45, authorOrigin: "North America"),
      AuthorList(count: 30, authorOrigin: "Europe"),
      AuthorList(count: 5, authorOrigin: "India"),
      AuthorList(count: 5, authorOrigin: "Africa"),
      AuthorList(count: 5, authorOrigin: "South America"),
      AuthorList(count: 10, authorOrigin: "South rest of Asia"),
    ],
    genrePercentages: [
      GenrePercentage(
        category: "Fiction",
        genrePercentage: [
          GenreDetail(genre: "Thriller", percentage: 50.0),
          GenreDetail(genre: "Drama", percentage: 50.0),
        ],
      ),
    ],
  ),
);
