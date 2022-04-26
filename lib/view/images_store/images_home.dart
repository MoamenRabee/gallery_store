import 'package:flutter/material.dart';
import 'package:gallery_app/controllers/products_contoller.dart';
import 'package:gallery_app/models/product_model.dart';
import 'package:gallery_app/models/products.dart';
import 'package:gallery_app/view/images_store/details_screen.dart';
import 'package:get/get.dart';

class ImagesHomePage extends StatelessWidget {
  ImagesHomePage({Key? key}) : super(key: key);

  ProductController controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(
              height: 40,
            ),
            const Text(
              'Gallery',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 40,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 30,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: GetBuilder<ProductController>(
                    builder: (_) {
                      if(controller.isLoadingGetProducts){
                        return const Center(child: CircularProgressIndicator(),);
                      }else if(controller.productsByCategory.isEmpty){
                        return const Center(child: Text("Empty Products"),);
                      }
                      return GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemBuilder: (context, index) {
                          return RawMaterialButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailsPage(
                                    productModel: controller.productsByCategory[index],
                                    index: index,
                                  ),
                                ),
                              );
                            },
                            child: Hero(
                              tag: 'logo$index',
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    image: NetworkImage(controller.productsByCategory[index].imagePath!),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: controller.productsByCategory.length,
                      );
                    }
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
