import 'dart:convert';
// import 'package:bsrb/admin/admin_model.dart';
import 'package:bsrb/user/about_bsrb.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:bsrb/home/login_view.dart';

class User extends StatefulWidget {
  final String norek;

  User({this.norek});
  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  List _dataTabungan = List();

  void _ambilDataTabungan() async {
    var res = await http.get(
        "http://bsrb.000webhostapp.com/gettabungan.php?norek=" + widget.norek);
    print(res.body);
    setState(() {
      _dataTabungan = json.decode(res.body);
    });
  }

  @override
  void initState() {
    _ambilDataTabungan();
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
          title: Text("BSRB MOBILE"),
        ),
        body: Container(
          color: Colors.white,
          padding: EdgeInsets.all(20.0),
          child: ListView(
            children: <Widget>[
              Center(
                child: Column(
                  children: <Widget>[
                    // _judulPage(),
                    _greetingCard(),
                    _riwayatTransaksi(),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.priority_high),
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => AboutPage()));
          },
        ));
  }

  Widget _greetingCard() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 30),
        ),
        Text(
          "Welcome, ${widget.norek}",
          style: TextStyle(fontSize: 30.0),
        )
      ],
    );
  }

  // Widget _judulPage() {
  //   return Column(
  //     children: <Widget>[
  //       Padding(
  //         padding: EdgeInsets.only(top: 30.0),
  //       ),
  //       Text(
  //         "Daftar Transaksi",
  //         style: TextStyle(color: Colors.white, fontSize: 30.0),
  //       ),
  //       SizedBox(
  //         height: 15,
  //       )
  //     ],
  //   );
  // }

  SingleChildScrollView _riwayatTransaksi() {
    return SingleChildScrollView(
      padding: EdgeInsets.only(top: 5.0),
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: [
            DataColumn(
                label: Text(
              "Tanggal",
              style: TextStyle(fontSize: 19),
            )),
            DataColumn(
                label: Text(
              "Setor",
              style: TextStyle(fontSize: 19),
            )),
            DataColumn(
                label: Text(
              "Tarik",
              style: TextStyle(fontSize: 19),
            )),
            DataColumn(
                label: Text(
              "Berat",
              style: TextStyle(fontSize: 19),
            )),
            DataColumn(
                label: Text(
              "Jenis",
              style: TextStyle(fontSize: 19),
            )),
            DataColumn(
                label: Text(
              "Saldo",
              style: TextStyle(fontSize: 19),
            )),
          ],
          rows: _dataTabungan
              .map(
                (item) => DataRow(cells: <DataCell>[
                  DataCell(Text(
                    item["tanggal"],
                    style: TextStyle(fontSize: 19),
                  )),
                  DataCell(Text(
                    item["setor"],
                    style: TextStyle(fontSize: 19),
                  )),
                  DataCell(Text(
                    item["tarik"],
                    style: TextStyle(fontSize: 19),
                  )),
                  DataCell(Text(
                    item["berat"],
                    style: TextStyle(fontSize: 19),
                  )),
                  DataCell(Text(
                    item["jenis"],
                    style: TextStyle(fontSize: 19),
                  )),
                  DataCell(Text(
                    item["saldo"],
                    style: TextStyle(fontSize: 19),
                  )),
                ]),
              )
              .toList(),
        ),
      ),
    );
  }
}
