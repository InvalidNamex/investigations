import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();
  RxInt selectedIndex = 0.obs;
  TextEditingController dob = TextEditingController();

  @override
  void onInit() {
    dob.text = ""; //set the initial value of text field
    // TODO: implement onInit
    super.onInit();
  }
}
