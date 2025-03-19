import 'package:flutter_riverpod/flutter_riverpod.dart';

final toggleEBooksViewProvider = StateProvider<EBookScreenEnum>(
  (ref) => EBookScreenEnum.grid,
);

final ebookFilterToggleProvider = StateProvider((ref) => false);

enum EBookScreenEnum { shelf, grid, list }
