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
      ['عرض وتعديل'
          '', const Icon(Icons.edit), () {}],
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
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // image
                      Center(
                        child: Column(children: [
                          Image.asset('assets/images/profile.webp', fit: BoxFit.contain, width: 100, height: 150,),
                          ElevatedButton(onPressed: ()async{await homeController.imagePicker();}, child: const Text('إضافة صورة'),),
                        ],),
                      ),
                      // reader name
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 300,
                          child: TextFormField(
                            controller: homeController.readerName,
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
                            controller: homeController.phoneNo,
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
                            controller: homeController.tabNo,
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
                          controller: homeController.joinDate,
                          decoration: const InputDecoration(
                              icon: Icon(Icons.calendar_today), //icon of text field
                              labelText: "تاريخ الالتحاق" //label text of field
                              ),
                          readOnly: true,
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context, initialDate: DateTime.now(), firstDate: DateTime(1950), lastDate: DateTime.now());

                            if (pickedDate != null) {
                              String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                              homeController.joinDate.text = formattedDate; //set output date to TextField value.
                            } else {}
                          },

                        ),
                      ),
                      //leave date
                      SizedBox(
                        width: 300,
                        child: TextField(
                          controller: homeController.leaveDate,
                          decoration: const InputDecoration(
                              icon: Icon(Icons.calendar_today), //icon of text field
                              labelText: "تاريخ المغادرة" //label text of field
                          ),
                          readOnly: true,
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context, initialDate: DateTime.now(), firstDate: DateTime(1950), lastDate: DateTime.now());

                            if (pickedDate != null) {
                              String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                              homeController.leaveDate.text = formattedDate; //set output date to TextField value.
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
                          onPressed: ()async{
                            // Validate returns true if the form is valid, or false otherwise.
                            if (_formKey.currentState!.validate()){
                              // successful snackbar
                              await databaseController.insertReader(readerName: homeController.readerName.text,tabNo: int.parse(homeController.tabNo.text),image: homeController.image.text ,joinDate: homeController.joinDate.text,phoneNo: int.parse(homeController.phoneNo.text));

                            }
                          },
                          child: const Text('Submit'),
                        ),
                      ),
                    ],
                  ),
                )),
          ),
        )
      ],
    );
  }
}

//areas
// Padding(padding: const EdgeInsets.all(8), child:
// InkWell(onTap: (){}, child: Container(width:150, decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), border: Border.all(color:Theme.of(context).primaryColor,)), child: Padding(
// padding: const EdgeInsets.all(8.0),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: const [Icon(Icons.maps_home_work), Text('إضافة مناطق')],),
// )),),),