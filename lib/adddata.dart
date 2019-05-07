import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Adddata extends StatefulWidget {
  @override
  _AdddataState createState() => _AdddataState();
}

class _AdddataState extends State<Adddata> {
// kontroller

TextEditingController controllerCode = new TextEditingController();
TextEditingController controllerNama = new TextEditingController();
TextEditingController controllerHarga = new TextEditingController();
TextEditingController controllerStok = new TextEditingController();

void adddata(){
  var url = "http://192.168.2.203/api_flutter/adddata.php";

  http.post(url, body: {
      "item_code" : controllerCode.text,
      "item_name" : controllerNama.text,
      "harga" : controllerHarga.text,
      "stock" : controllerStok.text,
  });

}

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Tambah Data"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new TextField(
                  controller: controllerCode,
                  decoration: new InputDecoration(
                      hintText: "Item Code", labelText: "Input Code"),
                ),
                new TextField(
                  controller: controllerNama,
                  decoration: new InputDecoration(
                      hintText: "Item Nama", labelText: "Input Nama"),
                ),
                new TextField(
                  controller: controllerHarga,
                  decoration: new InputDecoration(
                      hintText: "Item Harga", labelText: "Input Harga"),
                ),
                new TextField(
                  controller: controllerStok  ,
                  decoration: new InputDecoration(
                      hintText: "Item Stock", labelText: "Input Stoke"),
                ),
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                new RaisedButton(
                  child: new Text("Simpan"),
                  color: Colors.blueAccent,
                  onPressed: () {
                    adddata();
                    Navigator.pop(context);
                  },
                 
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
