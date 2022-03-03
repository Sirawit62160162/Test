import 'package:mysql1/mysql1.dart';

// ดึงข้อมูล
class Mysql{
  /* 
    === Test Data ===   
      -> host                                     <output เมื่อใช้ port 3306>
          - localhost                               - Connection refused, errno = 111, address = localhost, port = 56278
          - secamp.informatics.buu.ac.th            - Failed host lookup: 'secamp.informatics.buu.ac.th', errno = 7
          - 10.80.6.161                             - ไม่มีการแสดงผล หน้า cmd หยุดนิ่งไป จนกระทั่ง timeout, host: 10.80.6.161, port: 3306
      -> port 
          - 80
          - 8000
          - 8080
          - 3306  <default MySQL port number>
  */

  // ทดลองเชื่อมต่อ Database
  Future<MySqlConnection> getConnection() async {
    var setting = new ConnectionSettings(
      host: '10.80.6.161',          // ชื่อ hostname:   ? <ไม่รู้>
      port: 3306,                   // หมายเลข port:  3306 <ไม่แน่ใจ>
      user: 'team5',                // ชื่อ username:   team5
      password: 'team5@2021',       // รหัส password:  team5@2021
      db: 'team5'                   // ชื่อฐานข้อมูล:     team5
    );
    return await MySqlConnection.connect(setting); // connection called
  }
}