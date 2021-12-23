import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'models/haber_model.dart';

class Liste2 extends StatefulWidget {
  @override
  _Liste2State createState() => _Liste2State();
}

class _Liste2State extends State<Liste2> {
  Future<List<HaberModel>> _gonderiGetir() async {
    final jobsListAPIUrl =
        'http://antepsavunmasi.com/harpgunlugu/json-app/results.json';
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
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        Expanded(
          child: FutureBuilder(
              future: _gonderiGetir(),
              initialData: [],
              builder: (context, snapshot) {
                return createCountriesListView(context, snapshot);
              }),
        ),
        Divider(
          height: 20,
        ),
        Expanded(
          child: FutureBuilder(
              future: _gonderiGetir(),
              initialData: [],
              builder: (context, snapshot) {
                return createRegionsListView(context, snapshot);
              }),
        ),
      ]),
    );
  }

  Widget createRegionsListView(BuildContext context, AsyncSnapshot snapshot) {
    var values = snapshot.data;
    return ListView.builder(
      itemCount: values.length,
      itemBuilder: (BuildContext context, int index) {
        return values.isNotEmpty
            ? Card(
                child: ListTile(
                  title: Text(snapshot.data[index].tarih),
                  subtitle: Text(snapshot.data[index].hicri.toString()),
                  leading: Text(snapshot.data[index].yil.toString()),
                ),
              )
            : CircularProgressIndicator();
      },
    );
  }

  Widget createCountriesListView(BuildContext context, AsyncSnapshot snapshot) {
    var values = snapshot.data;
    return ListView.builder(
      itemCount: values == null ? 0 : values.length,
      itemBuilder: (BuildContext context, int index) {
        return values.isNotEmpty
            ? Card(
                child: ListTile(
                  title: Text(snapshot.data[index].tarih),
                  subtitle: Text(snapshot.data[index].hicri.toString()),
                  leading: Text(snapshot.data[index].yil.toString()),
                ),
              )
            : CircularProgressIndicator();
      },
    );
  }
}
