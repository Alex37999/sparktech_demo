import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../networks/restAPI.dart';
import '../styles/style.dart';

class pinVerificationScreen extends StatefulWidget {
  const pinVerificationScreen({super.key});

  @override
  State<pinVerificationScreen> createState() => _pinVerificationScreenState();
}

class _pinVerificationScreenState extends State<pinVerificationScreen> {

  Map<String,String> formValues={

    "otp" : "",

  };

  bool Loading= false;


  InputOnChange(MapKey, TextValue){

    setState(() {

      formValues[MapKey] = TextValue; // directly assign

    });

  }

  formOnSubmit1() async {

    if(formValues['otp']!.length!=6)
    {
      errorToast('PIN Required!');
    }
    else
    {

      setState(() {

        Loading= true;

      });


      bool res = await verifyOTPRequest(formValues);
      if(res==true)
      {

        Navigator.pushNamedAndRemoveUntil(context, '/login', (route)=>false);

        //Navigator.pushNamed(context, '/login');
        //going to the next page and removing all previous routing/navigation history before

      }
      else
      {
        setState(() {

          Loading= false;

        });
      }

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
                  child: Loading? (Center(child: CircularProgressIndicator())) : (SingleChildScrollView(

                      padding: EdgeInsets.all(30),
                      child:  Column(

                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text("PIN Verification", style: head1Text(colorDarkBlue)),
                            SizedBox(height: 1),
                            Text("A 6-digit pin has been sent to your phone number.", style: head2Text(colorLightGrey)),
                            SizedBox(height: 20),
                            PinCodeTextField(

                                appContext: context,
                                length: 6,
                                pinTheme: appOTPStyle(),
                                animationType: AnimationType.fade,
                                animationDuration: Duration(milliseconds: 300),
                                enableActiveFill: true,
                                onCompleted: (v) {

                                },
                                onChanged: (value) {

                                  InputOnChange('otp', value);

                                }

                            ),
                            SizedBox(height: 20),
                            Container(

                                child: ElevatedButton(

                                  onPressed: (){

                                    formOnSubmit1();

                                  },
                                  style: appButtonStyle(),
                                  child: successButtonChild('Verify'),

                                )

                            )

                          ]

                      )

                  )

                  )

              )

            ]

        )

    );
  }
}
