import 'package:flutter/services.dart';
import 'package:jsonliste/models/haber_model.dart';
import 'package:flutter/material.dart';
import 'models/haber_model.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:share/share.dart';

class HaberDetay extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final HaberModel haber_detay;

  // ignore: non_constant_identifier_names
  HaberDetay({Key key, this.haber_detay}) : super(key: key);
  Future<List<HaberModel>> _gonderiGetir() async {
    final jobsListAPIUrl =
        'https://antepsavunmasi.com/harpgunlugu/json-app/results.json';
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
    SystemChrome.setEnabledSystemUIOverlays([]);
    final topContentText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 120.0),
        Icon(
          Icons.date_range,
          color: Colors.white,
          size: 30.0,
        ),
        Container(
          width: 90.0,
          child: new Divider(color: Colors.white),
        ),
        SizedBox(height: 10.0),
        Text(
          haber_detay.tarih,
          style: TextStyle(color: Colors.white, fontSize: 35.0),
        ),
        SizedBox(height: 5.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 6,
              child: Padding(
                  padding: EdgeInsets.only(left: 5.0),
                  child: Text(
                    haber_detay.hicri,
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )),
            ),
          ],
        ),
      ],
    );

    final topContent = Stack(
      children: <Widget>[
        Container(
            padding: EdgeInsets.only(left: 10.0),
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: NetworkImage(haber_detay.resimyol),
                fit: BoxFit.cover,
              ),
            )),
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: EdgeInsets.all(40.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Color.fromRGBO(0, 83, 159, .65)),
          child: Center(
            child: topContentText,
          ),
        ),
        Positioned(
          left: 8.0,
          top: 60.0,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, color: Colors.white),
          ),
        ),
        Positioned(
          right: 8.0,
          top: 60.0,
          child: IconButton(
            color: Colors.transparent,
            icon: Icon(
              Icons.share_outlined,
              color: Colors.white,
            ),
            onPressed: () {
              final RenderBox box = context.findRenderObject();
              Share.share(
                  "Antep Savunması'nda bugün ne oldu?\n" +
                      haber_detay.tarih +
                      "\nAntep Savunması Harp Günlüğü Uygulama Linki: linkburayagelir.",
                  subject: 'Antep Savunması Harp Günlüğü Uygulaması',
                  sharePositionOrigin:
                      box.localToGlobal(Offset.zero) & box.size);
            },
          ),
        ),
      ],
    );

    final bottomContentText = Text(
      haber_detay.detay,
      style: TextStyle(fontSize: 17.0),
    );
    final baslik = Text(haber_detay.ad,
        style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w900));

    final bottomContent = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(30.0),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[baslik, new Divider(), bottomContentText],
        ),
      ),
    );

    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: true,
      body: new Center(
        child: new SingleChildScrollView(
            child: new Container(
          child: Column(
            children: [
              topContent,
              //Text(haber_detay.id), //Her habere özel id
              bottomContent,
              Padding(
                padding: EdgeInsets.only(left: 5.0, bottom: 40.0, right: 5.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(haber_detay.resimyol,
                      width: 350, fit: BoxFit.fitWidth),
                ),
              ),
              Wrap(children: [
                FlatButton(
                    textColor: Colors.white,
                    color: Colors.transparent,
                    onPressed: () {
                      print("Butona 1 Kez Tıklandı");
                    },
                    padding: EdgeInsets.all(10),
                    child: Wrap(
                      children: <Widget>[
                        Icon(Icons.navigate_before),
                        Text("Önceki Gün", style: TextStyle(fontSize: 20)),
                      ],
                    )),
                FlatButton(
                    textColor: Colors.white,
                    color: Colors.transparent,
                    onPressed: () {
                      print("Butona 1 Kez Tıklandı");
                    },
                    padding: EdgeInsets.all(10),
                    child: Wrap(
                      children: <Widget>[
                        Text("Sonraki Gün", style: TextStyle(fontSize: 20)),
                        Icon(Icons.navigate_next)
                      ],
                    )),
              ])
            ],
          ),
        )),
      ),
    );
  }
}
