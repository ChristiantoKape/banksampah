import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:bsrb/helper/constants.dart';

import 'package:bsrb/admin/admin_list.dart';

class FormTarik extends StatefulWidget {
  @override
  _FormTarik createState() => new _FormTarik();
}

class _FormTarik extends State<FormTarik> {
  TextEditingController norekInput = new TextEditingController();
  TextEditingController tanggalInput = new TextEditingController();
  TextEditingController tarikInput = new TextEditingController();

  void addData() {
    var url = "http://bsrb.000webhostapp.com/transaksi_keluar.php";

    http.post(url, body: {
      "norek": norekInput.text,
      "tanggal": tanggalInput.text,
      "tarik": tarikInput.text,
    });
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
                MaterialPageRoute(builder: (context) => Admin()));
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
                  _titleDescription(),
                  _textField(),
                  _buildButton(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _titleDescription() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 30.0),
        ),
        Text(
          "Transaksi Keluar",
          style: TextStyle(
            color: Colors.black,
            fontSize: 30.0,
          ),
        ),
      ],
    );
  }

  Widget _textField() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 12.0),
        ),
        Form(
          child: Column(
            children: <Widget>[
              TextFormField(
                  controller: norekInput,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: ColorPalette.underlineTextField,
                      width: 1.5,
                    )),
                    labelText: "Nomer Rekening",
                    labelStyle: TextStyle(color: Colors.black),
                    hintText: "Nomer Rekening",
                    hintStyle: TextStyle(color: ColorPalette.hintColor),
                  ),
                  style: TextStyle(color: Colors.black, fontSize: 18.0),
                  autofocus: false,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "Nomer Rekening is Empty";
                    }
                    return null;
                  }),
              TextFormField(
                  controller: tanggalInput,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: ColorPalette.underlineTextField,
                      width: 1.5,
                    )),
                    labelText: "Tanggal",
                    labelStyle: TextStyle(color: Colors.black),
                    hintText: "Tanggal",
                    hintStyle: TextStyle(color: ColorPalette.hintColor),
                  ),
                  style: TextStyle(color: Colors.black, fontSize: 18.0),
                  autofocus: false,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "Tanggal is Empty";
                    }
                    return null;
                  }),
              TextFormField(
                  controller: tarikInput,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: ColorPalette.underlineTextField,
                      width: 1.5,
                    )),
                    labelText: "Jumlah",
                    labelStyle: TextStyle(color: Colors.black),
                    hintText: "Jumlah",
                    hintStyle: TextStyle(color: ColorPalette.hintColor),
                  ),
                  style: TextStyle(color: Colors.black, fontSize: 18.0),
                  autofocus: false,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "Jumlah is Empty";
                    }
                    return null;
                  }),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildButton(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 20.0),
        ),
        InkWell(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            width: double.infinity,
            child: Text(
              "Enter",
              style: TextStyle(color: Colors.black, fontSize: 20.0),
              textAlign: TextAlign.center,
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          onTap: () {
            _popupDialog(context);
          },
        ),
      ],
    );
  }

  void _popupDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Apakah anda sudah yakin?"),
          actions: <Widget>[
            FlatButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("Belum"),
            ),
            FlatButton(
              onPressed: () {
                addData();
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Admin()));
              },
              child: Text("Sudah"),
            ),
          ],
        );
      },
    );
  }
}
