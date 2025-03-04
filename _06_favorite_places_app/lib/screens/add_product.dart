import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:io';
import '../widgets/image_input.dart';
import '../widgets/product_input.dart';
import '../providers/user_products.dart';
import '../models/product.dart';

class AddProductScreen extends ConsumerStatefulWidget {
  const AddProductScreen({super.key});

  @override
  ConsumerState<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends ConsumerState<AddProductScreen> {
  final _titleController = TextEditingController();
  File? _selectedImage;
  Product?
  _selectedProduct; // Holds the selected product (either random or with image)

  void _saveProduct() {
    if (_selectedImage == null && _selectedProduct == null) {
      return; // Ensure at least one selection is made
    }

    final enteredText =
        _titleController.text.isEmpty
            ? _selectedProduct?.name ?? 'Unnamed Product'
            : _titleController.text;

    final imagePath = _selectedImage?.path ?? _selectedProduct?.image ?? '';

    final product = Product(
      name: enteredText,
      image: imagePath,
      price: _selectedProduct?.price ?? 0.0,
      description: _selectedProduct?.description ?? 'No description available',
    );

    ref
        .read(userProductsProvider.notifier)
        .addProduct(
          product.name,
          File(imagePath), // Handles both network & local file cases
          product.price,
          product.description,
        );

    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add a New Product')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Product Name'),
              controller: _titleController,
              style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
            ),
            const SizedBox(height: 16),
            //? Image input
            ImageInput(
              onPickImage: (image) {
                setState(() {
                  _selectedImage = image;
                  _selectedProduct = null;
                });
              },
            ),
            const SizedBox(height: 16),
            //? Product input
            ProductInput(
              onSelectProduct: (product) {
                setState(() {
                  _selectedProduct = product;
                  _selectedImage = null;
                });
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: _saveProduct,
              icon: const Icon(Icons.add),
              label: const Text('Add Product'),
            ),
          ],
        ),
      ),
    );
  }
}
