import 'package:flutter/material.dart';

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
        child:  ListView(
      children: [
        MyBox("What is the computer"
        ,"A computer is a machine that can be programmed to automatically carry out sequences of arithmetic or logical operations (computation)."
        ,"https://static.vecteezy.com/system/resources/thumbnails/040/890/255/small/ai-generated-empty-wooden-table-on-the-natural-background-for-product-display-free-photo.jpg"),
        SizedBox(height: 20,),
        MyBox("What is Flutter"
        ,"Flutter is an open-source UI framework for building natively compiled applications mobile, web, and desktop from a single codebase using the Dart programming language. "
        ,"https://cdn.pixabay.com/photo/2024/02/15/14/00/man-8575459_1280.jpg"),
        SizedBox(height: 20,),
        MyBox("What is Dart "
        ,"Dart is a versatile, Google-developed programming language for building fast, cross-platform apps (mobile, web, desktop, server)."
        ,"https://m.media-amazon.com/images/I/71dNtlbI7fL._AC_UF1000,1000_QL80_.jpg"),
        SizedBox(height: 20,),
      ],
    ),
      );

    
  }
  Widget MyBox(String title, String subtitle , String image_url){
      return Container(
        padding: EdgeInsets.all(20),
        height: 150,
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
              onPressed: (){},
              child: Text("Read more"),
            )
        ],),
      );
    }
}

