import 'package:get/get.dart';

class DataController extends GetxController{
  static DataController instance = Get.find();
  RxInt dataIndex = 0.obs;
}