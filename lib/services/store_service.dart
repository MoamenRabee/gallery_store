import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gallery_app/constants/constants_manager.dart';
import 'package:get/get.dart';
import '../models/products.dart';

class StoreService extends GetxService {
  StoreService._internal();

  static final StoreService _instance = StoreService._internal();

  factory StoreService() {
    return _instance;
  }

  final CollectionReference _fireImgCollection =
      FirebaseFirestore.instance.collection(ConstantsManager.picsDirectory);

  Stream<List<ImageDetails>> getImages() {
    return _fireImgCollection.snapshots().map((querySnapshot) => querySnapshot
        .docs
        .map((item) =>
            ImageDetails.fromMap(item.data()! as Map<String, dynamic>))
        .toList());
  }

  Future<ImageDetails> getImageByID(String id) async {
    return await _fireImgCollection
        .doc(id)
        .get()
        .then(
            (doc) => ImageDetails.fromMap(doc.data()! as Map<String, dynamic>))
        .catchError((error) {});
  }

  Future<void> addImage(ImageDetails imageDetails) async {
    await _fireImgCollection
        .doc(imageDetails.id)
        .set(imageDetails.toMap())
        .catchError((error) => print(error));
  }
}
