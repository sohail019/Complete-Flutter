import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Product {
  Product({
    required this.name,
    required this.image,
    required this.price,
    required this.description,
    id,
  }) : id = id ?? uuid.v4();

  final String id;
  final String name;
  final String image;
  final double price;
  final String description;
}
