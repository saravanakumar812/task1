import 'package:flutter/material.dart';

//import 'package:task1/signinPage.dart';

import 'loginPage.dart';

class Spalsh extends StatefulWidget {
  const Spalsh({super.key});

  @override
  State<Spalsh> createState() => _SpalshState();
}

class _SpalshState extends State<Spalsh> {
  @override
  void initState() {
    super.initState();
    navigatetohome();
  }

  navigatetohome() async {
    await Future.delayed(const Duration(milliseconds: 5500), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const MyLoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        colors: [Colors.purple, Colors.red],
        begin: Alignment.bottomRight,
        end: Alignment.topLeft,
      )),
    ));
  }
}
