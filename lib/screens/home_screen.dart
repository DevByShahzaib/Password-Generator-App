import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:password_customization_app/logic.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController plength = TextEditingController();
  TextEditingController pdigit = TextEditingController();
  TextEditingController pspecial = TextEditingController();
  var result;
  bool isVisible = false;

  abc() {
    var passwordLength = plength.text;
    int passwordLengthInt = int.parse(passwordLength);
    var passwordDigit = pdigit.text;
    int passwordDigitInt = int.parse(passwordDigit);
    var passwordSpecial = pspecial.text;
    int passwordSpecialInt = int.parse(passwordSpecial);
    var obj1 = Password();
    var passwordInOrder = obj1.generatePassword(
        passwordLengthInt, passwordDigitInt, passwordSpecialInt);

    var obj2 = StringShuffler(passwordInOrder);
    result = obj2.shuffled;
    setState(() {});
  }

  clearField() {
    plength.clear();
    pdigit.clear();
    pspecial.clear();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Image.asset(
                    'assets/images/home.jpg',
                    height: MediaQuery.of(context).size.height * 1,
                    width: MediaQuery.of(context).size.width * 1,
                    fit: BoxFit.cover,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 100,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: plength,
                          decoration: InputDecoration(
                              hintText: "Enter length of your Password"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: pdigit,
                          decoration: InputDecoration(
                              hintText: "How many digits you want in it ?"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: pspecial,
                          decoration: InputDecoration(
                              hintText:
                                  "How many special charactor do you want in it ?"),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                abc();

                                isVisible = true;
                              },
                              child: Text('Calculate')),
                          ElevatedButton(
                              onPressed: () {
                                clearField();
                                isVisible = false;
                              },
                              child: Text('Remove')),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                              child: Container(
                                // color: Colors.amber,
                                width: MediaQuery.of(context).size.width * 1,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: <Widget>[
                                      Visibility(
                                        visible: isVisible,
                                        child: SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.6,
                                          child: Wrap(
                                            runSpacing: 20,
                                            spacing: 10,
                                            children: [
                                              Text(
                                                "your result is :\n$result",
                                                style: GoogleFonts.actor(
                                                    fontSize: 25,
                                                    fontWeight: FontWeight.bold,
                                                    textStyle: TextStyle(
                                                        color:
                                                            Color(0xff588157))),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Image.asset(
                                        isVisible
                                            ? 'assets/images/done.png'
                                            : 'assets/images/prev.png',
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.5,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.5,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
