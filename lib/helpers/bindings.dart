import 'package:get/get.dart';
import '/controllers/database_controller.dart';
import '/controllers/users_controller.dart';
import '/controllers/readers_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ReadersController>(ReadersController(), permanent: true);
  }
}
class UsersBinding implements Bindings{
  @override
  void dependencies() {
    Get.put<UsersController>(UsersController(), permanent: true);
    Get.put<DatabaseController>(DatabaseController(), permanent: true);
  }
}