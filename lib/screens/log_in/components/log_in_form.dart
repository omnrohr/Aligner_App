import 'package:aligner_app/providers/auth_provider.dart';
import 'package:aligner_app/screens/tabs/home_tabs_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../constants.dart';
import '../../../helpers/input_helpers.dart';
import '../../../widgets/used_buttons.dart';

class LogInForm extends StatefulWidget {
  const LogInForm({Key? key}) : super(key: key);

  @override
  State<LogInForm> createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  bool hidden = true;
  bool isLoading = false;

  void onFormSave() async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      var usercred =
          await AuthProvider.signInWithEmailAndPassword(email, password);
      if (usercred?.user?.uid != null) {
        Future.delayed(
            Duration(seconds: 3),
            () => Navigator.of(context)
                .pushReplacementNamed(HomeTabsScreen.routeName));
      } else {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
                style: TextStyle(color: kSplashBGC3),
                keyboardType: TextInputType.emailAddress,
                onSaved: (newValue) => email = newValue!,
                validator: validateEmail,
                showCursor: false,
                decoration:
                    globInputDecoration('yourmail@example.com', 'E-Mail')),
            const SizedBox(
              height: kDefaultPadding,
            ),
            TextFormField(
              style: TextStyle(color: kSplashBGC3),
              keyboardType: TextInputType.text,
              onSaved: (newValue) => password = newValue!,
              validator: validatePassword,
              obscureText: hidden,
              showCursor: false,
              decoration:
                  globInputDecoration('your password', 'Password').copyWith(
                suffixIcon: TextButton(
                  onPressed: () {
                    setState(() {
                      hidden = !hidden;
                    });
                  },
                  child: const Icon(
                    Icons.remove_red_eye,
                    color: Colors.black26,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: kDefaultPadding * 2,
            ),
            if (!isLoading)
              RoundedButton(
                  text: 'Login',
                  press: onFormSave,
                  fontsSize: 24,
                  height: 50,
                  border: 10),
            if (isLoading)
              RoundedWithCircleProgress(
                press: () {},
                height: 50,
                border: 10,
              ),
          ],
        ));
  }
}
