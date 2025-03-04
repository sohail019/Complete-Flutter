import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/product.dart';

class ProductInput extends StatefulWidget {
  const ProductInput({super.key, required this.onSelectProduct});

  final void Function(Product product) onSelectProduct;

  @override
  State<ProductInput> createState() => _ProductInputState();
}

class _ProductInputState extends State<ProductInput> {
  Product? _selectedProduct;
  bool isLoading = false;

  Future<void> _fetchRandomProduct() async {
    setState(() {
      isLoading = true;
    });

    final url = Uri.parse('https://dummyjson.com/products');
    final response = await http.get(url);
    final resData = json.decode(response.body);

    if (resData['products'] != null && resData['products'].isNotEmpty) {
      final randomProduct =
          resData['products'][DateTime.now().second %
              resData['products'].length];

      final fetchedProduct = Product(
        name: randomProduct['title'],
        image: randomProduct['thumbnail'], // This is a network image
        price: (randomProduct['price'] as num).toDouble(),
        description: randomProduct['description'],
      );

      setState(() {
        _selectedProduct = fetchedProduct;
        isLoading = false;
      });

      widget.onSelectProduct(fetchedProduct);
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 250,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Theme.of(context).colorScheme.primary.withAlpha(100),
            ),
          ),
          child:
              isLoading
                  ? const CircularProgressIndicator()
                  : _selectedProduct != null
                  ? Image.network(
                    _selectedProduct!.image,
                    fit: BoxFit.cover,
                    width: 200,
                    height: 250,
                  )
                  : Text(
                    'No Product Selected',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
        ),
        const SizedBox(height: 10),
        TextButton.icon(
          onPressed: _fetchRandomProduct,
          icon: const Icon(Icons.shopping_cart),
          label: const Text('Get Random Product'),
        ),
      ],
    );
  }
}
