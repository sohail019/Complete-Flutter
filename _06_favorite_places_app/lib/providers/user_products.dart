import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:_06_favorite_places_app/models/product.dart';

import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';

Future<Database> _getDatabase() async {
  final dbPath = await sql.getDatabasesPath();
  final db = await sql.openDatabase(
    path.join(dbPath, 'products.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE user_places(id TEXT PRIMARY KEY, title TEXT, image TEXT, price REAL, description TEXT)',
      );
    },
    version: 1,
  );
  return db;
}

class UserProductsNotifier extends StateNotifier<List<Product>> {
  UserProductsNotifier() : super(const []);

  Future<void> loadProducts() async {
    final db = await _getDatabase();
    final data = await db.query('user_products');
    final products =
        data
            .map(
              (row) => Product(
                id: row['id'],
                name: row['title'] as String,
                image: row['image'] as String,
                price: row['price'] as double,
                description: row['description'] as String,
              ),
            )
            .toList();

    state = products;
  }

  void addProduct(
    String title,
    File image,
    double price,
    String description,
  ) async {
    final newProduct = Product(
      name: title,
      image: image.path,
      price: price,
      description: description,
    );

    final db = await _getDatabase();
    db.insert('user_products', {
      'id': newProduct.id,
      'title': newProduct.name,
      'image': newProduct.image,
      'price': newProduct.price,
      'description': newProduct.description,
    });
    state = [newProduct, ...state];
  }
}

final userProductsProvider =
    StateNotifierProvider<UserProductsNotifier, List<Product>>(
      (ref) => UserProductsNotifier(),
    );
