import 'dart:io';

import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UsersController extends GetxController {
  static UsersController instance = Get.find();
  TextEditingController userName = TextEditingController();
  SingleValueDropDownController loginUserName = SingleValueDropDownController();
  TextEditingController userPassword = TextEditingController();
  TextEditingController userPassword2 = TextEditingController();
  TextEditingController userImage = TextEditingController();
  FocusNode searchFocusNode = FocusNode();
  FocusNode textFieldFocusNode = FocusNode();
  RxList<DropDownValueModel> usersList= <DropDownValueModel>[].obs;
  RxBool isImageLoaded = false.obs;
  late File newFile;
  imagePicker()async{
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      File file = File(result.files.single.path.toString());
      newFile = await file.copy('D:/${result.files.single.name}');
      userImage.text = newFile.path;
      isImageLoaded(true);
    } else {
      // User canceled the picker
    }
  }
}
