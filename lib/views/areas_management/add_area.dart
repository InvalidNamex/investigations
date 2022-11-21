import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../constants.dart';

Widget addArea(context) {
  final _formKey = GlobalKey<FormState>();
  return SingleChildScrollView(
    child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // sector
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 150,
                child: TextFormField(
                  controller: areasController.sector,
                  maxLines: 1,
                  textAlign: TextAlign.right,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'قطاع',
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
            // file
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 150,
                child: TextFormField(
                  controller: areasController.file,
                  maxLines: 1,
                  textAlign: TextAlign.right,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'حافظة',
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
            // areaName
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 150,
                child: TextFormField(
                  controller: areasController.areaName,
                  maxLines: 1,
                  textAlign: TextAlign.right,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'اسم المنطقة',
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
            // reader
            Row(
              children: [
                const Text(
                  'قارئ المنطقة',
                  style: TextStyle(fontFamily: 'almarai', fontSize: 16),
                ),
                const SizedBox(
                  width: 10,
                ),
                Obx(
                  () => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 150,
                      child: DropDownTextField(
                        controller: areasController.reader,
                        clearOption: false,
                        textFieldFocusNode: areasController.textFieldFocusNode,
                        searchFocusNode: areasController.searchFocusNode,
                        // searchAutofocus: true,
                        dropDownItemCount: 10,
                        searchShowCursor: false,
                        enableSearch: true,
                        searchKeyboardType: TextInputType.number,
                        clearIconProperty:
                            IconProperty(color: Theme.of(context).primaryColor),
                        searchDecoration:
                            const InputDecoration(hintText: "اسم القارئ"),
                        validator: (value) {
                          if (value == null) {
                            return "حقل فارغ";
                          } else {
                            return null;
                          }
                        },
                        dropDownList: areasController.readersList.value,
                        onChanged: (val) async {},
                      ),
                    ),
                  ),
                ),
              ],
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
            SizedBox(
              width: 300,
              child: TextField(
                controller: readersController.leaveDate,
                decoration: const InputDecoration(
                    icon: Icon(Icons.calendar_today), //icon of text field
                    labelText: "تاريخ المغادرة" //label text of field
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
                    readersController.leaveDate.text =
                        formattedDate; //set output date to TextField value.
                  } else {}
                },
              ),
            ),
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
                  }
                },
                child: const Text('Submit'),
              ),
            ),
          ],
        )),
  );
}
