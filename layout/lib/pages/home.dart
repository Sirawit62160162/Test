import 'dart:convert';
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:layoutapp/pages/detail.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

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
        title: Text("Movies"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: FutureBuilder(
            builder: (context, AsyncSnapshot snapshot) {
              // var data = json.decode(snapshot.data.toString());
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  // ชื่อต้องตรงกับชื่อข้อมูล
                  return MyBox( // ขั้นตอนที่ 2
                      snapshot.data[index]['title'],
                      snapshot.data[index]['description'],
                      snapshot.data[index]['image_url'],
                      snapshot.data[index]['detail'],
                      context);
                },
                itemCount: snapshot.data.length, // จํานวนชุดข้อมูลที่ดึงมาได้
              );
            },
            // future: DefaultAssetBundle.of(context).loadString('assets/data.json'),
            future: getData(), // ขั้นตอนที่ 1
          )),
    );
  }
}

// แสดงข้อมูลที่ดึงมาได้
Widget MyBox(String title, String description, String image_url, String detail, context) {
  var v1, v2, v3, v4; // จํานวนตัวแปร = จํานวนพารามิเตอร์
  v1 = title;
  v2 = description;
  v3 = image_url;
  v4 = detail;

  return Container( // สร้างกล่อง
    // color: Colors.limeAccent,
    height: 230,
    padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
    margin: EdgeInsets.only(
      top: 20,
      left: 15,
      right: 15,
    ),
    // ตกแต่งกล่อง
    decoration: BoxDecoration(
        color: Colors.blueGrey[600],
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
            image: NetworkImage(image_url),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.25), BlendMode.darken))
    ),
    // แสดงข้อมูลในกล่อง
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title, // title จากข้อมูล
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.blue[700]),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          description, // description จากข้อมูล
          style: TextStyle(fontSize: 20, color: Colors.brown[700]),
        ),
        SizedBox(
          height: 10,
        ),
        // ปุ่มกดไปหน้า detail.dart
        TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Detailpage(v1, v2, v3, v4))); // ส่งตัวแปรที่ต้องการให้แสดงในอีกหน้า
            },
            child: Text("Next Page >>")
        ),
      ],
    ),
  );
}

// ดึงข้อมูล
Future getData() async {
  var url = Uri.https(
      'raw.githubusercontent.com', '/Sirawit62160162/BasicAPI/main/data.json');
  var response = await http.get(url);
  var result = json.decode(response.body);
  return result;
}
