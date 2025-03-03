import 'package:_06_favorite_places_app/models/place.dart';
import 'package:_06_favorite_places_app/screens/places_detail.dart';
import 'package:flutter/material.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({super.key, required this.places});

  final List<Place> places;

  @override
  Widget build(BuildContext context) {
    if (places.isEmpty) {
      return Center(
        child: Text(
          'No places added yet, start adding some!',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      );
    }

    return ListView.builder(
      itemCount: places.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            radius: 26,
            backgroundImage: FileImage(places[index].image),
          ),
          title: Text(
            places[index].title,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          // subtitle: Text(places[index].location.address),
          onTap: () {
            // Go to detail page...
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => PlacesDetailScreen(place: places[index]),
              ),
            );
          },
        );
      },
    );
  }
}
