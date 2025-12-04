import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

// Future<void> registerUser({XFile? imageFile, formValues}) async {
//   final url = Uri.parse("https://www.server.thereflectivespiritapp.com/api/v1/users");
//
//   // JSON data you want to send
//   // final Map<String, dynamic> userData = {
//   //   "firstName": "yolli78550",
//   //   "email": "gxa270@inilas.com",
//   //   "password": "StrongPass123!"
//   // };
//
//   String? token;
//
//   // Create multipart request
//   var request = http.MultipartRequest("POST", url);
//
//   // Add JSON text field
//   request.fields['data'] = jsonEncode(formValues);
//
//   // If image is provided, attach file
//   if (imageFile != null) {
//     request.files.add(
//       await http.MultipartFile.fromPath(
//         'profile',
//         imageFile.path,
//         filename: basename(imageFile.path),
//       ),
//     );
//   }
//
//   // Add headers (do NOT set Content-Type manually!)
//   request.headers.addAll({
//     "Accept": "application/json",
//   });
//
//   try {
//     // Send request
//     var streamedResponse = await request.send();
//
//     // Convert streamed response to regular response
//     var response = await http.Response.fromStream(streamedResponse);
//
//     var resultBody = json.decode(response.body);
//     token = resultBody['data']['otpToken']['token'];
//
//     print("Status Code: ${response.statusCode}");
//     print("Response Body: ${response.body}");
//   } catch (e) {
//     print("Error: $e");
//   }
// }
