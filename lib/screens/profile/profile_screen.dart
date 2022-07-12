import 'package:aligner_app/providers/auth_provider.dart';
import 'package:aligner_app/screens/log_in/log_in_screen.dart';
import 'package:aligner_app/widgets/tab_widgets.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContainerShadow(
      child: Center(
        child: TextButton(
          onPressed: () => AuthProvider.signUserOut().then((value) =>
              Navigator.of(context)
                  .pushReplacementNamed(LogInScreen.routeName)),
          child: Text('Sign out'),
        ),
      ),
    );
  }
}
