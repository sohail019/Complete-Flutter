import 'package:_08_boi_poka/models/get_all_books_model.dart';
import '../constants/app_images.dart';

final List<Map<String, dynamic>> dummyBooks = [
  {
    'data': [
      BookData(
        bookDetails: BookDetails(
          title: "Book 1",
          author: ["Author 1"],
          bookHeight: 120.0,
          bookWidth: 80.0,
          bookThickness: 10.0,
          color: "#116466",
        ),
      ),
      BookData(
        bookDetails: BookDetails(
          title: "Book 2",
          author: ["Author 2"],
          bookHeight: 130.0,
          bookWidth: 85.0,
          bookThickness: 12.0,
          color: "#114545",
        ),
      ),
    ],
    'showImage': false,
  },
  {
    'data': [
      BookData(
        bookDetails: BookDetails(
          title: "Book 3",
          author: ["Author 3"],
          bookHeight: 140.0,
          bookWidth: 90.0,
          bookThickness: 15.0,
          color: "green",
        ),
      ),
      BookData(
        bookDetails: BookDetails(
          title: "Book 4",
          author: ["Author 4"],
          bookHeight: 150.0,
          bookWidth: 95.0,
          bookThickness: 18.0,
          color: "yellow",
        ),
      ),
    ],
    'showImage': true,
    'image': AppImages.wormLogo,
    'position': 1,
    'width': 100.0,
    'height': 150.0,
  },
  // More Dummy Books (up to 20)
  for (int i = 5; i <= 20; i++)
    {
      'data': [
        BookData(
          bookDetails: BookDetails(
            title: "Book $i",
            author: ["Author $i"],
            bookHeight: 120.0 + (i * 2),
            bookWidth: 80.0 + (i * 1.5),
            bookThickness: 10.0 + (i * 0.5),
            color: "random",
          ),
        ),
      ],
      'showImage': false,
    },
];
