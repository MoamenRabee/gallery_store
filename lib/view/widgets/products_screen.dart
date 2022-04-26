import 'package:flutter/material.dart';
import 'package:gallery_app/constants/assets_path.dart';
import 'package:gallery_app/view/widgets/custom_text.dart';

class ProductListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              image1,
              width: 140,
            ),
          ),
          Wrap(
            direction: Axis.vertical,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    // ignore: prefer_const_constructors
                    CustomText(
                      text: "White Shoes",
                      size: 18,
                      color: Colors.black,
                      weight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    CustomText(
                      text: "Nike",
                      color: Colors.grey,
                      size: 18,
                      weight: FontWeight.w700,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: "\$18.0",
                      size: 20,
                      weight: FontWeight.bold,
                      color: Colors.red,
                    ),
                    SizedBox(
                      width: 100,
                    ),
                    IconButton(
                        icon: Icon(Icons.add_shopping_cart), onPressed: () {})
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
