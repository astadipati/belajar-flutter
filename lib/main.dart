import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Crud'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

Future<List> getData() async{
  final response = await http.get("http://192.168.2.203/api_flutter/getdata.php");
  return json.decode(response.body);
}

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),),
        body: new FutureBuilder<List>(
          future: getData(),
          builder: (context, snapshot){
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData ? new ItemList(list: snapshot.data,) : new Center(child: CircularProgressIndicator(),);
          },
        ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list==null ? 0 : list.length,
      itemBuilder: (context, i){
        return new Text(list[i]['item_name']);
      },
    );
  }
}
