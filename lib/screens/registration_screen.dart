import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../networks/imgApi.dart';
import '../networks/restAPI.dart';
import '../styles/style.dart';


class registrationScreen extends StatefulWidget {
  const registrationScreen({super.key});

  @override
  State<registrationScreen> createState() => _registrationScreenState();
}

class _registrationScreenState extends State<registrationScreen> {

  //File img = File("/path/to/profile.jpg");

  XFile? photoFile;


  Map<String,String> formValues={

    "firstName" : "",
    "email" : "",
    "password" : "",


  };



  bool Loading = false;

  InputOnChange(MapKey, TextValue){

    setState(() {

      formValues[MapKey] = TextValue; // directly assign

    });

  }

  formOnSubmit1() async {

    if(formValues['email']!.length==0)
    {
      errorToast('Email Address Required!');
    }
    else if(formValues['firstName']!.length==0)
    {
      errorToast('First Name Required!');
    }
    else if(formValues['password']!.length==0)
    {
      errorToast('Password Required!');
    }

    else

    {

      //bool res = await registrationRequest(formValues);

      var res = registerUser(imageFile: photoFile ,formValues: formValues) ;

      print(res);
      Navigator.pushNamed(context, '/pinVerify',);

    }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Stack(

            children: [

              screenBgPic(context),
              Container(

                alignment: Alignment.center,
                child: Loading? (Center(child:CircularProgressIndicator())) : (
                    SingleChildScrollView(

                      //margin: EdgeInsets.fromLTRB(0, 60, 0, 0) ,
                        padding: EdgeInsets.all(30),
                        child: Column(

                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Text("Join With Us", style: head1Text(colorDarkBlue)),
                              SizedBox(height: 1),
                              Text("Sparktech Agency", style: head2Text(colorLightGrey)),



                              SizedBox(height: 20),

                              InkWell(
                                onTap: () async {

                                  final imgPicker = ImagePicker();
                                  final result = await imgPicker.pickImage(source: ImageSource.gallery);
                                  if (result != null)
                                  {
                                    photoFile = result ;

                                    setState(() {

                                    });
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(8)
                                  ),
                                  child: Row(
                                      children: [

                                        Container(
                                          padding: EdgeInsets.all(12),
                                          decoration: BoxDecoration(
                                              color: Colors.grey
                                          ),
                                          child: Text('Photo', style: TextStyle(color: Colors.white),),
                                        ),

                                        Visibility(
                                            visible: photoFile != null,
                                            replacement: Padding(
                                              padding: const EdgeInsets.only(left: 8.0),
                                              child: Text('Select a Photo', style: TextStyle(
                                                //fontWeight: FontWeight.w400,
                                                color: Colors.grey,
                                              ),
                                              ),
                                            ),
                                            child: Image.file(File(photoFile?.path ?? ''), height: 25, width: 25,)
                                        ),

                                        Expanded(child: Text( photoFile?.name ?? '', maxLines: 2, )),


                                      ]
                                  ),
                                ),
                              ),

                              SizedBox(height: 20),

                              TextFormField(

                                  onChanged: (TextValue){

                                    InputOnChange('firstName', TextValue);

                                  },

                                  decoration: appInputDecoration('First Name')

                              ),

                              SizedBox(height: 20),


                              TextFormField(

                                  onChanged: (TextValue){

                                    InputOnChange('email', TextValue);

                                  },

                                  decoration: appInputDecoration('Email Address')

                              ),

                              SizedBox(height: 20),


                              TextFormField(

                                  onChanged: (TextValue){

                                    InputOnChange('password', TextValue);

                                  },

                                  decoration: appInputDecoration('Password')

                              ),

                              SizedBox(height: 20),

                              Container(

                                  child: ElevatedButton(

                                    onPressed: (){

                                      formOnSubmit1();

                                    },
                                    style: appButtonStyle(),
                                    child: successButtonChild('Register'),

                                  )

                              )

                            ]

                        )

                    )

                ),

              ),

            ]

        )

    );
  }
}
