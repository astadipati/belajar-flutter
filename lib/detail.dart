import 'package:flutter/material.dart';
import 'editdata.dart';
import 'package:http/http.dart' as http;
import 'main.dart';
import 'package:flutter/cupertino.dart';

class Detail extends StatefulWidget {
  List list;
  int index;
  Detail({this.index, this.list});
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    // {_showDialog();}
  }

  void deleteData(){
 var url = "http://192.168.2.203/api_flutter/deletedata.php";
 
  http.post(url, body: {
      'id' : widget.list[widget.index]['id'],
  });
  }

  void confirm(){
// coba cara lain
  showDialog(
    context: context,
    builder: (BuildContext context) => new CupertinoAlertDialog(
      title: new Text("hapus"),
      content: new Text("datane"),
      actions: <Widget>[
        CupertinoDialogAction(isDefaultAction: true, child: new RaisedButton(
          child: new Text("hapus"),
          color: Colors.red,
          onPressed: (){
            deleteData();
            Navigator.of(context).push(
              new MaterialPageRoute(
                builder: (BuildContext context)=>MyApp(),
              ),
            );
          },
        ),),
      ],
      
    ),
  );
  // var alert = new AlertDialog(
  //   title: new Text("Hapus Data '${widget.list[widget.index]['item_name']}'"),
  //   actions: <Widget>[
  //     new RaisedButton(
  //       child: new Text("Hapus"),
  //       color: Colors.red,
  //       onPressed: (){
  //         deleteData();
  //         // new MaterialPageRoute(
  //         //   builder: (BuildContext context)=> new MyApp(),
  //         // );
  //         // Navigator.of(context,rootNavigator:true).pop('dialog');
  //         Navigator.push(context, MaterialPageRoute(
  //           builder: (BuildContext context)=>MyApp(),
  //         ));

  //         // Navigator.pop(context);
  //         // new MaterialPageRoute( 
  //         //   builder: (BuildContext context)=>new MyApp(),
  //           // Navigator.pop(_context);
  //         // );
  //       },
  //     ),
  //     new RaisedButton(
  //       child: new Text("Cancel", style: TextStyle(color: Colors.black),),
  //       onPressed: ()=>Navigator.pop(context),
  //     )
  //   ],
  // );
  // showDialog(context: context, builder: (BuildContext context)=>alert);
  _showDialog() async{
    
  }
// end cara lain

    // AlertDialog alertDialog = new AlertDialog(
    //   content: new Text("Hapus Data '${widget.list[widget.index]['item_name']}'"),
    //   actions: <Widget>[
    //     new RaisedButton(
    //       child: new Text("Hapus", style: new TextStyle(color: Colors.black)),
    //       color: Colors.red,
    //       onPressed: (){},
    //     ),
    //     new RaisedButton(
    //       child: new Text("Cancel", style: new TextStyle(color: Colors.black)),
    //       color: Colors.blue,
    //       onPressed: ()=>Navigator.pop(context),
    //     )
    //   ],
    // );
    // showDialog(context: context, child: alertDialog);
    // showDialog(context: context,builder: (_)=>alertDialog);
    // builder: ()=>new Text("Hello"));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("${widget.list[widget.index]['item_name']}"),),
      body: new Container(
        height: 250.0,
        padding: const EdgeInsets.all(20.0),
        child: new Card(
          child: new Center(
            child: new Column(
              children: <Widget>[
                new Padding(padding: const EdgeInsets.only(top: 30.0),),
                new Text(widget.list[widget.index]['item_name'], style: new TextStyle(fontSize: 20.0),),
                new Text("Code : ${widget.list[widget.index]['item_code']}", style: new TextStyle(fontSize: 18.0),),
                new Text("Harga : ${widget.list[widget.index]['harga']}", style: new TextStyle(fontSize: 18.0),),
                new Text("Stok : ${widget.list[widget.index]['stock']}", style: new TextStyle(fontSize: 18.0),),
                new Padding(padding: const EdgeInsets.only(top: 30.0),),

                new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                  new RaisedButton(
                    child: new Text("Edit"),
                    color: Colors.green,
                    onPressed: ()=>Navigator.of(context).push(
                      new MaterialPageRoute(
                        builder:(BuildContext context)=>new Editdata(list: widget.list, index: widget.index,),
                      )
                    ),
                  ),
                  new RaisedButton(
                    child: new Text("Hapus"),
                    color: Colors.red,
                    // onPressed: ()=>confirm(),
                    onPressed: ()=>confirm(),
                  )
                ],)
              ],
            ),
          ),
        ),
      ),
    );
  }
}