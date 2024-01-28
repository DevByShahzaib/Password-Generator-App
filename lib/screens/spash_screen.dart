import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:password_customization_app/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 4), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 1,
                  color: Colors.blue,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 45,
                      ),
                      Container(
                        child: Image.asset('assets/images/splash.png'),
                      ),
                      SizedBox(
                        height: 45,
                      ),
                      Container(
                        decoration: BoxDecoration(),
                        child: Text("Password Generator",
                            style: GoogleFonts.roboto(
                                shadows: [
                                  Shadow(
                                      color: Colors.black,
                                      offset: Offset(4, 3),
                                      blurRadius: 8)
                                ],
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        decoration: BoxDecoration(),
                        child: Text("Customize Your Password",
                            style: GoogleFonts.montserrat(color: Colors.white)),
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
