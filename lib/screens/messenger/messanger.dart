import 'package:aligner_app/widgets/tab_widgets.dart';
import 'package:flutter/material.dart';

class MessengerScreen extends StatelessWidget {
  const MessengerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContainerShadow(
      child: Center(
        child: Text('messanger'),
      ),
    );
  }
}
