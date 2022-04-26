import 'package:contactus/contactus.dart';
import 'package:flutter/material.dart';

class ConatctsUSScreen extends StatelessWidget {
  const ConatctsUSScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Container(
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.symmetric(vertical: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ContactUs(
              email: 'Amirrizksedky@gmail.com',
              companyName: 'Amir Rizk',
              phoneNumber: '+201091088189',
              dividerThickness: 3,
              website: 'https://Ahmedokab2411@gmail.com',
              tagLine: 'App Owner',
              companyColor: Colors.black,
              taglineColor: Colors.black,
              cardColor: Colors.amberAccent,
              textColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
