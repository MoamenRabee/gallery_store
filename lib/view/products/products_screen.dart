import 'package:flutter/material.dart';
import 'package:gallery_app/controllers/products_contoller.dart';
import 'package:gallery_app/functions/functions.dart';
import 'package:gallery_app/view/products/products_form_screen.dart';
import 'package:get/get.dart';

class ProductsScreen extends StatelessWidget {
  ProductsScreen({Key? key}) : super(key: key);


  ProductController controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
      ),
      body: GetBuilder<ProductController>(
        builder: (_){
          if(controller.isLoading){
            return const Center(child: CircularProgressIndicator(),);
          }else if(controller.allProduct.isEmpty){
            return const Center(child: Text("Empty"),);
          }
          return ListView.builder(
            itemBuilder: (context,index){
              return ListTile(
                leading: Image.network(controller.allProduct[index].imagePath!,width: 50.0,height: 50.0,fit: BoxFit.cover,),
                title: Text("${controller.allProduct[index].title!} - ${controller.allProduct[index].category!}"),
                subtitle: Text(controller.allProduct[index].details!,maxLines: 5,overflow: TextOverflow.ellipsis),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductsFormScreen(action: "edit",productModel: controller.allProduct[index],)));
                      },
                      icon: const Icon(Icons.edit),
                    ),
                    IconButton(
                      onPressed: (){
                        showDeleteConfirmation(context: context, onConfirm: (){
                          controller.deleteProducts(id: controller.allProduct[index].id!);
                          Get.back();
                        });
                      },
                      icon: const Icon(Icons.delete),
                    ),
                  ],
                ),
              );
            },
            itemCount: controller.allProduct.length,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductsFormScreen(action: "add",)));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
