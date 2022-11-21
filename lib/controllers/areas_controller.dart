import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AreasController extends GetxController {
  static AreasController instance = AreasController();
  TextEditingController sector = TextEditingController();
  TextEditingController file = TextEditingController();
  TextEditingController areaName = TextEditingController();
  TextEditingController totalCounters = TextEditingController();
  SingleValueDropDownController reader = SingleValueDropDownController();
  FocusNode searchFocusNode = FocusNode();
  FocusNode textFieldFocusNode = FocusNode();
  RxList<DropDownValueModel> readersList = <DropDownValueModel>[].obs;
}
