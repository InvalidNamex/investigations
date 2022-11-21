import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SupervisorController extends GetxController {
  static SupervisorController instance = Get.find();
  RxInt selectedIndex = 0.obs;
  TextEditingController supervisorName = TextEditingController();
  TextEditingController supervisorPhoneNo = TextEditingController();
  SingleValueDropDownController reader = SingleValueDropDownController();
  FocusNode searchFocusNode = FocusNode();
  FocusNode textFieldFocusNode = FocusNode();
  RxList readers = [].obs;
  RxList areas = [].obs;
}
