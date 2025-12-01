import 'dart:convert';
import 'package:http/http.dart' as http;
import '../styles/style.dart';
import '../utils/utility.dart';

String? token;
var baseURL = "https://www.server.thereflectivespiritapp.com/api/v1";
var requestHeader = {
  "Content-Type" : "application/json"
};
var requestHeader2 = {
  "token" : token.toString(),
  //"Content-Type" : "application/json"
};



Future<bool>registrationRequest(formValues) async {

  var URL = Uri.parse('$baseURL/users');
  var postBody = json.encode(formValues);

  var response = await http.post(URL, headers: requestHeader, body: postBody );
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);
  token = resultBody['data']['otpToken']['token'];

  print(response.statusCode);
  print(response.body);
  //print(token);

  //storeUserData(response.body);

  if (resultCode == 200 && resultBody['success']== true )
  {
    successToast('Request Success!');
    //storeUserData(response.body);
    return true;
  }
  else
  {
    errorToast('Request Denied, please try again later.');
    return false;
  }

}

Future<bool>verifyOTPRequest(formValues) async {

  print(formValues);

  var URL = Uri.parse('$baseURL/otp/verify-otp');
  //var postBody = json.encode(formValues);

  var response = await http.post(URL, headers: requestHeader2, body: formValues );
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);

  print(resultCode);
  print(resultBody);

  if (resultCode == 200 && resultBody['success']=='true')
  {

    //await storeOTPToVerify(otp);
    successToast('Request Success!');
    return true;

  }
  else
  {
    errorToast('Request Denied, please try again later.');
    return false;
  }

}

Future<bool>loginRequest(formValues) async {

  print(formValues);

  var URL = Uri.parse('$baseURL/auth/login');
  var postBody = json.encode(formValues);

//  var response = await http.post(URL, body: postBody );
  var response = await http.post(URL, headers: requestHeader, body: postBody );
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);

  print(resultCode);
  print(resultBody);

  print(resultBody['success']);
  //print(resultBody['data']['accessToken']);

  if (resultCode == 200)
  {
    successToast('Request Success!');
    await storeUserData(resultBody);
    return true;
  }
  else
  {
    errorToast('Request Denied, please try again later.');
    return false;
  }

}

















