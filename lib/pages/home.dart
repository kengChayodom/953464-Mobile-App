import 'package:firstapp/pages/detail.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20),
        child:  FutureBuilder(
          builder: (context , snapshot){
            
            var data = json.decode(snapshot.data.toString());
            return ListView.builder(itemBuilder: (BuildContext context, int index){
              return MyBox(data[index]['title'],data[index]['subtitle'],data[index]['image_url'],data[index]['detail']);
            },
            itemCount: data.length,
          
            
            );

          },
          future: DefaultAssetBundle.of(context).loadString('data.json'),
        )
      );

    
  }
  Widget MyBox(String title, String subtitle , String image_url , String detail){
    var v1,v2,v3,v4;
    v1 = title;
    v2 = subtitle;
    v3 = image_url;
    v4 = detail;
      return Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(20),
        // height: 150,
        decoration: BoxDecoration(
          color: Colors.greenAccent[200],
          borderRadius: BorderRadius.circular(24),
          image: DecorationImage(
            image: NetworkImage(image_url),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.darken))
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text(title, 
            style: 
            TextStyle(
              fontSize: 25 , 
              color: Colors.white,
              fontWeight: FontWeight.bold),
              ),
            SizedBox(height: 20,),
          Text(subtitle,
            style: 
            TextStyle(
              fontSize: 15, 
              color: Colors.white ),),
            SizedBox(height: 20,),
            TextButton(
              onPressed: (){
                print("next page >>");
                Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsPage(v1,v2,v3,v4)));
              },
              child: Text("Read more"),
            )
        ],),
      );
    }
}

