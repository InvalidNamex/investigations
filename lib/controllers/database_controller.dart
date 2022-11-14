import 'package:get/get.dart';
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

  @override
  void onInit()async {
    await initiateDatabase();
    super.onInit();
  }
}