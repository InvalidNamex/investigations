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
  TextEditingController phoneNo = TextEditingController();
  TextEditingController leaveReason = TextEditingController();
  RxBool currentlyWorking = true.obs;
  RxBool isImage1Loaded = false.obs;
  RxBool isImage2Loaded = false.obs;
  TextEditingController id1 = TextEditingController();
  TextEditingController id2 = TextEditingController();
  late File newFile1;
  late File newFile2;
  imagePicker1() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      File file = File(result.files.single.path.toString());
      newFile1 = await file.copy('D:/${result.files.single.name}');
      id1.text = newFile1.path;
      isImage1Loaded(true);
    } else {
      // User canceled the picker
    }
  }

  imagePicker2() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      File file = File(result.files.single.path.toString());
      newFile2 = await file.copy('D:/${result.files.single.name}');
      id2.text = newFile2.path;
      isImage2Loaded(true);
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
