import 'package:_06_favorite_places_app/providers/user_products.dart';
import 'package:_06_favorite_places_app/screens/add_product.dart';
import 'package:_06_favorite_places_app/widgets/product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductsScreen extends ConsumerStatefulWidget {
  const ProductsScreen({super.key});

  @override
  ConsumerState<ProductsScreen> createState() {
    return _ProductsScreenState();
  }
}

class _ProductsScreenState extends ConsumerState<ProductsScreen> {
  late Future<void> _productsFuture;

  @override
  void initState() {
    super.initState();
    _productsFuture = ref.read(userProductsProvider.notifier).loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    final userProducts = ref.watch(userProductsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Products'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (ctx) => const AddProductScreen()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: _productsFuture,
          builder:
              (context, snapshot) =>
                  snapshot.connectionState == ConnectionState.waiting
                      ? const Center(child: CircularProgressIndicator())
                      : ProductList(products: userProducts),
        ),
      ),
    );
  }
}
