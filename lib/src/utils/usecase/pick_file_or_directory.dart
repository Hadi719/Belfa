import 'package:file_picker/file_picker.dart';
import 'package:logging/logging.dart';

Logger log = Logger('main.utils.pickFileOrDirectory');

/// Prompts the user to select an Isar database file (.isar extension).
///
/// Returns the path to the selected file, or `null` if the user cancels.
Future<String?> pickIsarFile() async {
  log.info('Picking Isar file...');

  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ['isar'],
  );

  if (result != null) {
    final selectedFile = result.files.single;
    final filePath = selectedFile.path;

    log.info('Isar file picked successfully: $filePath');
    log.fine(
        'File details: name=${selectedFile.name}, size=${selectedFile.size}');

    return filePath;
  } else {
    log.warning('Picking Isar file canceled by user.');
    return null;
  }
}

/// Prompts the user to select a directory.
///
/// Returns the path to the selected directory, or `null` if the user cancels.
Future<String?> selectDirectory() async {
  log.info('Selecting directory...');

  String? selectedDirectory = await FilePicker.platform.getDirectoryPath();
  if (selectedDirectory != null) {
    log.info('Directory selected: $selectedDirectory');
    return selectedDirectory;
  } else {
    log.warning('Directory selection canceled by user.');
    return null;
  }
}
