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
                          textAlign: TextAlign.center,
                          controller: plength,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 83, 81, 81))),
                            hintText: "Enter length of your Password",
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          textAlign: TextAlign.center,
                          controller: pdigit,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 83, 81, 81))),
                            hintText: "How many digits you want in it ?",
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          textAlign: TextAlign.center,
                          controller: pspecial,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 83, 81, 81))),
                            hintText:
                                "How many special charactor do you want in it ?",
                          ),
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
                                              Container(
                                                width: 300,
                                                height: 100,
                                                decoration:
                                                    BoxDecoration(boxShadow: [
                                                  BoxShadow(
                                                      color:
                                                          const Color.fromARGB(
                                                              255,
                                                              137,
                                                              189,
                                                              196),
                                                      offset: Offset(5, 5),
                                                      blurRadius: 5,
                                                      spreadRadius: 5)
                                                ]
                                                        // color: Colors.pink,
                                                        ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      15.0),
                                                  child: Text(
                                                    textAlign: TextAlign.center,
                                                    "your result is :\n$result",
                                                    style: GoogleFonts.aclonica(
                                                        fontSize: 25,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        textStyle: TextStyle(
                                                            color: Color(
                                                                0xff588157))),
                                                  ),
                                                ),
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
