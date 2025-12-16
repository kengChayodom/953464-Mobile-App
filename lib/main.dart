import 'package:firstapp/pages/calc.dart';
import 'package:firstapp/pages/contact.dart';
import 'package:firstapp/pages/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
     title: 'Tui Shop',
     theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
     ),
     home: const MyHomePage(title: 'Pattama Shop'),
     debugShowCheckedModeBanner: false,
   );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _currentindex = 0;
  final tabs = [HomePage(),CalculatePage(), ContactPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculate Application"),
      ),
      body: tabs[_currentindex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentindex ,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home) , label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.calculate), label: "Cal"),
          BottomNavigationBarItem(icon: Icon(Icons.contact_mail), label: "Contact")
        ],
        onTap: (index){
          setState(() {
            print(index);
            _currentindex = index;
          });
        },
        ),
    );
  }
}
