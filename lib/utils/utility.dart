import 'dart:typed_data';

import 'package:shared_preferences/shared_preferences.dart';

import 'dart:convert';
import 'package:flutter/material.dart';

//String defaultProfilePic = 'data:image/jpeg;base64,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';

Future<void> storeUserData(userData) async {

  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('accessTkn', userData['data']['accessToken']);
  //await prefs.setString('email', userData['data']['email']);
  //await prefs.setString('firstName', userData['data']['firstName']);
  //await prefs.setString('lastName', userData['data']['lastName']);
 // await prefs.setString('mobile', userData['data']['mobile']);
 // await prefs.setString('photo', userData['data']['photo']);

}

Future<void> storeEmailToVerify (Email) async {

  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('emailVerification',Email);

}

Future<void> storeOTPToVerify (OTP) async {

  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('OTPVerification',OTP);

}

Future<String?> retrieveUserData(key) async {

  final prefs = await SharedPreferences.getInstance();

  String? myData = await prefs.getString(key);

  return myData;

}

Future<bool> removeToken() async {

  final prefs = await SharedPreferences.getInstance();

  //prefs.remove('token');

  prefs.clear();

  return true;

}


//Image conversion utility....(ostad)

/*

showBase64Img(base64String) {

  UriData? data1 = Uri.parse(base64String).data;

  Uint8List myImage = data1!.contentAsBytes();

  return myImage;

}

*/

//chatGPT.. (failed)

/*

Widget showBase64Img(String? dataUri, {double size = 48}) {
  if (dataUri == null || dataUri.isEmpty) {
    return Image.asset(
      'assets/images/defaultProfilePic2.jpg',
      width: size,
      height: size,
      fit: BoxFit.cover,
    );
  }

  try {
    // split into "data:image/png;base64," and the actual base64 part
    final base64Part = dataUri.split(',').last;

    Uint8List bytes = base64Decode(base64Part);

    return Image.memory(
      bytes,
      width: size,
      height: size,
      fit: BoxFit.cover,
    );
  } catch (e) {
    return Image.asset(
     'assets/images/defaultProfilePic2.jpg',
      width: size,
      height: size,
      fit: BoxFit.cover,
    );
  }
}

*/

//trial 2...(success)

/*

Widget showBase64Img(String? dataUri, {double size = 48}) {
  // Use the provided dataUri or fallback to defaultProfilePic
  final uriToUse = (dataUri == null || dataUri.isEmpty) ? defaultProfilePic : dataUri;

  try {
    // Extract the base64 part after the comma
    final base64Part = uriToUse.split(',').last;

    Uint8List bytes = base64Decode(base64Part);

    return Image.memory(
      bytes,
      width: size,
      height: size,
      fit: BoxFit.cover,
    );
  } catch (e) {
    // Fallback to defaultProfilePic in case of error
    final base64Part = defaultProfilePic.split(',').last;
    Uint8List bytes = base64Decode(base64Part);

    return Image.memory(
      bytes,
      width: size,
      height: size,
      fit: BoxFit.cover,
    );
  }
}

*/


//trial 3...(success) + better...

// Assume this is your default Data URI string

const String defaultProfilePic = 'data:image/jpeg;base64,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';

/*

Widget showBase64Img(String? dataUri, {double size = 48}) {
  Uint8List _decodeBase64(String uri) {
    final base64Part = uri.split(',').last;
    return base64Decode(base64Part);
  }

  try {
    // Use provided dataUri or default
    final bytes = _decodeBase64(dataUri ?? defaultProfilePic);
    return Image.memory(
      bytes,
      width: size,
      height: size,
      fit: BoxFit.cover,
    );
  } catch (e) {
    // Fallback to defaultProfilePic in case of any error
    final bytes = _decodeBase64(defaultProfilePic);
    return Image.memory(
      bytes,
      width: size,
      height: size,
      fit: BoxFit.cover,
    );
  }
}

*/

// trial 4...success + even better...

/*

Widget showBase64Img(String? dataUri, {double size = 48}) {
  Uint8List decode(String uri) => base64Decode(uri.split(',').last);

  try {
    return Image.memory(
      decode(dataUri ?? defaultProfilePic),
      width: size,
      height: size,
      fit: BoxFit.cover,
    );
  } catch (_) {
    return Image.memory(
      decode(defaultProfilePic),
      width: size,
      height: size,
      fit: BoxFit.cover,
    );
  }
}

*/

// trial 5...success + even far better...


Widget showBase64Img(String? dataUri, {double size = 48}) {
  // Decode the base64 part of a Data URI
  Uint8List decode(String uri) => base64Decode(uri.split(',').last);

  // Use provided dataUri or defaultProfilePic
  final bytes = decode(dataUri?.isNotEmpty == true ? dataUri! : defaultProfilePic);

  return Image.memory(
    bytes,
    width: size,
    height: size,
    fit: BoxFit.cover,
  );
}



