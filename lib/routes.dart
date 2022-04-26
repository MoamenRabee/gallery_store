import 'package:gallery_app/view/home/home_screen.dart';
import 'package:gallery_app/view/images_store/bindings/image_home_binding.dart';
import 'package:gallery_app/view/images_store/images_home.dart';
import 'package:get/get.dart';

routes() => [
      GetPage(name: Routes.HOME, page: () => const HomeScreen()),
      GetPage(
          name: Routes.HOME_IMAGES,
          page: () => ImagesHomePage(),
          binding: ImageHomeBinding()),
    ];

class Routes {
  static const HOME = '/';
  static const HOME_IMAGES = '/home_images';
}
