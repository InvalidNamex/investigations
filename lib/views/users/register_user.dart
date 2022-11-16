import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants.dart';

class UserRegister extends StatelessWidget {
  const UserRegister({Key? key}) : super(key: key);

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
                const Text('مستخدم جديد', style: TextStyle(color: Colors.blue, fontSize: 24, fontFamily: 'almarai', fontWeight: FontWeight.bold),),
                // images
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Column(children: [
                      Obx(()=>
                      usersController.isImageLoaded.value?
                      Image.file(usersController.newFile, fit: BoxFit.contain, width: 100, height: 150,):
                      Image.asset('assets/images/profile.webp', fit: BoxFit.contain, width: 100, height: 150,)
                      ),
                      ElevatedButton(onPressed: ()async{await usersController.imagePicker();}, child: const Text('إضافة صورة'),),
                    ],),
                  ),
                ),
                // user name
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 300,
                    child: TextFormField(
                      controller: usersController.userName,
                      maxLines: 1,
                      textAlign: TextAlign.right,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'اسم المستخدم',
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
                // user password
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 300,
                    child: TextFormField(
                      controller: usersController.userPassword,
                      obscureText: true,
                      maxLines: 1,
                      textAlign: TextAlign.right,
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
                // re-enter password
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 300,
                    child: TextFormField(
                      controller: usersController.userPassword2,
                      obscureText: true,
                      maxLines: 1,
                      textAlign: TextAlign.right,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'أعد كتابة كلمة المرور',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty || usersController.userPassword.text != usersController.userPassword2.text) {
                          return 'كلمة مرور غير متطابقة';
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
                        // successful snackbar
                        await databaseController.registerUser(userName: usersController.userName.text, userPassword: usersController.userPassword.text, image: usersController.userImage.text);
                      }
                    },
                    child: const Text('انشاء حساب'),
                  ),
                ),
                const Expanded(child: SizedBox()),
                InkWell(onTap: (){
                  Get.toNamed("/");
                }, child: const Text('تسجيل دخول؟', style: TextStyle(color: Colors.blue, fontSize: 16, fontFamily: 'almarai', fontWeight: FontWeight.bold),),),
                const SizedBox(height: 20,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
