import 'package:firebase_storage/firebase_storage.dart';
import '../constants/constants_manager.dart';
import 'package:get/get.dart';
import 'dart:io';

class StorageService extends GetxService {
  static final StorageService _instance = StorageService._internal();

  factory StorageService() {
    return _instance;
  }

  StorageService._internal();

  FirebaseStorage storage = FirebaseStorage.instance;

  Future<String> uploadImageFile(String name, File file) async {
    var storageRef =
        storage.ref().child('${ConstantsManager.picsDirectory}/$name');
    var uploadTask = await storageRef.putFile(file);

    String downloadURL = await uploadTask.ref.getDownloadURL();
    return downloadURL;
  }

  Future<String> getImageByName(name) async {
    final ref = storage.ref().child('${ConstantsManager.picsDirectory}/$name');
    var url = await ref.getDownloadURL();
    return url;
  }

  Future<List<Reference>> getFirebaseImageFolder() {
    return storage
        .ref()
        .child(ConstantsManager.picsDirectory)
        .listAll()
        .then((result) => result.items.toList());
  }
}
