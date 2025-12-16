import 'package:flutter/material.dart';

class CalculatePage extends StatefulWidget {
  const CalculatePage({super.key});

  @override
  State<CalculatePage> createState() => _CalculatePageState();
}

class _CalculatePageState extends State<CalculatePage> {

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
        title: Text("Calculator Change"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
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