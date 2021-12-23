import 'package:flutter/material.dart';
import 'package:jsonliste/models/haber_model.dart';

class HaberDetay extends StatefulWidget {
  // ignore: non_constant_identifier_names
  final HaberModel haber_detay;

  // ignore: non_constant_identifier_names
  HaberDetay({Key key, this.haber_detay}) : super(key: key);

  @override
  _HaberDetayState createState() => _HaberDetayState();
}

class _HaberDetayState extends State<HaberDetay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromRGBO(8, 27, 51, 1),
        title: Center(child: Text(widget.haber_detay.tarih)),
        actions: [
          IconButton(icon: Icon(Icons.favorite), onPressed: () {}),
        ],
      ),
      body: Padding(
        padding:
            EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0, bottom: 20.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.network(
                widget.haber_detay.resimyol,
              ),
            ),
            new Divider(),
            Title(
              color: Colors.white,
              child: Text(
                widget.haber_detay.tarih,
                style: TextStyle(fontSize: 30),
              ),
            ),
            new Divider(),
            new Center(
                child: new SingleChildScrollView(
                    child: new Container(
              child: Column(
                children: [
                  Text(widget.haber_detay.hicri),
                ],
              ),
            ))),
            new Divider(),
            Text(widget.haber_detay.detay,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w300,
                  fontStyle: FontStyle.normal,
                )),
          ],
        ),
      ),
    );
  }
}
