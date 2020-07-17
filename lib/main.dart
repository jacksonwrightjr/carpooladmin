import 'package:flutter/material.dart';
import 'package:carpooladmin/screens/homepage.dart';
import 'package:carpooladmin/screens/wrapper.dart';
import 'package:carpooladmin/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:carpooladmin/models/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
        child: MaterialApp(
          home: Wrapper()
        )
    );
  }
}
