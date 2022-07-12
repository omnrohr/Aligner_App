import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../helpers/input_helpers.dart';
import '../../../widgets/used_buttons.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool isLoading = false;
  bool hidden = false;
  String? email, password, confirmPassword, phoneNumber, fName, lName, nickName;
  DateTime? birthDate;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
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
            RoundedButton(
                text: 'Login',
                press: () {},
                fontsSize: 24,
                height: 50,
                border: 10),
          ],
        ));
  }
}
