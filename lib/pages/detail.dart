import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {

  final v1,v2,v3,v4;
  DetailsPage(this.v1,this.v2,this.v3,this.v4);

  @override
  State<DetailsPage>  createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  var _v1, _v2, _v3 , _v4;
  @override
  void initState(){
  super.initState();
    _v1 = widget.v1;
    _v2 = widget.v2;
    _v3 = widget.v3;
    _v4 = widget.v4;
  }

  @override
  Widget build(BuildContext contex){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        appBar: AppBar(title: Text("Details")),
        body: ListView(
          children: [
            Text(_v1),
            Text(_v2),
            Image.network(_v3),
            Text(_v4)
          ],
        ),
      ),
    );
  }
}