import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

Widget addSupervisor(context) {
  final _formKey = GlobalKey<FormState>();
  return SingleChildScrollView(
    child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // supervisor name
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 300,
                child: TextFormField(
                  controller: supervisorController.supervisorName,
                  maxLines: 1,
                  textAlign: TextAlign.right,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'اسم المشرف',
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
                  controller: supervisorController.supervisorPhoneNo,
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
            // add reader
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 150,
                child: DropDownTextField(
                  controller: supervisorController.reader,
                  clearOption: false,
                  textFieldFocusNode: supervisorController.textFieldFocusNode,
                  searchFocusNode: supervisorController.searchFocusNode,
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
            // readers list
            supervisorController.readers.isEmpty
                ? const SizedBox()
                : SizedBox(
                    height: 300,
                    child: ListView.builder(
                      itemBuilder: (context, index) =>
                          ListTile(title: supervisorController.readers[index]),
                      shrinkWrap: true,
                    ),
                  ),
            // submit
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Center(
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
            ),
          ],
        )),
  );
}
