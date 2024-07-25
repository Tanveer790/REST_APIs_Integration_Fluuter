import 'package:apis_p/signin_login_api.dart';
import 'package:flutter/material.dart';

import 'get_api_with_model.dart';
import 'get_api_without_model.dart';
import 'home_screen.dart';
import 'list_api_many_objects.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const SignUpPostApi(),
    );
  }
}
