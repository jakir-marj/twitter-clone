import 'dart:io';

import 'package:appwrite/appwrite.dart';
import 'package:appwrite_test/constants/appwrite_constants.dart';
import 'package:appwrite_test/core/provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final storageAPIProvider = Provider((ref) {
  return StorageAPI(storage: ref.watch(appwriteStorageProvider));
});

class StorageAPI {
  final Storage _storage;
  StorageAPI({required Storage storage}) : _storage = storage;
  Future<List<String>> uplodeImage(List<File> files) async {
    List<String> imageLinks = [];
    for (final file in files) {
      final uploadedImage = await _storage.createFile(
        bucketId: AppwriteConstants.imagedBucket,
        fileId: ID.unique(),
        file: InputFile(path: file.path),
      );
      imageLinks.add(uploadedImage.$id);
    }
    return imageLinks;
  }
}
