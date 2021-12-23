import 'package:flutter/material.dart';
import 'package:jsonliste/models/haber_model.dart';

class UygulamaHakkinda extends StatefulWidget {
  @override
  _UygulamaHakkindaState createState() => _UygulamaHakkindaState();
}

class _UygulamaHakkindaState extends State<UygulamaHakkinda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromRGBO(0, 83, 159, 1),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("Antep Savunması Harp Günlüğü"),
          ],
        ),
      ),
      body: Padding(
        padding:
            EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0, bottom: 20.0),
        child: Column(
          children: [
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset(
                  "assest/hakkinda.jpg",
                ),
              ),
            ),
            new Divider(),
            Title(
              color: Colors.white,
              child: Text(
                "Gaziantep Savunması Harp Günlüğü \nMobil Uygulaması",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            new Divider(),
            Text(
                "Gaziantep'in düşman işgalinden kurtuluşunun 100. yılında Şehitkamil Belediyesi'nin Gaziantep halkına armağanıdır.",
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w300,
                  fontStyle: FontStyle.normal,
                  height: 1.5,
                )),
          ],
        ),
      ),
    );
  }
}
