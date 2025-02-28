import 'package:_05_shopping_list_app/models/grocery_item.dart';
import 'package:_05_shopping_list_app/widgets/new_item.dart';
import 'package:flutter/material.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  final List<GroceryItem> _groceryItems = [];
  void _addItem() async {
    final newItem = await Navigator.of(
      context,
    ).push<GroceryItem>(MaterialPageRoute(builder: (ctx) => const NewItem()));

    if (newItem == null) {
      return;
    }

    setState(() {
      _groceryItems.add(newItem);
    });
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
