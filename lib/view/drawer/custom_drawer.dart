import 'package:flutter/material.dart';
import 'package:gallery_app/view/contact_us_screen/conatcts_us_screen.dart';
import 'package:gallery_app/view/reporting_screen/Reporting_screen.dart';
import 'package:get/get.dart';

class CustomDarwer extends StatelessWidget {
  const CustomDarwer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.teal,
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 15),
            color: Colors.greenAccent,
            blurRadius: 50,
          )
        ],
        border: Border.all(
          color: Colors.green,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(110),
      ),
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(10),
      child: ListView(
        padding: const EdgeInsets.all(25),
        children: [
          const ListTile(
            title: Text(''),
          ),
          const SizedBox(
            height: 150,
          ),
          ListTile(
            title: InkWell(
              onTap: () {
                Get.to(ConatctsUSScreen);
              },
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.teal,
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(0, 10),
                      color: Colors.greenAccent,
                      blurRadius: 50,
                    )
                  ],
                  border: Border.all(
                    color: Colors.green,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.to(ConatctsUSScreen());
                      },
                      child: const Text(
                        'Contact with us',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    Icon(Icons.telegram_outlined, color: Colors.white),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          ListTile(
            title: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ReportingScreen()));
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.teal,
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(0, 10),
                      color: Colors.greenAccent,
                      blurRadius: 50,
                    )
                  ],
                  border: Border.all(
                    color: Colors.green,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(35),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Reporting',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    ),
                    Icon(
                      Icons.contact_mail,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
