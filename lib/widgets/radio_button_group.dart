import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:investigations/constants.dart';

enum SingingCharacter { working, notWorking }

class RadioButtonGroup extends StatefulWidget {
  const RadioButtonGroup({super.key});

  @override
  State<RadioButtonGroup> createState() => _RadioButtonGroupState();
}

class _RadioButtonGroupState extends State<RadioButtonGroup> {
  SingingCharacter? _character = SingingCharacter.working;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          height: 50,
          width: 200,
          child: ListTile(
            title: const Text('بالعمل'),
            leading: Radio<SingingCharacter>(
              value: SingingCharacter.working,
              groupValue: _character,
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                  readersController.currentlyWorking.value = true;
                });
              },
            ),
          ),
        ),
        SizedBox(
          height: 50,
          width: 200,
          child: ListTile(
            title: const Text('خارج العمل'),
            leading: Radio<SingingCharacter>(
              value: SingingCharacter.notWorking,
              groupValue: _character,
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                  readersController.currentlyWorking.value = false;
                  Get.defaultDialog(
                    title: 'تاريخ المغادرة',
                    content: Column(
                      children: [
                        SizedBox(
                          width: 300,
                          child: TextField(
                            controller: readersController.leaveDate,
                            decoration: const InputDecoration(
                                icon: Icon(
                                    Icons.calendar_today), //icon of text field
                                labelText:
                                    "تاريخ المغادرة" //label text of field
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
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: 300,
                              child: TextFormField(
                                controller: readersController.leaveReason,
                                maxLines: 2,
                                textAlign: TextAlign.right,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'سبب المغادرة',
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
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                              onPressed: () => Get.back(),
                              child: const Text('حفظ')),
                        )
                      ],
                    ),
                  );
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
