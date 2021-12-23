import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'models/haber_model.dart';
import 'sidemenu.dart';
import 'bottommenu.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

final List<String> imgList = [
  'assest/anasayfa1.jpg',
  'assest/anasayfa2.jpg',
  'assest/anasayfa3.jpg',
  'assest/anasayfa4.jpg',
  'assest/anasayfa5.jpg',
];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      title: "Antep Savunması Harp Günlüğü",
      home: EskiHomePage(),
    );
  }
}

class EskiHomePage extends StatefulWidget {
  @override
  _EskiHomePageState createState() => _EskiHomePageState();
}

class _EskiHomePageState extends State<EskiHomePage> {
  Future<List<HaberModel>> _gonderiGetir() async {
    final jobsListAPIUrl =
        'https://antepsavunmasi.com/harpgunlugu/json-app/1918.json';
    var response = await http.get(jobsListAPIUrl);
    if (response.statusCode == 200) {
      var decoded = json.decode(response.body);
      return (decoded as List)
          .map((tekGonderiMap) => HaberModel.fromJson(tekGonderiMap))
          .toList();
    } else {
      throw Exception("Baglanamadık ${response.statusCode}");
    }
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    return MaterialApp(
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      title: "Harp Günlüğü",
      home: Scaffold(
        extendBody: true,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color.fromRGBO(0, 83, 159, 1),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("Harp Günlüğü"),
            ],
          ),
        ),
        drawer: MyDrawer(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: MyAltMenu(),
        floatingActionButton: Container(
          height: 65.0,
          width: 65.0,
          child: FittedBox(
            child: FloatingActionButton(
              backgroundColor: Color.fromRGBO(0, 83, 159, 1),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EskiHomePage()),
                );
              },
              child: Icon(
                Icons.home_outlined,
                color: Colors.white,
              ),
              // elevation: 5.0,
            ),
          ),
        ),
        body: Stack(
          children: <Widget>[
            Container(
              child: (CarouselSlider(
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height,
                  viewportFraction: 1.0,
                  enlargeCenterPage: false,
                  autoPlay: true,
                ),
                items: imgList
                    .map(
                      (item) => Container(
                        child: Center(
                          child: Image.asset(
                            item,
                            fit: BoxFit.cover,
                            height: MediaQuery.of(context).size.height,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              )),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 50.0),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Icon(
                    Icons.date_range,
                    color: Colors.white,
                    size: 30.0,
                  ),
                ),
                Container(
                  width: 90.0,
                  child: new Divider(color: Colors.white),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    "20 Kasım 1918",
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.white, fontSize: 25.0),
                  ),
                ),
                SizedBox(height: 5.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 6,
                      child: Padding(
                          padding: EdgeInsets.only(left: 15.0, bottom: 5),
                          child: Text(
                            "15 Sefer 1337",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          )),
                    ),
                  ],
                ),
                Container(
                  width: 90.0,
                  child: new Divider(color: Colors.white),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 6,
                      child: Padding(
                        padding: EdgeInsets.only(left: 15, top: 5, right: 10),
                        child: Text(
                          "Antep’in Direnişi İçin Silah Desteği",
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                  ],
                ),
                RaisedButton.icon(
                  textColor: Colors.white,
                  color: Colors.transparent,
                  onPressed: () {
                    debugPrint("Butana basıldı");
                  },
                  icon: Icon(Icons.keyboard_arrow_right_outlined, size: 18),
                  label: Text("Güne Git"),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
