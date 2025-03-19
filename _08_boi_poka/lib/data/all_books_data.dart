import 'package:_08_boi_poka/models/get_all_books_model.dart';
import '../constants/app_images.dart';

final List<Map<String, dynamic>> allBooksShelfData = [
  {
    'data': [
      BookData(
        bookDetails: BookDetails(
          title: "All Book 1",
          author: ["Author 1"],
          bookHeight: 120.0,
          bookWidth: 80.0,
          bookThickness: 10.0,
          color: "#116466",
        ),
      ),
      BookData(
        bookDetails: BookDetails(
          title: "All Book 2",
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
          title: "All Book 3",
          author: ["Author 3"],
          bookHeight: 140.0,
          bookWidth: 90.0,
          bookThickness: 15.0,
          color: "green",
        ),
      ),
      BookData(
        bookDetails: BookDetails(
          title: "All Book 4",
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
            title: "All Book $i",
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

List<Map<String, dynamic>> allBooksGridAndListData = [
  {
    "title": "The Great Gatsby",
    "author": ["F. Scott Fitzgerald"],
    "description": "A novel about the American dream and tragedy.",
    "coverImage":
        "https://upload.wikimedia.org/wikipedia/en/f/f7/TheGreatGatsby_1925jacket.jpeg",
  },
  {
    "title": "1984",
    "author": ["George Orwell"],
    "description": "Dystopian novel about totalitarianism and surveillance.",
    "coverImage":
        "https://upload.wikimedia.org/wikipedia/en/c/c3/1984first.jpg",
  },
  {
    "title": "To Kill a Mockingbird",
    "author": ["Harper Lee"],
    "description": "A story of racial injustice and moral growth.",
    "coverImage":
        "https://upload.wikimedia.org/wikipedia/en/7/79/To_Kill_a_Mockingbird.JPG",
  },
  {
    "title": "The Catcher in the Rye",
    "author": ["J.D. Salinger"],
    "description": "A novel about teenage rebellion and identity.",
    "coverImage":
        "https://upload.wikimedia.org/wikipedia/en/3/32/Rye_catcher.jpg",
  },
  {
    "title": "Moby-Dick",
    "author": ["Herman Melville"],
    "description": "The epic tale of Captain Ahab's hunt for the white whale.",
    "coverImage":
        "https://upload.wikimedia.org/wikipedia/commons/5/55/Moby-Dick_FE_title_page.jpg",
  },
  {
    "title": "Pride and Prejudice",
    "author": ["Jane Austen"],
    "description": "A classic romance novel about love and society.",
    "coverImage":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/1/1e/PrideAndPrejudiceTitlePage.jpg/800px-PrideAndPrejudiceTitlePage.jpg",
  },
  {
    "title": "Brave New World",
    "author": ["Aldous Huxley"],
    "description": "A dystopian novel exploring a futuristic society.",
    "coverImage":
        "https://upload.wikimedia.org/wikipedia/en/6/62/BraveNewWorld_FirstEdition.jpg",
  },
  {
    "title": "The Hobbit",
    "author": ["J.R.R. Tolkien"],
    "description": "A fantasy adventure with Bilbo Baggins.",
    "coverImage":
        "https://upload.wikimedia.org/wikipedia/en/3/30/Hobbit_cover.JPG",
  },
  {
    "title": "War and Peace",
    "author": ["Leo Tolstoy"],
    "description": "A historical novel about Russia during the Napoleonic era.",
    "coverImage":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/9/9f/War-and-peace-book-cover.jpg/800px-War-and-peace-book-cover.jpg",
  },
  {
    "title": "Crime and Punishment",
    "author": ["Fyodor Dostoevsky"],
    "description": "A psychological novel about guilt and redemption.",
    "coverImage":
        "https://upload.wikimedia.org/wikipedia/en/4/4b/Crimeandpunishmentcover.png",
  },
  {
    "title": "The Odyssey",
    "author": ["Homer"],
    "description": "An epic Greek poem about Odysseus' journey home.",
    "coverImage":
        "https://upload.wikimedia.org/wikipedia/commons/4/40/Odyssey-codex-vaticanus.jpg",
  },
  {
    "title": "Frankenstein",
    "author": ["Mary Shelley"],
    "description": "A gothic horror story about creation and responsibility.",
    "coverImage":
        "https://upload.wikimedia.org/wikipedia/commons/9/9b/Frankenstein_1818_edition_title_page.jpg",
  },
  {
    "title": "The Catcher in the Rye",
    "author": ["J.D. Salinger"],
    "description":
        "A story about teenage angst and rebellion in a post-war world.",
    "coverImage":
        "https://upload.wikimedia.org/wikipedia/en/3/32/Rye_catcher.jpg",
  },
  {
    "title": "The Lord of the Rings",
    "author": ["J.R.R. Tolkien"],
    "description":
        "A high fantasy epic involving a quest to destroy a powerful ring.",
    "coverImage":
        "https://upload.wikimedia.org/wikipedia/en/a/a1/LordoftheRings trilogy.jpg",
  },
  {
    "title": "Harry Potter and the Sorcerer's Stone",
    "author": ["J.K. Rowling"],
    "description":
        "A young wizard begins his journey at Hogwarts School of Witchcraft and Wizardry.",
    "coverImage":
        "https://upload.wikimedia.org/wikipedia/en/5/51/Harry_Potter_and_the_Philosopher%27s_Stone_Book_Cover.jpg",
  },
  {
    "title": "The Da Vinci Code",
    "author": ["Dan Brown"],
    "description":
        "A thriller involving secret societies and religious conspiracies.",
    "coverImage":
        "https://upload.wikimedia.org/wikipedia/en/d/d3/DaVinciCode.jpg",
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
    "title": "The Girl on the Train",
    "author": ["Paula Hawkins"],
    "description":
        "A psychological thriller about obsession, memory, and perception.",
    "coverImage":
        "https://upload.wikimedia.org/wikipedia/en/4/4f/The_Girl_on_the_Train.jpg",
  },
  {
    "title": "The Shining",
    "author": ["Stephen King"],
    "description":
        "A horror novel about isolation and madness in a haunted hotel.",
    "coverImage":
        "https://upload.wikimedia.org/wikipedia/en/6/61/Shining_1980.jpg",
  },
];
