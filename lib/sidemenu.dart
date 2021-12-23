import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jsonliste/hepsi.dart';
import 'package:jsonliste/jsonanasayfa.dart';
import 'package:jsonliste/arama.dart';
import 'package:jsonliste/hakkinda.dart';
import '1918.dart';
import 'package:jsonliste/1919.dart';
import 'package:jsonliste/1920.dart';
import 'package:jsonliste/1921.dart';
import 'olaylar.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: new ListView(
        children: <Widget>[
          new DrawerHeader(
            child: Text(
              'ANTEP SAVUNMASI \nHARP GÜNLÜĞÜ',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
            ),
            decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                    image: AssetImage("assest/side_header.jpg"),
                    fit: BoxFit.cover)),
          ),
          new ListTile(
            title: new Text('Anasayfa'),
            leading: new Icon(Icons.date_range_outlined),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          ),
          new ListTile(
            title: new Text('1918'),
            leading: new Icon(Icons.date_range_outlined),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Onsekiz()),
              );
            },
          ),
          new ListTile(
              title: new Text('1919'),
              leading: new Icon(Icons.date_range_outlined),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Ondokuz()),
                );
              }),
          new ListTile(
            title: new Text('1920'),
            leading: new Icon(Icons.date_range_outlined),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Yirmi()),
              );
            },
          ),
          new ListTile(
            title: new Text('1921'),
            leading: new Icon(Icons.date_range_outlined),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Yirmibir()),
              );
            },
          ),
          new ListTile(
            title: new Text('Olaylar'),
            leading: new Icon(Icons.date_range_outlined),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Olaylar()),
              );
            },
          ),
          new Divider(),
          new ListTile(
            title: new Text('Arama'),
            leading: new Icon(Icons.search),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AramaSayfasi()),
              );
            },
          ),
          new Divider(),
          new ListTile(
            title: new Text('Uygulama Hakkında'),
            leading: new Icon(Icons.info),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UygulamaHakkinda()),
              );
            },
          ),
          new Divider(),
          new ListTile(
            title: new Text("Çıkış"),
            leading: new Icon(Icons.exit_to_app),
            onTap: () {
              exit(0);
            },
          )
        ],
      ),
    );
  }
}
