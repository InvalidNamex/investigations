import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReadersController extends GetxController {
  static ReadersController instance = Get.find();
  RxInt selectedIndex = 0.obs;
  TextEditingController joinDate = TextEditingController();
  TextEditingController leaveDate = TextEditingController();
  TextEditingController readerName = TextEditingController();
  TextEditingController tabNo = TextEditingController();
  TextEditingController image = TextEditingController();
  TextEditingController phoneNo = TextEditingController();
  imagePicker()async{
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      File file = File(result.files.single.path.toString());
      File newFile = await file.copy('D:/${result.files.single.name}');
      image.text = newFile.path;
    } else {
      // User canceled the picker
    }
  }

  @override
  void onInit() {
    joinDate.text = ""; //set the initial value of text field
    // TODO: implement onInit
    super.onInit();
  }
}
