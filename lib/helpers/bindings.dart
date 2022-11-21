import 'package:get/get.dart';
import 'package:investigations/controllers/management_controller.dart';
import 'package:investigations/controllers/supervisor_controller.dart';

import '/controllers/areas_controller.dart';
import '/controllers/database_controller.dart';
import '/controllers/readers_controller.dart';
import '/controllers/users_controller.dart';
import '../controllers/data_controller.dart';

class UsersBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<UsersController>(UsersController(), permanent: true);
    Get.put<DatabaseController>(DatabaseController(), permanent: true);
    Get.put<DataController>(DataController(), permanent: true);
  }
}

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ReadersController>(ReadersController(), permanent: true);
    Get.put<ManagementController>(ManagementController(), permanent: true);
    Get.put<AreasController>(AreasController(), permanent: true);
    Get.put<SupervisorController>(SupervisorController(), permanent: true);
  }
}
