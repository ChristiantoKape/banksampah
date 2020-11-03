import 'dart:convert';
import 'package:bsrb/admin/detail_page.dart';
import 'package:bsrb/admin/form_nabung.dart';
import 'package:bsrb/admin/form_narik.dart';
import 'package:bsrb/home/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:http/http.dart' as http;

import 'package:bsrb/admin/admin_model.dart';

class Admin extends StatefulWidget {
  final String norek;
  Admin({this.norek});
  @override
  _AdminListState createState() => _AdminListState();
}

class _AdminListState extends State<Admin> {
  List<AdminModel> _list = [];
  List<AdminModel> _search = [];
  var loading = false;
  Future<Null> fetchData() async {
    setState(() {
      loading = true;
    });
    _list.clear();
    final response = await http.get("http://bsrb.000webhostapp.com/user.php");
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        for (Map i in data) {
          _list.add(AdminModel.formJson(i));
          loading = false;
        }
      });
    }
  }

  @override
  void initState() {
    fetchData().then((value) {
      setState(() {
        _list.addAll(value);
        _search = _list;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => LoginPage()));
          },
        ),
        title: Text("Daftar Anggota"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return index == 0 ? _searchBar() : _listItem(index - 1);
        },
        itemCount: _search.length + 1,
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        backgroundColor: Colors.blue,
        closeManually: false,
        child: Icon(Icons.menu),
        overlayOpacity: 0.2,
        curve: Curves.easeIn,
        onOpen: () => print("Opening!"),
        onClose: () => print("Colsing!"),
        children: [
          SpeedDialChild(
            child: Icon(Icons.arrow_right_rounded),
            label: "Transaksi Masuk",
            backgroundColor: Colors.blue,
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => FormNabung()));
            },
          ),
          SpeedDialChild(
            child: Icon(Icons.arrow_left_rounded),
            label: "Transaksi Keluar",
            backgroundColor: Colors.blue,
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => FormTarik()));
            },
          )
        ],
      ),
    );
  }

  _searchBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(hintText: 'Search...'),
        onChanged: (text) {
          text = text.toLowerCase();
          setState(() {
            _search = _list.where((note) {
              var noteTitle = note.nama.toLowerCase();
              return noteTitle.contains(text);
            }).toList();
          });
        },
      ),
    );
  }

  _listItem(index) {
    return Card(
        child: ListTile(
      title: Text(_search[index].nama),
      subtitle: Text(_search[index].norek),
      onTap: () {
        Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) => DetailPage(_search[index])));
      },
    ));
  }
}
