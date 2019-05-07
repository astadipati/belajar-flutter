import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'main.dart';

class Editdata extends StatefulWidget {

final List list;
final int index;

Editdata({this.list, this.index});

  @override
  _EditdataState createState() => _EditdataState();
}

class _EditdataState extends State<Editdata> {

TextEditingController controllerCode;
TextEditingController controllerNama;
TextEditingController controllerHarga;
TextEditingController controllerStok;

void editData(){
  var url = "http://192.168.2.203/api_flutter/editdata.php";

  http.post(url, body: {
    "id":widget.list[widget.index]['id'],
    "item_code": controllerCode.text,
    "item_name" : controllerNama.text,
    "harga": controllerHarga.text,
    "stock": controllerStok.text
  });
}

@override
  void initState() {
    // TODO: implement initState
    controllerCode = new TextEditingController(text: widget.list[widget.index]['item_code']);
    controllerNama = new TextEditingController(text: widget.list[widget.index]['item_name']);
    controllerHarga = new TextEditingController(text: widget.list[widget.index]['harga']);
    controllerStok = new TextEditingController(text: widget.list[widget.index]['stock']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Edit Data"),),
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
                  child: new Text("Edit Data"),
                  color: Colors.blueAccent,
                  onPressed: () {
                    editData();
                    Navigator.of(context).push(
                      new MaterialPageRoute(
                        builder: (BuildContext context)=> new MyApp() 
                      )
                    );
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