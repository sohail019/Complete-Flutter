import 'package:flutter_riverpod/flutter_riverpod.dart';

final toggleAudioBooksViewProvider = StateProvider<AudioBooksScreenEnum>(
  (ref) => AudioBooksScreenEnum.grid,
);

final audioFilterToggleProvider = StateProvider((ref) => false);

enum AudioBooksScreenEnum { shelf, grid, list }
