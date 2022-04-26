import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:gallery_app/view/category_screen/catergory_items.dart';
import 'package:gallery_app/view/category_screen/custom_bottom_category.dart';
import 'package:gallery_app/view/drawer/custom_drawer.dart';
import 'package:gallery_app/view/products/products_screen.dart';
import 'package:lottie/lottie.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  _ListView6State createState() => _ListView6State();
}

class _ListView6State extends State<HomeScreen> {
  @override
  Widget build(BuildContext c) {
    return Container(
        decoration: const BoxDecoration(
          color: Colors.teal,
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          body: Center(
            child: OpenContainer(
              closedBuilder: (_, openContainer) {
                return SizedBox(
                  height:350            ,      width: 300,
                  child: Container(
                    decoration:
                        BoxDecoration(color: Colors.white.withOpacity(.5)),
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 28.0),
                              child: Card(
                                color: Colors.redAccent,
                                elevation: 18,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: Lottie.network(
                                    'https://assets1.lottiefiles.com/packages/lf20_3tryizhw.json'),
                              ),
                            ),
                            SizedBox(height: 10,)
,

                            const  Text(
                              'Welcome Back, \n Countine',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600,
                                height: 1.5
                              ),
                            )
                          ],
                        ),

                           /*const
                          ),*/

                      ],
                    ),
                  ),
                );
              },
              openColor: Colors.transparent,
              closedElevation: 1,
              closedShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              transitionDuration: const Duration(milliseconds: 700),
              openBuilder: (_, closeContainer) {
                return SlideAnimation1();
              },
            ),
          ),
        ));
  }
}

class SlideAnimation1 extends StatelessWidget {
  const SlideAnimation1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage(
                  'assets/images/WhatsApp Image 2022-04-24 at 5.50.42 AM.jpeg'),
              fit: BoxFit.cover)),
      child: Scaffold(
          drawer: const ClipRRect(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(40),
                bottomRight: Radius.circular(40)),
            child: Drawer(
              child: CustomDarwer(),
            ),
          ),
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          body: Column(
            children: [
              AnimationLimiter(
                child: ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(20),
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  itemCount: categoryItem.length,
                  itemBuilder: (BuildContext context, int index) {
                    print(index);
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      delay: const Duration(milliseconds: 100),
                      child: CustomBottomCategory(
                        index: index,
                      ),
                    );
                  },
                ),
              ),
              MaterialButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductsScreen()));
                },
                child: const Text("Products",style: TextStyle(color: Colors.white),),
                color: Colors.blue,
              ),
            ],
          )),
    );
  }
}
