import 'package:cicla_app_00/models/user.dart';
import 'package:cicla_app_00/screens/authenticate/authenticate.dart';
import 'package:cicla_app_00/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (user == null){
      return Authenticate();
    }else{
      return Home();
    }
  }
}