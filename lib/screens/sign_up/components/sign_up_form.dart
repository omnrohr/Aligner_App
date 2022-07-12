import 'package:aligner_app/providers/auth_provider.dart';
import 'package:aligner_app/screens/home/home_screen.dart';
import 'package:aligner_app/screens/tabs/home_tabs_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
  bool hidden = true, confHidden = true, agreeToTerms = false;
  String email = '',
      password = '',
      confirmPassword = '',
      phoneNumber = '',
      fName = '',
      lName = '',
      nickName = '';
  DateTime? birthDate;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void onFormSave() async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      if (!agreeToTerms) {
        Fluttertoast.showToast(
            msg: 'Please agree to our terms and conditions to continue');
        setState(() {
          isLoading = false;
        });
        return;
      }
      _formKey.currentState!.save();
      var userCred =
          await AuthProvider.signUpWithEmailAndPassword(email, password);
      if (userCred?.user?.uid != null) {
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
                onSaved: (newValue) => fName = newValue!,
                validator: validateName,
                showCursor: false,
                decoration:
                    globInputDecoration('your first name', 'First Name')),
            const SizedBox(
              height: kDefaultPadding,
            ),
            TextFormField(
                keyboardType: TextInputType.text,
                onSaved: (newValue) => lName = newValue!,
                validator: validateName,
                showCursor: false,
                decoration: globInputDecoration('your last name', 'Last Name')),
            const SizedBox(
              height: kDefaultPadding,
            ),
            TextFormField(
                keyboardType: TextInputType.text,
                onSaved: (newValue) => nickName = newValue!,
                validator: validateName,
                showCursor: false,
                decoration: globInputDecoration('your nick name', 'Nick Name')),
            const SizedBox(
              height: kDefaultPadding,
            ),
            TextFormField(
              onChanged: (value) => password = value,
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
              height: kDefaultPadding,
            ),
            TextFormField(
              onChanged: (value) => confirmPassword = value,
              keyboardType: TextInputType.text,
              onSaved: (newValue) => confirmPassword = newValue!,
              validator: (input) => validateConfirmedPassword(password, input),
              obscureText: confHidden,
              showCursor: false,
              decoration:
                  globInputDecoration('your password again', 'Confirm password')
                      .copyWith(
                suffixIcon: TextButton(
                  onPressed: () {
                    setState(() {
                      confHidden = !confHidden;
                    });
                  },
                  child: const Icon(
                    Icons.remove_red_eye,
                    color: Colors.black26,
                  ),
                ),
              ),
            ),
            TextFormField(
                keyboardType: TextInputType.number,
                onSaved: (newValue) => phoneNumber = newValue!,
                validator: validatePhoneNumber,
                showCursor: false,
                decoration: globInputDecoration('07XXXXXXXX', 'Phone Number')),
            const SizedBox(
              height: kDefaultPadding,
            ),
            const SizedBox(
              height: kDefaultPadding * 2,
            ),
            if (!isLoading)
              RoundedButton(
                  text: 'Sign up',
                  press: onFormSave,
                  fontsSize: 24,
                  height: 50,
                  border: 10),
            if (isLoading)
              RoundedWithCircleProgress(
                height: 50,
                border: 10,
                press: () {},
              ),
            Row(
              children: [
                Checkbox(
                    fillColor:
                        MaterialStateProperty.resolveWith<Color>((states) {
                      if (states.contains(MaterialState.disabled)) {
                        return Colors.purple.withOpacity(.32);
                      }
                      return Colors.purple;
                    }),
                    value: agreeToTerms,
                    onChanged: (value) {
                      setState(() {
                        agreeToTerms = value!;
                      });
                    }),
                const Text('Agree our terms and conditions'),
              ],
            ),
            const SizedBox(
              height: kDefaultPadding,
            ),
          ],
        ));
  }
}
