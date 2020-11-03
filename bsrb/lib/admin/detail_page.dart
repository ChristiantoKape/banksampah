import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'package:bsrb/admin/admin_list.dart';
import 'package:bsrb/admin/admin_model.dart';

class DetailPage extends StatefulWidget {
  final AdminModel user;
  DetailPage(this.user);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<DetailPage> {
  List _dataTabungan = List();

  void _ambilDataTabungan() async {
    var res = await http.get(
        "http://bsrb.000webhostapp.com/gettabungan.php?norek=" +
            widget.user.norek);
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

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => Admin()));
          },
        ),
        title: Text("BSRB MOBILE"),
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                _tabelJudul(),
                _tabelData(),
                _tabelTabungan(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _tabelJudul() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 30.0),
        ),
        Text(
          "${widget.user.nama}",
          style: TextStyle(color: Colors.black, fontSize: 30.0),
        ),
      ],
    );
  }

  Widget _tabelData() {
    return Container(
        child: new Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: <
                    Widget>[
      Container(
        margin: EdgeInsets.only(left: 25.0),
        child: Table(
          columnWidths: {
            0: FixedColumnWidth(150),
          },
          children: [
            TableRow(children: [
              Text(
                'Nomer Rekening',
                textAlign: TextAlign.left,
                style:
                    TextStyle(fontSize: 18, color: Colors.black, height: 2.5),
              ),
              Text(': ${widget.user.norek}',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 18, color: Colors.black, height: 2.5)),
            ]),
            TableRow(children: [
              Text(
                'Alamat',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 18, color: Colors.black, height: 2),
              ),
              Text(
                ': ${widget.user.alamat}',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 18, color: Colors.black, height: 2),
              ),
            ]),
            TableRow(children: [
              Text(
                'Nomer Telepon',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 18, color: Colors.black, height: 2),
              ),
              Text(
                ': ${widget.user.notel}',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 18, color: Colors.black, height: 2),
              ),
            ]),
          ],
        ),
      ),
    ])));
  }

  SingleChildScrollView _tabelTabungan() {
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
