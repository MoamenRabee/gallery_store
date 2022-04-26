
import 'package:flutter/material.dart';
import 'package:gallery_app/controllers/products_contoller.dart';
import 'package:gallery_app/functions/functions.dart';
import 'package:gallery_app/models/product_model.dart';
import 'package:get/get.dart';

class ProductsFormScreen extends StatelessWidget {
  ProductsFormScreen({Key? key,required this.action,this.productModel}) : super(key: key);

  ProductController controller = Get.put(ProductController());

  String action;
  ProductModel? productModel;
  String? oldImage;

  var formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController photographerController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  TextEditingController categoryController = TextEditingController();


  @override
  Widget build(BuildContext context) {

    if(action == "edit"){
      titleController.text = productModel!.title!;
      priceController.text = productModel!.price!;
      photographerController.text = productModel!.photographer!;
      detailsController.text = productModel!.details!;
      oldImage = productModel!.imagePath!;
    }


    return Scaffold(
      appBar: AppBar(
        title: action == "add" ? const Text("Add Product") : const Text("Edit Product"),
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
                    if(action == "add")
                    DropdownButtonFormField<String>(
                      items: const [
                        DropdownMenuItem(child: Text("Arts Paints"),value: "Arts Paints",),
                        DropdownMenuItem(child: Text("Arts Structed"),value: "Arts Structed",),
                        DropdownMenuItem(child: Text("Arts"),value: "Arts",),
                      ],
                      hint: const Text("Category"),
                      onChanged: (val){
                        categoryController.text = val!;
                      },
                      validator: (val){
                        if(val == null){
                          return "Please Enter Category";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10.0,),
                    TextFormField(
                      controller: titleController,
                      decoration: const InputDecoration(
                        hintText: "Title",
                      ),
                      validator: (val){
                        if(val!.isEmpty){
                          return "Please Enter Title";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10.0,),
                    TextFormField(
                      controller: priceController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: "Price",
                      ),
                      validator: (val){
                        if(val!.isEmpty){
                          return "Please Enter Price";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10.0,),
                    TextFormField(
                      controller: photographerController,
                      decoration: const InputDecoration(
                        hintText: "Photographer",
                      ),
                      validator: (val){
                        if(val!.isEmpty){
                          return "Please Enter Photographer";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10.0,),
                    TextFormField(
                      controller: detailsController,
                      decoration: const InputDecoration(
                        hintText: "Details",
                      ),
                      maxLines: 3,
                      validator: (val){
                        if(val!.isEmpty){
                          return "Please Enter Details";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10.0,),
                    ElevatedButton(
                      onPressed: (){
                      controller.selectProductImage();
                      },
                      child: const Text("Choose Image"),
                    ),
                    if(controller.selectedImage !=null)
                      Stack(
                        children: [
                          Image.file(controller.selectedImage!,width: 150.0,height: 150.0,fit: BoxFit.cover,),
                          IconButton(
                            onPressed: (){
                              controller.selectedImage = null;
                              controller.update();
                            },
                            icon: const Icon(Icons.cancel),
                          ),
                        ],
                      ),
                    if(oldImage !=null && controller.selectedImage ==null)
                      Image.network(oldImage!,width: 150.0,height: 150.0,fit: BoxFit.cover,),
                    const SizedBox(height: 10.0,),
                    controller.isLoading ? const Center(child: CircularProgressIndicator(),) : MaterialButton(
                      onPressed: (){
                        if(formKey.currentState!.validate()){

                          if(action == "add"){
                            if(controller.selectedImage == null){
                              showToast(message: "Please Choose Image", color: Colors.red);
                            }else{
                              controller.addNewProduct(
                                price: priceController.text,
                                photographer: photographerController.text,
                                title: titleController.text,
                                details: detailsController.text,
                                category: categoryController.text,
                              );
                            }
                          }else{

                            controller.editProduct(
                              id: productModel!.id!,
                              price: priceController.text,
                              photographer: photographerController.text,
                              title: titleController.text,
                              details: detailsController.text,
                              category: productModel!.category!,
                              oldImage: oldImage!,
                            );

                          }

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
