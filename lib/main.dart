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

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var price = TextEditingController();
  var amount = TextEditingController();
  var change = TextEditingController();
  double _total = 0;
  double _change = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text("Change Calculator", style: TextStyle(fontFamily: 'maa' , fontSize: 30, fontWeight: FontWeight.bold , fontStyle: FontStyle.italic, color: Colors.deepPurple , backgroundColor: Colors.blue)),
            SizedBox(height: 20),
            Image.asset("assets/catmeme.jpg" , height: 100),
            SizedBox(height: 20),
            Image.network('https://media.tenor.com/ldDoV7iwmkgAAAAj/kurukuru-kururing.gif' , height: 100),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: priceTextField(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: amountTextField(),
            ),
            calculateButton(),
            showTotalText(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: receiveMoneyTextField(),
            ),
            changeCalculateButton(),
            showChangeText(),
          ],
        ),
      ),
    );
  }

 

  Widget priceTextField(){
    return TextField(
        controller: price,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "price per item",
        ),
        keyboardType: TextInputType.number,
      );
  }

  Widget amountTextField(){
    return  TextField(
      controller: amount,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: "amount of items",
      ),
      keyboardType: TextInputType.number,
    );
  }

  Widget calculateButton() {
    return ElevatedButton(
        onPressed: () {
          if(price.text.isNotEmpty && amount.text.isNotEmpty){
            setState(() {
              _total = double.parse(price.text) * double.parse(amount.text);
            });
          }
        }, 
        child: Text("Calculate Total"),
        );
  }

  Widget showTotalText() {
    return Text("total : Baht $_total");
  }

  Widget receiveMoneyTextField(){
    return TextField(
        controller: change,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "get money",
        ),
        keyboardType: TextInputType.number,
      );
  }

  Widget changeCalculateButton() {
    return ElevatedButton(
        onPressed: () {
          if(change.text.isNotEmpty){

            if (double.parse(change.text) < _total) {
              ScaffoldMessenger.of(context,).showSnackBar(
                SnackBar(content: Text("money is not enough"))
              );

            } else {
              setState(() {
              _change = double.parse(change.text) - _total;
            });
            }
          }

        },
      child: Text("Calculate Change"),
    );
  }

  Widget showChangeText() {
    return Text("change : Baht $_change");
  }

}
