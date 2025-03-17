import 'package:flutter_riverpod/flutter_riverpod.dart';

final allBooksViewToggleProvider = StateProvider<AllBooksScreenSections>(
  (ref) => AllBooksScreenSections.grid,
);

final allBooksFilterToggleProvider = StateProvider((ref) => false);

enum AllBooksScreenSections { shelf, grid, list, filter }
