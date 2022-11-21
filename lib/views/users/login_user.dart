import 'dart:io';

import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants.dart';

class UserLogin extends StatelessWidget {
  const UserLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
          child: Container(
            width: 400,
            height: 600,
            decoration: const BoxDecoration(color: Colors.white, borderRadius:  BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
                bottomLeft: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0),),
              boxShadow: [
            BoxShadow(
            color: Colors.grey,
              offset:  Offset(
                  10.0,
                20.0
              ),
              blurRadius: 20.0,
              spreadRadius: 2.0,
            ),],),
            child: Column(
              children: [
                const SizedBox(height: 10,),
                const Text('تسجيل دخول', style: TextStyle(color: Colors.blue, fontSize: 24, fontFamily: 'almarai', fontWeight: FontWeight.bold),),
                // images
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Obx(()=>
                    usersController.isImageLoaded.value?
                    Image.file(usersController.newFile, fit: BoxFit.contain, width: 100, height: 150,):
                    Image.asset('assets/images/profile.webp', fit: BoxFit.contain, width: 100, height: 150,)
                    ),
                  ),
                ),
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
                // user password
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 300,
                    child: TextFormField(
                      controller: usersController.userPassword,
                      maxLines: 1,
                      textAlign: TextAlign.right,
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'كلمة المرور',
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
                // submit
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: ()async{
                      // Validate returns true if the form is valid, or false otherwise.
                      if (_formKey.currentState!.validate()){
                        // check if userName and password match if yes login else snackbar saying that login faild due to incorrect username or password
                        await databaseController.loginCheck(userName: usersController.loginUserName.dropDownValue!.name.toString(), password: usersController.userPassword.text)
                            ?
                        Get.toNamed('home')
                            :
                        Get.defaultDialog(
                          title: 'كلمة مرور',
                          middleText: 'كلمة المرور غير صحيحة'
                        )
                        ;
                      }
                    },
                    child: const Text('تسجيل الدخول'),
                  ),
                ),
                const Expanded(child: SizedBox()),
                InkWell(onTap: (){
                  Get.toNamed("/register");
                }, child: const Text('مستخدم جديد؟', style: TextStyle(color: Colors.blue, fontSize: 16, fontFamily: 'almarai', fontWeight: FontWeight.bold),),),
                const SizedBox(height: 20,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
