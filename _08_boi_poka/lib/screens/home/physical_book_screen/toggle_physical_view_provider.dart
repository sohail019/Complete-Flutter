import 'package:flutter_riverpod/flutter_riverpod.dart';

final togglePhysicalViewProvider = StateProvider<PhysicalBooksScreenEnum>(
  (ref) => PhysicalBooksScreenEnum.grid,
);
final physicalFilterToggleProvider = StateProvider((ref) => false);

enum PhysicalBooksScreenEnum { shelf, grid, list }
