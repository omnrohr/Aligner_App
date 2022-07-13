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
      if (birthDate == null) {
        Fluttertoast.showToast(msg: 'Please check your birth date');
        setState(() {
          isLoading = false;
        });
        return;
      }
      _formKey.currentState!.save();
      var userCred = await AuthProvider.signUpWithEmailAndPassword(
          email: email,
          password: password,
          fName: fName,
          lName: lName,
          phoneNumber: phoneNumber,
          nickName: nickName,
          birthDate: birthDate!);
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

  void _presentDatePicker() {
    // showDatePicker is a pre-made funtion of Flutter
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1950),
            lastDate: DateTime.now())
        .then((pickedDate) {
      // Check if no date is selected
      if (pickedDate == null) {
        return;
      }
      setState(() {
        birthDate = pickedDate;
      });
    });
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
                onSaved: (newValue) => email = newValue!.trim(),
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
                onSaved: (newValue) => fName = newValue!.trim(),
                validator: validateName,
                showCursor: false,
                decoration:
                    globInputDecoration('your first name', 'First Name')),
            const SizedBox(
              height: kDefaultPadding,
            ),
            TextFormField(
                style: TextStyle(color: kSplashBGC3),
                keyboardType: TextInputType.text,
                onSaved: (newValue) => lName = newValue!.trim(),
                validator: validateName,
                showCursor: false,
                decoration: globInputDecoration('your last name', 'Last Name')),
            const SizedBox(
              height: kDefaultPadding,
            ),
            TextFormField(
                style: TextStyle(color: kSplashBGC3),
                keyboardType: TextInputType.text,
                onSaved: (newValue) => nickName = newValue!.trim(),
                validator: validateName,
                showCursor: false,
                decoration: globInputDecoration('your nick name', 'Nick Name')),
            const SizedBox(
              height: kDefaultPadding,
            ),
            TextFormField(
              style: TextStyle(color: kSplashBGC3),
              onChanged: (value) => password = value,
              keyboardType: TextInputType.text,
              onSaved: (newValue) => password = newValue!.trim(),
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
              style: TextStyle(color: kSplashBGC3),
              onChanged: (value) => confirmPassword = value.trim(),
              keyboardType: TextInputType.text,
              onSaved: (newValue) => confirmPassword = newValue!.trim(),
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
                style: TextStyle(color: kSplashBGC3),
                keyboardType: TextInputType.number,
                onSaved: (newValue) => phoneNumber = newValue!.trim(),
                validator: validatePhoneNumber,
                showCursor: false,
                decoration: globInputDecoration('07XXXXXXXX', 'Phone Number')),
            const SizedBox(
              height: kDefaultPadding,
            ),
            InkWell(
              onTap: _presentDatePicker,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (birthDate == null)
                    Row(
                      children: [
                        Text(
                          '* Click to select your birth date:',
                          style: TextStyle(color: kSplashBGC3),
                        ),
                        SizedBox(
                          width: kDefaultPadding / 2,
                        ),
                        Icon(
                          Icons.date_range_rounded,
                          size: 30,
                          color: kSplashBGC3,
                        ),
                      ],
                    ),
                  if (birthDate != null)
                    Text(
                      " your birth date: ${birthDate.toString().replaceRange(10, null, '')}",
                      style: TextStyle(color: kSplashBGC3),
                    ),
                ],
              ),
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
                Text(
                  'Agree our terms and conditions',
                  style: TextStyle(color: kSplashBGC3),
                ),
              ],
            ),
            const SizedBox(
              height: kDefaultPadding,
            ),
          ],
        ));
  }
}
