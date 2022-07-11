import 'package:aligner_app/constants.dart';
import 'package:aligner_app/screens/home/home_screen.dart';
import 'package:aligner_app/screens/tabs/home_tabs_screen.dart';
import 'package:aligner_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreenBody extends StatelessWidget {
  const SplashScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed(HomeTabsScreen.routeName);
    });
    SizeConfig.init(context);
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [kSplashBGC2, kSplashBGC1],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: SizeConfig.screenWidth,
            ),
            const Spacer(
              flex: 5,
            ),
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: kDefaultPadding * 2,
                      vertical: kDefaultPadding / 2),
                  child: Text(
                    'Aligner',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 45,
                        fontFamily: GoogleFonts.poppins().fontFamily),
                  ),
                ),
                Positioned(
                    top: 5,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                          color: kSplashBGC1,
                          borderRadius: BorderRadius.circular(20)),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: Text(
                          'PRO',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ))
              ],
            ),
            const Spacer(
              flex: 4,
            ),
            const Text(
              "It's more than dental app",
              style: TextStyle(
                  color: Colors.white, fontSize: 16, letterSpacing: 1),
            ),
            const Spacer(
              flex: 1,
            ),
            const Text('VERSION 1.0', style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
