// import 'package:cicla_app_00/Setup/LoginSignupPage.dart';
// import 'package:cicla_app_00/Setup/signin.dart';
import 'package:cicla_app_00/screens/wrapper.dart';
import 'package:cicla_app_00/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/user.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
        child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
