import 'package:_06_favorite_places_app/screens/add_place.dart';
import 'package:_06_favorite_places_app/widgets/places_list.dart';
import 'package:flutter/material.dart';

class PlacesScreen extends StatelessWidget {
  const PlacesScreen({super.key});

  void _addPlace(BuildContext context) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (ctx) => const AddPlaceScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _addPlace(context),
          ),
        ],
      ),
      body: PlacesList(places: []),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addPlace(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
