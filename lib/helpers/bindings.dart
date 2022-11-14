import 'package:get/get.dart';
import 'package:investigations/controllers/database_controller.dart';

import '../controllers/readers_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ReadersController>(ReadersController(), permanent: true);
    Get.put<DatabaseController>(DatabaseController(), permanent: true);
  }
}
