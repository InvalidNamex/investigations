import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:investigations/widgets/radio_button_group.dart';

import '../../constants.dart';

Widget addReader(context) {
  final _formKey = GlobalKey<FormState>();
  return SingleChildScrollView(
    child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // id image
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Center(
                        child: Obx(() => readersController.isImage1Loaded.value
                            ? Image.file(
                                readersController.newFile1,
                                fit: BoxFit.contain,
                                width: 200,
                                height: 150,
                              )
                            : Image.asset(
                                'assets/images/id1.webp',
                                fit: BoxFit.contain,
                                width: 200,
                                height: 150,
                              )),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          await readersController.imagePicker1();
                        },
                        child: const Text('بطاقة وجه'),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Center(
                        child: Obx(() => readersController.isImage2Loaded.value
                            ? Image.file(
                                readersController.newFile2,
                                fit: BoxFit.contain,
                                width: 200,
                                height: 150,
                              )
                            : Image.asset(
                                'assets/images/id2.webp',
                                fit: BoxFit.contain,
                                width: 200,
                                height: 150,
                              )),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          await readersController.imagePicker2();
                        },
                        child: const Text('بطاقة ظهر'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // reader name
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 300,
                child: TextFormField(
                  controller: readersController.readerName,
                  maxLines: 1,
                  textAlign: TextAlign.right,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'اسم القارئ',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'حقل فارغ';
                    }
                    return null;
                  },
                ),
              ),
            ),
            // phone no
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 300,
                child: TextFormField(
                  controller: readersController.phoneNo,
                  maxLines: 1,
                  textAlign: TextAlign.right,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'رقم الهاتف',
                  ),
                ),
              ),
            ),
            // tab no
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 150,
                child: TextFormField(
                  controller: readersController.tabNo,
                  maxLines: 1,
                  textAlign: TextAlign.right,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'رقم التاب',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty || !value.isNum) {
                      return 'حقل فارغ/بيانات خاطئة';
                    }
                    return null;
                  },
                ),
              ),
            ),
            //join date
            SizedBox(
              width: 300,
              child: TextField(
                controller: readersController.joinDate,
                decoration: const InputDecoration(
                    icon: Icon(Icons.calendar_today), //icon of text field
                    labelText: "تاريخ الالتحاق" //label text of field
                    ),
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1950),
                      lastDate: DateTime.now());

                  if (pickedDate != null) {
                    String formattedDate =
                        DateFormat('yyyy-MM-dd').format(pickedDate);
                    readersController.joinDate.text =
                        formattedDate; //set output date to TextField value.
                  } else {}
                },
              ),
            ),
            //leave date
            const RadioButtonGroup(),
            // submit
            const SizedBox(
              height: 30,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState!.validate()) {
                    // successful snackbar
                    try {
                      await databaseController.insertReader(
                        readerName: readersController.readerName.text,
                        tabNo: int.parse(readersController.tabNo.text),
                        id1: readersController.id1.text,
                        id2: readersController.id2.text,
                        joinDate: readersController.joinDate.text,
                        phoneNo: int.parse(readersController.phoneNo.text),
                        currentlyWorking:
                            readersController.currentlyWorking.value,
                        leaveDate: readersController.leaveDate.text,
                        leaveReason: readersController.leaveReason.text,
                      );
                    } catch (e) {
                      Get.defaultDialog(
                          title: 'فشلت الإضافة', middleText: e.toString());
                    }
                  }
                },
                child: const Text('Submit'),
              ),
            ),
          ],
        )),
  );
}
