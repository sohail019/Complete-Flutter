import 'dart:convert';

import 'package:_05_shopping_list_app/data/categories.dart';
import 'package:_05_shopping_list_app/models/grocery_item.dart';
import 'package:_05_shopping_list_app/widgets/new_item.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  List<GroceryItem> _groceryItems = [];

  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  void _loadItems() async {
    final url = Uri.https(
      'flutter-prep-962af-default-rtdb.firebaseio.com',
      'shopping_list.json',
    );

    final response = await http.get(url);
    final Map<String, dynamic> listData = json.decode(response.body);
    final List<GroceryItem> _loadedItems = [];
    for (final item in listData.entries) {
      final category = categories.entries.firstWhere(
        (catItem) => catItem.value.name == item.value['category'].value,
      );
      _loadedItems.add(
        GroceryItem(
          id: item.key,
          name: item.value['name'],
          quantity: item.value['quantity'],
          category: category.value,
        ),
      );
    }

    setState(() {
      _groceryItems = _loadedItems;
    });
    print(response.body);
  }

  void _addItem() async {
    final newItem = await Navigator.of(
      context,
    ).push<GroceryItem>(MaterialPageRoute(builder: (ctx) => const NewItem()));

    if (newItem == null) {
      return;
    }

    _loadItems();

    // setState(() {
    //   _groceryItems.add(newItem);
    // });
  }

  void _showDialog(BuildContext context, String itemName, String itemId) {
    showDialog(
      context: context,
      builder:
          (ctx) => AlertDialog(
            title: Text('Remove Item'),
            content: Text('Are you sure you want to remove $itemName?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  _removeItemById(itemId);
                  Navigator.of(ctx).pop();
                },
                child: const Text('Remove'),
              ),
            ],
          ),
    );
  }

  void _removeItemById(String itemId) {
    setState(() {
      _groceryItems.removeWhere((item) => item.id == itemId);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: const Text("No items added yet. Please add it"),
    );

    if (_groceryItems.isNotEmpty) {
      content = ListView.builder(
        itemCount: _groceryItems.length,
        reverse: bool.fromEnvironment('reverse'),
        itemBuilder:
            (ctx, index) => ListTile(
              title: Text(
                _groceryItems[index].name,
                style: TextStyle(fontSize: 20),
              ),
              leading: Container(
                width: 50,
                height: 50,
                color: _groceryItems[index].category.color,
              ),
              subtitle: Text(
                'Quantity: ${_groceryItems[index].quantity}',
                style: TextStyle(fontSize: 16),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  _showDialog(
                    context,
                    _groceryItems[index].name,
                    _groceryItems[index].id,
                  );
                },
              ),
            ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [IconButton(onPressed: _addItem, icon: Icon(Icons.add))],
      ),
      body: content,
    );
  }
}
