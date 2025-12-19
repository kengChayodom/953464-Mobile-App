import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {

  final items = List<String>.generate(1000, (i)=>"Item $i");
  List mydata = ['apple','banana','papaya'];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder:  (context, index){
      return ListTile(
        onTap: (){},
        leading: Icon(Icons.access_alarm),
        title: Text(mydata[index]),
      );
    },
    itemCount: mydata.length
    );

  }
}