import 'dart:io';
import 'dart:math';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

Future<XFile?> selectImage() async {
  final ImagePicker _picker = ImagePicker();
  // Pick an image
  return await _picker.pickImage(source: ImageSource.gallery);
}

Future<String> uploadFile({required String ref,required File file}) async {

  String fileName = Random().nextInt(1000000).toString() + file.path.split("/").last;
  String downloadURL = "";

  try{

    await firebase_storage.FirebaseStorage.instance.ref(ref).child(fileName).putFile(file).then((p0) async {

      downloadURL = await firebase_storage.FirebaseStorage.instance.ref(ref).child(fileName).getDownloadURL();

    });

  }catch(e){
    print(e.toString());
  }

  return downloadURL;

}



void showDeleteConfirmation({required BuildContext context,required void Function()? onConfirm}){
  Widget dialog = AlertDialog(
    title: const Text("Confirmation",textAlign: TextAlign.center,),
    content: const Text("Are sure of the deleting process ?",textAlign: TextAlign.center,),
    actions: [
      TextButton(
        onPressed: (){
          Get.back();
        },
        child: const Text("Cancel"),
      ),
      MaterialButton(
        onPressed: onConfirm,
        child: const Text("Delete",style: TextStyle(color: Colors.white),),
        color: Colors.red,
      ),
    ],
    actionsAlignment: MainAxisAlignment.center,
  );

  showDialog(context: context, builder: (context){
    return dialog;
  });
}


void showToast({required String message,required Color color}) async {
  await Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0
  );
}
