import 'package:flutter/material.dart';
import 'package:layoutapp/connectdb/mysql.dart';

// stateful
class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

// stateful content
class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ทดลอง"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: FutureBuilder(
            builder: (context, AsyncSnapshot snapshot) {
              // var data = json.decode(snapshot.data.toString());
              return Container(
                child: Text("ทดลองเชื่อมต่อฐานข้อมูล"),
              ); // จํานวนชุดข้อมูลที่ดึงมาได้
            },
            // future: DefaultAssetBundle.of(context).loadString('assets/data.json'),
            future: getData(), // ขั้นตอนที่ 1
          )),
    );
  }
}

// ดึงข้อมูล
Future getData() async {
  print("Hello World");

  // start connection with database
  var db = new Mysql();

  // connection called
  db.getConnection().then((conn) async { 
      var results = await conn.query('select * from brs_notice');
      for (var row in results) {
        print('${row[0]}');
      }
  });
}
