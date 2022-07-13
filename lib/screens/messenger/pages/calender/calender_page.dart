import 'package:flutter/material.dart';

class CalenderPage extends StatefulWidget {
  const CalenderPage({Key? key}) : super(key: key);

  @override
  State<CalenderPage> createState() => MessagesPageState();
}

class MessagesPageState extends State<CalenderPage> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Comming Soon'));
  }
}
