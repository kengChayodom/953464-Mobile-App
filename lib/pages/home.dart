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
        MyBox(),
        SizedBox(height: 20,),
        MyBox(),
        SizedBox(height: 20,),
        MyBox(),
        SizedBox(height: 20,),
      ],
    ),
      );

    
  }
  Widget MyBox(){
      return Container(
        padding: EdgeInsets.all(20),
        height: 150,
        decoration: BoxDecoration(
          color: Colors.greenAccent[200],
          borderRadius: BorderRadius.circular(24),
          image: DecorationImage(
            image: NetworkImage("https://cdn.pixabay.com/photo/2024/02/15/14/00/man-8575459_1280.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.darken))
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text("What is the computer", 
            style: 
            TextStyle(
              fontSize: 25 , 
              color: Colors.white,
              fontWeight: FontWeight.bold),
              ),
          Text("A computer is a machine that can be programmed to automatically carry out sequences of arithmetic or logical operations (computation).", 
            style: 
            TextStyle(
              fontSize: 15, 
              color: Colors.white ),),
        ],),
      );
    }
}