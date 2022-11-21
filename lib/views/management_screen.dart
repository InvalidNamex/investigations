import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:investigations/constants.dart';
import 'package:get/get.dart';
import 'dart:io';
class ManagementScreen extends StatelessWidget {
  const ManagementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
    usersController.userOptions >2?
    const Center(child:
        Text('صلاحيات الإدارة محجوبة لهذا الحساب', style: TextStyle(fontFamily: 'almarai', fontWeight: FontWeight.bold))
      ):
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children:  [
                  Row(children: [
                    const Text('تحديد صلاحيات الحسابات:', style: TextStyle(fontFamily: 'almarai', fontWeight: FontWeight.bold,),),
                    // user name
                    Obx(
                          ()=> Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 300,
                          child:
                          DropDownTextField(
                            controller: usersController.loginUserName,
                            clearOption: false,
                            textFieldFocusNode: usersController.textFieldFocusNode,
                            searchFocusNode: usersController.searchFocusNode,
                            // searchAutofocus: true,
                            dropDownItemCount: 8,
                            searchShowCursor: false,
                            enableSearch: true,
                            searchKeyboardType: TextInputType.number,
                            clearIconProperty: IconProperty(color: Theme.of(context).primaryColor),
                            searchDecoration: const InputDecoration(
                                hintText: "اسم المستخدم"),
                            validator: (value) {
                              if (value == null) {
                                return "حقل فارغ";
                              } else {
                                return null;
                              }
                            },
                            dropDownList: usersController.usersList.value,
                            onChanged: (val)async{
                              var _r = await databaseController.conn.query("select image from users where userName = ?", [val.name]);
                              usersController.newFile = File(_r.first['image']);
                              usersController.isImageLoaded.value = true;
                            },
                          ),
                        ),
                      ),

                    ),
                    // user options
                     Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 300,
                          child:
                          DropDownTextField(
                            controller: managementController.usersOptions,
                            clearOption: false,
                            textFieldFocusNode: usersController.textFieldFocusNode,
                            searchFocusNode: usersController.searchFocusNode,
                            dropDownItemCount: 5,
                            searchShowCursor: false,
                            clearIconProperty: IconProperty(color: Theme.of(context).primaryColor),
                            validator: (value) {
                              if (value == null) {
                                return "حقل فارغ";
                              } else {
                                return null;
                              }
                            },
                            dropDownList: const [
                              DropDownValueModel(name: 'مدير', value: 2),
                              DropDownValueModel(name: 'مسئول', value: 3),
                              DropDownValueModel(name: 'مشرف', value: 4),
                              DropDownValueModel(name: 'مستخدم', value: 5),
                            ],
                            onChanged: (val)async{
                             //val.name
                              await databaseController.conn.query("update users set options = ? where userName = ?", [val.value, val.name]);
                            },
                          ),
                        ),
                      ),
                  ],)
                ],
              ),
            ),
      )
    ;
  }
}
