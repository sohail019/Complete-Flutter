import 'dart:io';
import 'package:file_picker/file_picker.dart';

class CameraUtils {
  Future<List<File>> pickMultipleFile() async {
    List<File> selectedFileList = [];

    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.image,
    );

    if (result != null && result.files.length == 1) {
      selectedFileList = [File(result.files.first.path!)];
    } else if (result != null && result.files.length > 1) {
      selectedFileList = result.paths.map((path) => File(path!)).toList();
    }
    return selectedFileList;
  }

  Future<File?> pickFile() async {
    File? selectedFile;

    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.image,
    );
    if (result != null) {
      selectedFile = File(result.files.single.path!);
    }
    return selectedFile;
  }

  Future<void> getPicture() async {}
}
