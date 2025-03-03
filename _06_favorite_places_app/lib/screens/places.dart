import 'package:_06_favorite_places_app/widgets/places_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:_06_favorite_places_app/providers/user_places.dart';
import 'package:_06_favorite_places_app/screens/add_place.dart';

class PlacesScreen extends ConsumerWidget {
  const PlacesScreen({super.key});

  void _addPlace(BuildContext context) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (ctx) => const AddPlaceScreen()));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userPlaces = ref.watch(userPlacesProvider);

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: PlacesList(places: userPlaces),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addPlace(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
