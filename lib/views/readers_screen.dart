import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:investigations/constants.dart';

class ReadersScreen extends StatelessWidget {
  const ReadersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    List tiles = [
      ['اضافة', const Icon(Icons.add), () {}],
      ['تعديل', const Icon(Icons.edit), () {}],
    ];
    return Row(
      children: [
        Container(
            width: MediaQuery.of(context).size.width * 0.25,
            height: MediaQuery.of(context).size.height,
            color: Colors.blueGrey,
            child: ListView.builder(
              itemBuilder: (context, index) => Obx(
                () => Container(
                  color: index == homeController.selectedIndex.value ? Colors.white : null,
                  child: ListTile(
                      title: Text(
                        tiles[index][0],
                        style: const TextStyle(fontFamily: 'almarai', fontWeight: FontWeight.bold),
                      ),
                      leading: tiles[index][1],
                      autofocus: homeController.selectedIndex.value == 0 ? true : false,
                      selectedColor: Theme.of(context).primaryColor,
                      selectedTileColor: Theme.of(context).primaryColor,
                      textColor: Colors.black54,
                      selected: index == homeController.selectedIndex.value,
                      onTap: () {
                        homeController.selectedIndex.value = index;
                        tiles[index][2];
                      }),
                ),
              ),
              itemCount: tiles.length,
            )),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.75,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 300,
                      child: TextFormField(
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
                    SizedBox(
                      width: 300,
                      child: TextField(
                        controller: homeController.dob,
                        decoration: const InputDecoration(
                            icon: Icon(Icons.calendar_today), //icon of text field
                            labelText: "Enter Date" //label text of field
                            ),
                        readOnly: true,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context, initialDate: DateTime.now(), firstDate: DateTime(1950), lastDate: DateTime.now());

                          if (pickedDate != null) {
                            String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                            print(formattedDate); //formatted date output using intl package =>  2021-03-16
                            homeController.dob.text = formattedDate; //set output date to TextField value.
                          } else {}
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
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
          ),
        )
      ],
    );
  }
}
