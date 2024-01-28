import 'dart:math';

import 'package:password_customization_app/screens/home_screen.dart';

// void main() {

//   var obj = Password();
//   var a = obj.generatePassword(8, 3, 2);
//   var obj1 = StringShuffler(a);
//   print(obj1.shuffled);

//   // var obj2 = StringShuffler(obj);
// }

class Password {
  var pass = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
  var password = '';
  var specialCharactor = '/,#@\$!&*()_%^~?|';
  var specialnumbers = '124567890';
  var passSpecial = '';
  var passnumber = '';
  int tempnumber = 0;

  String generatePassword(
      int passwordLength, int numberLength, int speciallength) {
    for (var i = 0; i < passwordLength - (numberLength + speciallength); i++) {
      password += pass[Random().nextInt(pass.length)];
    }

    //for digits
    for (var i = 0; i < numberLength; i++) {
      tempnumber = (Random().nextInt(9));
      passnumber += '$tempnumber';
    }

    // for special
    for (var i = 0; i < speciallength; i++) {
      passSpecial += specialCharactor[(Random().nextInt(10))];
    }

    password += passnumber;
    password += passSpecial;
    return password;
  }
}

class StringShuffler {
  String value;

  StringShuffler(this.value);

  String get shuffled => _shuffleString();

  String _shuffleString() {
    List<String> characters = value.split('');
    characters.shuffle();
    return characters.join('');
  }
}
