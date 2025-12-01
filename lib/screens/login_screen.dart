import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../networks/restAPI.dart';
import '../styles/style.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}


class _loginScreenState extends State<loginScreen> {


  Map<String,String> formValues={

    "email" : "",
    "password" : "",

  };

  bool Loading= false;


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
    else if(formValues['password']!.length==0)
    {
      errorToast('Password Required!');
    }

    else
    {

      setState(() {

        Loading= true;

      });

      bool res = await loginRequest(formValues);
      if(res==true)
      {

        Navigator.pushNamedAndRemoveUntil(context, '/dashboard', (route)=>false);
        //dashboard
        //going to the next page and removing all previous routing/navigation history before

      }
      else
      {
        setState(() {

          Loading= false;
          Navigator.pushNamedAndRemoveUntil(context, '/login', (route)=>false);

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
                      child: Column(

                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text("Get Started With", style: head1Text(colorDarkBlue)),
                            SizedBox(height: 1),
                            Text("Sparktech Agency", style: head2Text(colorLightGrey)),
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

                                  onPressed: () {
                                    formOnSubmit1();
                                  },
                                  style: appButtonStyle(),
                                  child: successButtonChild('Login'),

                                )

                            ),

                            SizedBox(height: 20),

                            Container(

                                alignment: Alignment.center,
                                child: Column(

                                    children: [

                                      SizedBox(height: 15),

                                      InkWell(

                                          onTap: () {

                                            Navigator.pushNamed(context, '/registration');

                                          },

                                          child: Row(

                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [

                                              Text("Don't have account?", style: head3Text(colorDarkBlue)),
                                              Text(' Sign Up!', style: head3Text(colorGreen))

                                            ],

                                          )

                                      )

                                    ]

                                )

                            )

                          ]

                      )
                  ))

              )

            ]

        )

    );
  }
}
