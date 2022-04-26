import 'package:flutter/material.dart';
import 'package:gallery_app/constants/firebase.dart';
import 'package:gallery_app/routes.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialization.then((value) {});
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: ' My Gallery  ',
      theme: ThemeData(),
      getPages: routes(),
      initialRoute: Routes.HOME,
    );
  }
}
