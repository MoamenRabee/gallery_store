import 'package:get/get.dart';
import '../../../controllers/products_contoller.dart';

class ImageHomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductController(), fenix: true);
  }
}
