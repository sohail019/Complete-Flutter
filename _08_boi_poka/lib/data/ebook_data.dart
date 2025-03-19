import 'package:_08_boi_poka/models/get_all_books_model.dart';
import '../constants/app_images.dart';

final List<Map<String, dynamic>> eBooksShelfData = [
  {
    'data': [
      BookData(
        bookDetails: BookDetails(
          title: "E Book 1",
          author: ["Author 1"],
          bookHeight: 120.0,
          bookWidth: 80.0,
          bookThickness: 10.0,
          color: "#116466",
        ),
      ),
      BookData(
        bookDetails: BookDetails(
          title: "E Book 2",
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
          title: "E Book 3",
          author: ["Author 3"],
          bookHeight: 140.0,
          bookWidth: 90.0,
          bookThickness: 15.0,
          color: "green",
        ),
      ),
      BookData(
        bookDetails: BookDetails(
          title: "E Book 4",
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
            title: "E Book $i",
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

List<Map<String, dynamic>> eBooksGridAndListData = [
  {
    "title": "The 5 AM Club",
    "author": ["Robin Sharma"],
    "description":
        "A motivational book about waking up early to maximize productivity and success.",
    "coverImage":
        "https://upload.wikimedia.org/wikipedia/en/e/ec/The_5_AM_Club.jpg",
  },
  {
    "title": "The Alchemist",
    "author": ["Paulo Coelho"],
    "description":
        "A philosophical novel about following your dreams and the spiritual journey of self-discovery.",
    "coverImage":
        "https://upload.wikimedia.org/wikipedia/commons/6/66/TheAlchemist_PauloCoelho.jpg",
  },
  {
    "title": "Atomic Habits",
    "author": ["James Clear"],
    "description":
        "A practical guide to building good habits and breaking bad ones.",
    "coverImage":
        "https://upload.wikimedia.org/wikipedia/en/d/d2/Atomic_Habits.jpg",
  },
  {
    "title": "Educated",
    "author": ["Tara Westover"],
    "description":
        "A memoir about a woman who grows up in a strict and isolated family but escapes to learn about the world.",
    "coverImage":
        "https://upload.wikimedia.org/wikipedia/en/a/a7/Educated_The_Learning_to_Be_Love_Memoir.jpg",
  },
  {
    "title": "Sapiens: A Brief History of Humankind",
    "author": ["Yuval Noah Harari"],
    "description":
        "A compelling history of humanity, from the Stone Age to modern times.",
    "coverImage":
        "https://upload.wikimedia.org/wikipedia/en/8/8b/Sapiens_A_Brief_History_of_Humankind.jpg",
  },
  {
    "title": "The Power of Now",
    "author": ["Eckhart Tolle"],
    "description":
        "A spiritual guide that teaches the importance of living in the present moment.",
    "coverImage":
        "https://upload.wikimedia.org/wikipedia/en/7/74/The_Power_of_Now.jpg",
  },
  {
    "title": "Where the Crawdads Sing",
    "author": ["Delia Owens"],
    "description":
        "A mystery and coming-of-age novel set in the wild marshes of North Carolina.",
    "coverImage":
        "https://upload.wikimedia.org/wikipedia/en/c/c4/Where_the_Crawdads_Sing.jpg",
  },
  {
    "title": "Circe",
    "author": ["Madeline Miller"],
    "description":
        "A modern retelling of the myth of Circe, the witch from Homer's 'Odyssey'.",
    "coverImage": "https://upload.wikimedia.org/wikipedia/en/3/3f/Circe.jpg",
  },
  {
    "title": "The Subtle Art of Not Giving a F*ck",
    "author": ["Mark Manson"],
    "description":
        "A no-nonsense self-help book that challenges the traditional approach to success and happiness.",
    "coverImage":
        "https://upload.wikimedia.org/wikipedia/en/4/43/The_Subtle_Art_of_Not_Giving_a_Fuck.jpg",
  },
  {
    "title": "The Silent Patient",
    "author": ["Alex Michaelides"],
    "description":
        "A psychological thriller about a woman who shoots her husband and stops speaking.",
    "coverImage":
        "https://upload.wikimedia.org/wikipedia/en/9/90/The_Silent_Patient.jpg",
  },
  {
    "title": "Becoming",
    "author": ["Michelle Obama"],
    "description":
        "The memoir of former First Lady Michelle Obama, covering her life from childhood to the White House.",
    "coverImage":
        "https://upload.wikimedia.org/wikipedia/en/e/e3/Becoming_by_Michelle_Obama.jpg",
  },
  {
    "title": "The 4-Hour Workweek",
    "author": ["Tim Ferriss"],
    "description":
        "A guide on how to outsource tasks and build a lifestyle business that gives you more freedom.",
    "coverImage":
        "https://upload.wikimedia.org/wikipedia/en/d/d4/The_4-Hour_Workweek_cover.jpg",
  },
  {
    "title": "The Outsiders",
    "author": ["S.E. Hinton"],
    "description":
        "A novel about youth rebellion and the class divide in America.",
    "coverImage":
        "https://upload.wikimedia.org/wikipedia/en/2/2e/The_Outsiders.jpg",
  },
  {
    "title": "The Book Thief",
    "author": ["Markus Zusak"],
    "description":
        "A story about a young girl who steals books and shares them with others during World War II.",
    "coverImage":
        "https://upload.wikimedia.org/wikipedia/en/8/86/The_Book_Thief_cover.jpg",
  },
  {
    "title": "Atomic Habits",
    "author": ["James Clear"],
    "description":
        "A practical guide to building good habits and breaking bad ones.",
    "coverImage":
        "https://upload.wikimedia.org/wikipedia/en/d/d2/Atomic_Habits.jpg",
  },
  {
    "title": "The Hunger Games",
    "author": ["Suzanne Collins"],
    "description":
        "A dystopian story about survival and sacrifice in a totalitarian regime.",
    "coverImage":
        "https://upload.wikimedia.org/wikipedia/en/4/42/HungerGamesPoster.jpg",
  },
  {
    "title": "The Da Vinci Code",
    "author": ["Dan Brown"],
    "description":
        "A thriller involving secret societies and religious conspiracies.",
    "coverImage":
        "https://upload.wikimedia.org/wikipedia/en/d/d3/DaVinciCode.jpg",
  },
];
