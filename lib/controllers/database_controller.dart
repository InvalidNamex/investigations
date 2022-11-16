import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:get/get.dart';
import 'package:investigations/constants.dart';
import 'package:mysql1/mysql1.dart';

import '../models/reader_model.dart';
class DatabaseController extends GetxController {
  static DatabaseController instance = Get.find();
  var conn;
  var settings = ConnectionSettings(
      host: 'localhost',
      port: 3316,
      user: 'root',
      password: '36553203605771Xm@N',
      db: 'investigations'
  );
  initiateDatabase ()async{
     conn = await MySqlConnection.connect(settings);
  }
  insertReader({required String readerName,required int tabNo, int? investigations,int? penalties, String? joinDate, String? leaveDate, String? image, int? phoneNo})async{
    var result = await conn.query('insert into readers (readerName, tabNo, investigations, penalties, joinDate, leaveDate, image, phoneNo) values (?, ?, ?, ?, ?, ?, ?, ?)', [readerName, tabNo, investigations, penalties, joinDate, leaveDate, image, phoneNo]);
    // print("New user's id: ${result.tabNo}");
  }
  registerUser({required String userName,required String userPassword, String? image, int options = 5})async{
    try {
      var result = await conn.query(
          'insert into users (userName, password, image, options) values (?,?,?,?)',
          [userName, userPassword, image, options]);
      Get.defaultDialog(
        title: 'محاولة ناجحة',
        middleText: 'تمت إضافة المستخدم بنجاح'
      );
      Future.delayed(const Duration(seconds: 1), ()=>Get.toNamed('/'));
    } catch(e){
      Get.defaultDialog(
        title: 'حدث خطأ',
        middleText: e.toString()
      );
    }
  }
  Future populateUsersList()async{
    var n = await conn.query(
        'select userName from users');
    for (var row in n) {
      if (row[0] != 'root'){
        usersController.usersList.add(DropDownValueModel(name: row[0], value: row[0]));
      }
    }
  }
  Future loginCheck({required String userName, required String password})async{
    var d = await conn.query("select password from users where userName = ?", [userName]);
    if(d.first['password']==password){return true;}else{false;}
  }
  @override
  void onInit()async {
    await initiateDatabase();
    super.onInit();
  }
  @override
  void onReady()async{
    await populateUsersList();
    // TODO: implement onReady
    super.onReady();
  }
}
