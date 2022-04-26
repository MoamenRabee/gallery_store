import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gallery_app/functions/functions.dart';
import 'package:gallery_app/models/buy_model.dart';
import 'package:gallery_app/models/product_model.dart';
import 'package:gallery_app/models/products.dart';
import 'package:get/get.dart';
import '../services/store_service.dart';

class ProductController extends GetxController with StateMixin<dynamic> {
  static ProductController instance = Get.find();
  RxList<ImageDetails> products = RxList<ImageDetails>([]);
  final StoreService _storeService = StoreService();

  @override
  onReady() {
    super.onReady();
    products.bindStream(getAllImages());
  }

  Stream<List<ImageDetails>> getAllImages() => _storeService.getImages();

  bool isLoading = false;
  bool isLoadingReporting = false;
  bool isLoadingGetProducts = false;

  File? selectedImage;



  void addNewProduct({
    required String price,
    required String photographer,
    required String title,
    required String details,
    required String category,
  }) async {
    isLoading = true;
    update();
    try{


      String urlImage = await uploadFile(ref: "Images", file: selectedImage!);

      ProductModel productModel = ProductModel(
        id: null,
        imagePath: urlImage,
        price: price,
        photographer: photographer,
        title: title,
        details: details,
        category: category,
      );

      var product = await FirebaseFirestore.instance.collection("Products").add(productModel.toMap());
      await FirebaseFirestore.instance.collection("Products").doc(product.id).update({"id" : product.id});

      getProducts();
      showToast(message: "Product Added Successfully", color: Colors.green);
      Get.back();

    }catch(e){
      print(e.toString());
    }finally{
      isLoading = false;
      selectedImage = null;
      update();
    }
  }

  void selectProductImage(){
    selectImage().then((value){
      selectedImage = File(value!.path);
      update();
    }).catchError((error){
      selectedImage = null;
      update();
    });
  }



  void addReporting({
    required String text,
  }) async {
    isLoadingReporting = true;
    update();
    try{


      await FirebaseFirestore.instance.collection("Reporting").add({"text" : text});

      showToast(message: "Done", color: Colors.green);
      Get.back();

    }catch(e){
      print(e.toString());
    }finally{
      isLoadingReporting = false;
      selectedImage = null;
      update();
    }
  }

  void editProduct({
    required String id,
    required String price,
    required String photographer,
    required String title,
    required String details,
    required String category,
    required String oldImage,
  }) async {
    isLoading = true;
    update();
    try{

      String image;

      if(selectedImage !=null){
        image = await uploadFile(ref: "Images", file: selectedImage!);
      }else{
        image = oldImage;
      }


      ProductModel productModel = ProductModel(
        id: id,
        imagePath: image,
        price: price,
        photographer: photographer,
        title: title,
        details: details,
        category: category,
      );

      await FirebaseFirestore.instance.collection("Products").doc(id).update(productModel.toMap());

      getProducts();
      showToast(message: "Product Updated Successfully", color: Colors.green);
      Get.back();

    }catch(e){
      print(e.toString());
    }finally{
      isLoading = false;
      selectedImage = null;
      update();
    }
  }

  void deleteProducts({required String id,}) async {

    try{
      await FirebaseFirestore.instance.collection("Products").doc(id).delete();
      showToast(message: "Product Deleted Successfully", color: Colors.green);
      getProducts();
    }catch(e){
      print(e.toString());
    }finally{
      isLoading = false;
      update();
    }
  }

  List<ProductModel> allProduct= [];
  void getProducts() async {
    allProduct.clear();
    isLoading = true;
    update();

    try{
      // get all Product
      var product = await FirebaseFirestore.instance.collection("Products").get();

      for (var element in product.docs) {
        allProduct.add(ProductModel.fromJson(element.data()));
      }

    }catch(e){
      print(e.toString());
    }finally{
      isLoading = false;
      update();
    }
  }


  List<ProductModel> productsByCategory = [];
  void getProductsByCategory({required String category}) async {
    productsByCategory.clear();
    isLoadingGetProducts = true;
    update();

    try{
      // get all Product
      var products = await FirebaseFirestore.instance.collection("Products").where("category",isEqualTo: category).get();

      for (var element in products.docs) {
        productsByCategory.add(ProductModel.fromJson(element.data()));
        print(element.data());
      }

    }catch(e){
      print(e.toString());
    }finally{
      isLoadingGetProducts = false;
      update();
    }
  }


  void addBuy({
    required String name,
    required String phone,
    required String address,
    required ProductModel productModel,
  }) async {
    isLoading = true;
    update();
    try{



      BuyModel buyModel = BuyModel(
          id: null,
          imagePath: productModel.imagePath,
          price: productModel.price,
          photographer: productModel.photographer,
          title: productModel.title,
          details: productModel.details,
          category: productModel.category,
          name: name,
          phone: phone,
          address: address,
      );

      var product = await FirebaseFirestore.instance.collection("Buy").add(buyModel.toMap());
      await FirebaseFirestore.instance.collection("Buy").doc(product.id).update({"id" : product.id});

      showToast(message: "Done", color: Colors.green);
      Get.back();

    }catch(e){
      print(e.toString());
    }finally{
      isLoading = false;
      selectedImage = null;
      update();
    }
  }



  @override
  void onInit() {
    getProducts();
    super.onInit();
  }




}
