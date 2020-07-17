import 'package:flutter/material.dart';
import 'package:carpooladmin/models/user.dart';
import 'package:carpooladmin/screens/homepage.dart';
import 'package:carpooladmin/screens/sign-in.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final user = Provider.of<User>(context);
    print(user);

    if (user == null) {
      return HomePage(); //change to return Login() when done with maps
    } else {
      return HomePage();
    }

  }
}