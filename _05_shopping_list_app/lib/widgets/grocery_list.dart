import 'package:_05_shopping_list_app/data/dummy_items.dart';
import 'package:_05_shopping_list_app/widgets/new_item.dart';
import 'package:flutter/material.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  void _addItem() {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (ctx) => const NewItem()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [IconButton(onPressed: _addItem, icon: Icon(Icons.add))],
      ),
      body: ListView.builder(
        itemCount: groceryItems.length,
        reverse: bool.fromEnvironment('reverse'),
        itemBuilder:
            (ctx, index) => ListTile(
              title: Text(
                groceryItems[index].name,
                style: TextStyle(fontSize: 20),
              ),
              leading: Container(
                width: 50,
                height: 50,
                color: groceryItems[index].category.color,
              ),
              subtitle: Text(
                'Quantity: ${groceryItems[index].quantity}',
                style: TextStyle(fontSize: 16),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {},
              ),
            ),
      ),
    );
  }
}
