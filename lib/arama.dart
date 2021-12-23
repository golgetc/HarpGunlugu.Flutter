import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jsonliste/hepsi.dart';
import 'detay2.dart';
import 'models/haber_model.dart';

class AramaSayfasi extends StatefulWidget {
  @override
  _AramaSayfasiState createState() => _AramaSayfasiState();
}

class _AramaSayfasiState extends State<AramaSayfasi> {
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

  double width = 500;

  var _searchEdit = new TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  _search() {
    if (_searchEdit.text.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Hepsi(searchText: _searchEdit.text)),
      );
    } else {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Uyarı"),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Text("Aramak için birşeyler yazın."),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Arama"),
      ),
      body: new Container(
        margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
        child: new Column(
          children: <Widget>[_searchBox(), _searchButton()],
        ),
      ),
    );
  }

  Widget _searchBox() {
    return new Container(
      decoration: BoxDecoration(border: Border.all(width: 1.0)),
      child: new TextField(
        controller: _searchEdit,
        decoration: InputDecoration(
          hintText: "Ara...",
          hintStyle: new TextStyle(color: Colors.grey[300]),
          contentPadding: EdgeInsets.all(10)
        )
      ),
    );
  }

  Widget _searchButton() {
    return ButtonTheme(
      minWidth: width,
      child: RaisedButton(
        onPressed: () {
          _search();
        },
        child: Text("ARA"),
      ),
    );
  }
}
