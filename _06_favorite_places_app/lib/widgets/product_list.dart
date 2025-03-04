import 'dart:io';
import 'package:_06_favorite_places_app/screens/product_detail.dart';
import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key, required this.products});

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) {
      return Center(
        child: Text(
          'No products added yet, start adding some!',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      );
    }

    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];

        return ListTile(
          leading: CircleAvatar(
            radius: 26,
            backgroundColor: Colors.grey[300], // Placeholder background
            backgroundImage:
                product.image.isNotEmpty
                    ? (product.image.startsWith('http')
                        ? NetworkImage(product.image) as ImageProvider
                        : FileImage(File(product.image)))
                    : null, // No image if empty
            child:
                product.image.isEmpty
                    ? const Icon(Icons.shopping_cart, color: Colors.grey)
                    : null,
          ),
          title: Text(
            product.name,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          subtitle: Text(
            '\$${product.price.toStringAsFixed(2)}',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          onTap: () {
            // Navigate to product detail page
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => ProductDetailScreen(product: product),
              ),
            );
          },
        );
      },
    );
  }
}
