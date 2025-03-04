import 'package:_06_favorite_places_app/models/place.dart';
import 'package:_06_favorite_places_app/widgets/image_input.dart';
import 'package:_06_favorite_places_app/widgets/location_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:io';

import 'package:_06_favorite_places_app/providers/user_places.dart';

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {
  final _titleController = TextEditingController();
  File? _selectedImage;
  PlaceLocation? _selectedLocation;

  void _savePlace() {
    final enteredText = _titleController.text;
    if (enteredText.isEmpty ||
        _selectedImage == null ||
        _selectedLocation == null) {
      return;
    }

    ref
        .read(userPlacesProvider.notifier)
        .addPlace(enteredText, _selectedImage!, _selectedLocation!);
    // context.read(userPlacesProvider.notifier).addPlace(title);
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
      appBar: AppBar(title: const Text('Add a New Place')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Title'),
              controller: _titleController,
              style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
            ),
            const SizedBox(height: 16),
            //? Image input
            ImageInput(
              onPickImage: (image) {
                _selectedImage = image;
              },
            ),
            const SizedBox(height: 16),
            //? Location input
            LocationInput(
              onSelectLocation: (location) {
                _selectedLocation = location;
              },
            ),

            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: _savePlace,
              icon: const Icon(Icons.add),
              label: const Text('Add Place'),
            ),
            // Row(
            //   children: [
            //     Container(
            //       width: 100,
            //       height: 100,
            //       decoration: BoxDecoration(
            //         border: Border.all(width: 1, color: Colors.grey),
            //       ),
            //       child: const Center(child: Icon(Icons.image)),
            //     ),
            //     const SizedBox(width: 16),
            //     Expanded(
            //       child: TextButton.icon(
            //         onPressed: () {},
            //         icon: const Icon(Icons.camera),
            //         label: const Text('Take Picture'),
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
