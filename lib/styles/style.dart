import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

const colorRed = Color.fromRGBO(231,28,36,1.0);
const colorLightGrey = Color.fromRGBO(135,142,150,1.0);
const colorDark = Color.fromRGBO(136,28,32,1.0);
const colorGreen = Color.fromRGBO(33,191,115,1.0);
const colorBlue = Color.fromRGBO(52,152,219,1.0);
const colorOrange = Color.fromRGBO(230,126,34,1.0);
const colorWhite = Color.fromRGBO(255,255,255,1.0);
const colorDarkBlue = Color.fromRGBO(44,62,80,1.0);
const colorLight = Color.fromRGBO(211,211,211,1.0);


TextStyle head1Text(textColor){

  return TextStyle(

      color: textColor,
      fontSize: 28,
      fontFamily: 'poppins',
      fontWeight: FontWeight.w700

  );

}

TextStyle head2Text(textColor){

  return TextStyle(

    color: textColor,
    fontSize: 16,
    fontFamily: 'poppins',
    fontWeight: FontWeight.w400,

  );

}

TextStyle head3Text(textColor){

  return TextStyle(

    color: textColor,
    fontSize: 13,
    fontFamily: 'poppins',
    fontWeight: FontWeight.w400,

  );

}

TextStyle head4Text(textColor){

  return TextStyle(

    color: textColor,
    fontSize: 9,
    fontFamily: 'poppins',
    fontWeight: FontWeight.w400,

  );

}

InputDecoration appInputDecoration(label){

  return InputDecoration(

    focusedBorder: const OutlineInputBorder(

        borderSide: const BorderSide(color: colorGreen, width: 1)

    ),

    fillColor: colorWhite,
    filled: true,
    contentPadding: EdgeInsets.fromLTRB(20,10,10,20),
    enabledBorder: const OutlineInputBorder(

        borderSide: const BorderSide(color: colorWhite, width: 0)

    ),
    border: OutlineInputBorder(),
    labelText: label,
    //prefixIconColor: colorRed

  );

}

DecoratedBox appDropDownStyle(child) {

  return DecoratedBox(

    decoration: BoxDecoration(

      color: Colors.white,
      border: Border.all(color: Colors.white, width: 1),
      borderRadius: BorderRadius.circular(4),

    ),

    child: Padding(

      padding: EdgeInsets.only(left: 30, right: 30),
      child: child,

    ),

  );

}

SvgPicture screenBgPic(context) {

  return SvgPicture.asset(

      'assets/images/background.svg',
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      fit: BoxFit.cover

  );

}

ButtonStyle appButtonStyle() {

  return ElevatedButton.styleFrom(

      elevation: 1,
      padding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(

        borderRadius: BorderRadius.circular(6),

      )

  );

}


TextStyle buttonTextStyle() {

  return TextStyle(

    fontSize: 14,
    fontFamily: 'poppins',
    fontWeight: FontWeight.w400,
    color: Colors.white,

  );

}

Ink successButtonChild(String buttonText) {

  return Ink(

      decoration: BoxDecoration( color: colorGreen, borderRadius: BorderRadius.circular(6)),
      child: Container(

          height: 45,
          alignment: Alignment.center,
          child: Text( buttonText , style: buttonTextStyle())

      )

  );

}

PinTheme appOTPStyle() {

  return PinTheme(

    activeColor: colorWhite,
    activeFillColor: Colors.white,
    inactiveColor: colorLight,
    inactiveFillColor: colorWhite,
    selectedColor: colorRed,
    selectedFillColor: colorGreen,
    shape: PinCodeFieldShape.box,
    borderRadius: BorderRadius.circular(5),
    borderWidth: 0.5,
    fieldHeight: 55,
    fieldWidth: 45,

  );

}

void successToast(msg1) {

  Fluttertoast.showToast(

      msg: msg1,
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_SHORT,
      timeInSecForIosWeb: 1,
      backgroundColor: colorGreen,
      textColor: colorWhite,
      fontSize: 16

  );

}

void errorToast(msg2) {

  Fluttertoast.showToast(

      msg: msg2,
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_SHORT,
      timeInSecForIosWeb: 1,
      backgroundColor: colorRed,
      textColor: colorWhite,
      fontSize: 16

  );

}

//listview card style...

SizedBox itemSizedBox(child) {

  return SizedBox(

      width: double.infinity,
      child: Container(

          padding: EdgeInsets.all(10),
          child: child

      )

  );

}

// status pill show

Container statusChild (statusText, statusColor) {

  return Container(

    alignment: Alignment.center,
    decoration: BoxDecoration(

      borderRadius: BorderRadius.circular(20),
      color: statusColor,

    ),
    height: 20,
    width: 60,
    child: Text(
        statusText,
        style: TextStyle(

            color: colorWhite,
            fontSize: 10,
            fontWeight: FontWeight.w400

        )

    ),

  );

}

//task button style...

ButtonStyle taskButtonStyle (btnColor) {

  return ElevatedButton.styleFrom(

      elevation: 1,
      padding: EdgeInsets.zero,
      backgroundColor: btnColor

  );

}
















