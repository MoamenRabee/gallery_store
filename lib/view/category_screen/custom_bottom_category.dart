import 'package:flutter/material.dart';
import 'package:gallery_app/controllers/products_contoller.dart';
import 'package:gallery_app/view/category_screen/catergory_items.dart';
import 'package:gallery_app/view/contact_us_screen/conatcts_us_screen.dart';
import 'package:get/get.dart';

import '../images_store/images_home.dart';


ProductController controller = Get.put(ProductController());

class CustomBottomCategory extends StatelessWidget {
  final int index;
  const CustomBottomCategory({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() {
        print(categoryItem[index].imageName);
        controller.getProductsByCategory(category: categoryItem[index].imageName);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ImagesHomePage()),
        );
      }),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.transparent,
          boxShadow: const [],
          border: Border.all(
            color: Colors.teal,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        margin: const EdgeInsets.all(25),
        padding: const EdgeInsets.all(35),
        child: Center(
          child: Text(
            categoryItem[index].imageName,
            style: TextStyle(
                fontSize: 30,
                color: Color.fromARGB(255, 231, 234, 236),
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
