import 'package:flutter/material.dart';

class CallsPage extends StatefulWidget {
  const CallsPage({Key? key}) : super(key: key);

  @override
  State<CallsPage> createState() => MessagesPageState();
}

class MessagesPageState extends State<CallsPage> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('calls'));
  }
}
