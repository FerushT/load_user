import 'package:flutter/material.dart';
import 'src/features/feature1/presentation/laod_user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Benutzernamen speichern',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoadUser(),
    );
  }
}
