
import 'package:flutter/material.dart';
import 'package:gallery_app/controllers/products_contoller.dart';
import 'package:gallery_app/functions/functions.dart';
import 'package:gallery_app/models/product_model.dart';
import 'package:get/get.dart';

class BuyScreen extends StatelessWidget {
  BuyScreen({Key? key,required this.productModel}) : super(key: key);

  ProductController controller = Get.put(ProductController());

  ProductModel productModel;

  var formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: const Text("Buy"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GetBuilder<ProductController>(
              builder: (_) {
                return Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          hintText: "Name",
                        ),
                        validator: (val){
                          if(val!.isEmpty){
                            return "Please Enter Name";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10.0,),
                      TextFormField(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          hintText: "Phone",
                        ),
                        validator: (val){
                          if(val!.isEmpty){
                            return "Please Enter Phone";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10.0,),
                      TextFormField(
                        controller: addressController,
                        decoration: const InputDecoration(
                          hintText: "Address",
                        ),
                        validator: (val){
                          if(val!.isEmpty){
                            return "Please Enter Address";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10.0,),
                      controller.isLoading ? const Center(child: CircularProgressIndicator(),) : MaterialButton(
                        onPressed: (){
                          if(formKey.currentState!.validate()){

                            controller.addBuy(
                              name: nameController.text,
                              phone: phoneController.text,
                              address: addressController.text,
                              productModel: productModel,
                            );

                          }
                        },
                        child: const Text("Save",style: TextStyle(color: Colors.white),),
                        color: Colors.blue,
                        minWidth: double.infinity,
                        height: 40.0,
                      ),
                    ],
                  ),
                );
              }
          ),
        ),
      ),
    );
  }
}
