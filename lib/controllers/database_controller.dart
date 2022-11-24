import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:get/get.dart';
import 'package:investigations/constants.dart';
import 'package:mysql1/mysql1.dart';

class DatabaseController extends GetxController {
  static DatabaseController instance = Get.find();
  var conn;
  var settings = ConnectionSettings(
      host: 'localhost',
      port: 3316,
      user: 'root',
      password: '36553203605771Xm@N',
      db: 'investigations');
  bool checkConn = false;
  initiateDatabase() async {
    try {
      conn = await MySqlConnection.connect(settings);
      checkConn = true;
    } catch (e) {
      print('no connection');
    }
  }

  insertReader(
      {required String readerName,
      required int tabNo,
      required bool currentlyWorking,
      String? joinDate,
      String? leaveDate,
      String? id1,
      String? id2,
      String? leaveReason,
      int? phoneNo}) async {
    var result = await conn.query(
        'insert into readers (readerName, tabNo, joinDate, leaveDate, leaveReason, currentlyWorking, id1, id2, phoneNo) values (?, ?, ?, ?, ?, ?, ?, ?, ?)',
        [
          readerName,
          tabNo,
          joinDate,
          leaveDate,
          leaveReason,
          currentlyWorking,
          id1,
          id2,
          phoneNo,
        ]);
  }

  registerUser(
      {required String userName,
      required String userPassword,
      String? image,
      int options = 5}) async {
    try {
      var result = await conn.query(
          'insert into users (userName, password, image, options) values (?,?,?,?)',
          [userName, userPassword, image, options]);
      Get.defaultDialog(
          title: 'محاولة ناجحة', middleText: 'تمت إضافة المستخدم بنجاح');
      await databaseController.populateUsersList();
      Future.delayed(const Duration(seconds: 1), () => Get.toNamed('/'));
    } catch (e) {
      Get.defaultDialog(title: 'حدث خطأ', middleText: e.toString());
    }
  }

  Future populateUsersList() async {
    if (checkConn) {
      var n = await conn.query('select userName from users');
      usersController.usersList.clear();
      for (var row in n) {
        if (row[0] != 'root') {
          usersController.usersList
              .add(DropDownValueModel(name: row[0], value: row[0]));
        }
      }
    }
  }

  Future loginCheck(
      {required String userName, required String password}) async {
    var d =
        await conn.query("select * from users where userName = ?", [userName]);
    if (d.first['password'] == password) {
      usersController.userOptions = d.first['options'];
      return true;
    } else {
      Get.snackbar('حدث خطأ', 'كلمة مرور غير صحيحة',
          snackPosition: SnackPosition.BOTTOM);
      false;
    }
  }

  @override
  void onInit() async {
    await initiateDatabase();
    super.onInit();
  }

  @override
  void onReady() async {
    await populateUsersList();
    // TODO: implement onReady
    super.onReady();
  }
}
