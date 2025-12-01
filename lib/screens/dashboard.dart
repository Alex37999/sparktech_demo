import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../styles/style.dart';
import '../utils/utility.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Stack(
            children: [

              screenBgPic(context),
              Container(

                  padding: EdgeInsets.all(135),
                  child: Center(

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Hello To", style: head1Text(colorDarkBlue)),
                          SizedBox(height: 1),
                          Text("Sparktech Agency", style: head2Text(colorLightGrey)),
                          SizedBox(height: 20),
                          SvgPicture.asset(

                            'assets/images/logo.svg',
                            alignment: Alignment.center,
                            fit: BoxFit.cover,
                            //height: 100,
                            //width: 300,

                          ),
                          SizedBox(height: 20),
                          TextButton(

                              onPressed: () async {

                                await removeToken();

                                Navigator.pushNamedAndRemoveUntil( context, '/login', (route) => false);

                              },
                              child: Text('Log Out'))

                        ],
                      )

                  )

              )

            ]

        )

    );
  }
}
