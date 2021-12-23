import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jsonliste/detay2.dart';
import 'package:jsonliste/models/haber_model.dart';
import 'arama.dart';
import 'sidemenu.dart';
import 'jsonanasayfa.dart';
import 'bottommenu.dart';

class Hepsi extends StatefulWidget {
  final String searchText;
  Hepsi({Key key, this.searchText}) : super(key: key);

  @override
  _ListeState createState() => _ListeState();
}

class _ListeState extends State<Hepsi> {
  Future<List<HaberModel>> _gonderiGetir() async {
    final jobsListAPIUrl =
        'https://antepsavunmasi.com/harpgunlugu/json-app/hepsi.json';
    var response = await http.get(jobsListAPIUrl);
    if (response.statusCode == 200) {
      var decoded = json.decode(response.body);
      var _list = (decoded as List)
          .map((tekGonderiMap) => HaberModel.fromJson(tekGonderiMap))
          .toList();

      var searchText = widget.searchText?.toLowerCase()?.trim();
      if(searchText != null){
        _list = _list.where((element) => element.ad.toLowerCase().contains(searchText) || element.detay.toLowerCase().contains(searchText)).toList();
      }

      return _list;
    } else {
      throw Exception("Baglanamadık ${response.statusCode}");
    }
  }

  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 83, 159, 1),
        title: Center(
            child: Text(
          "Antep Savunması",
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        )),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AramaSayfasi()),
                );
              }),
        ],
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
                MaterialPageRoute(builder: (context) => HomePage()),
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
      body: FutureBuilder(
          future: _gonderiGetir(),
          builder:
              (BuildContext context, AsyncSnapshot<List<HaberModel>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HaberDetay(
                                        haber_detay: snapshot.data[index])));
                          },
                          title: Text(snapshot.data[index].tarih),
                          subtitle: Text(snapshot.data[index].hicri.toString()),
                          leading: CircleAvatar(
                            radius: 30.0,
                            backgroundImage: NetworkImage(
                                "${snapshot.data[index].resimyol.toString()}"),
                            backgroundColor: Colors.transparent,
                          )),
                    );
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
