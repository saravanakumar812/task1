import 'package:flutter/material.dart';
import 'package:task1/homepage.dart';

import 'loginPage.dart';

class MySignUpPage extends StatefulWidget {
  const MySignUpPage({
    super.key,
  });

  @override
  State<MySignUpPage> createState() => _MySignUpPageState();
}

class _MySignUpPageState extends State<MySignUpPage> {
  bool isPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('SIGNUP PAGE'),
          leading: IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyLoginPage()));
              },
              icon: const Icon(Icons.arrow_back_ios)),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 100,
              ),
              child: const Text(
                "Signup Page",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
                width: 340,
                margin: EdgeInsets.only(left: 15),
                child: TextField(
                  obscureText: false,
                  keyboardType: isPassword
                      ? TextInputType.visiblePassword
                      : TextInputType.text,
                  decoration: const InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: Icon(Icons.person, color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: const Color.fromARGB(250, 221, 214, 214),
                          ),
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: const Color.fromARGB(200, 221, 214, 214),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      contentPadding: EdgeInsets.all(10),
                      hintText: "Enter Your Username",
                      hintStyle: TextStyle(
                        color: Color.fromARGB(249, 87, 85, 85),
                      )),
                )),
            const SizedBox(
              height: 30,
            ),
            Container(
                width: 340,
                margin: EdgeInsets.only(left: 15),
                child: TextFormField(
                  obscureText: false,
                  keyboardType: isPassword
                      ? TextInputType.visiblePassword
                      : TextInputType.text,
                  decoration: const InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: Icon(Icons.create, color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: const Color.fromARGB(250, 221, 214, 214),
                          ),
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: const Color.fromARGB(200, 221, 214, 214),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      contentPadding: EdgeInsets.all(10),
                      hintText: "Enter Your Email",
                      hintStyle: TextStyle(
                        color: Color.fromARGB(248, 169, 115, 115),
                      )),
                )),
            SizedBox(
              height: 30,
            ),
            Container(
                margin: const EdgeInsets.only(left: 15),
                width: 340,
                child: TextField(
                  obscureText: false,
                  keyboardType: isPassword
                      ? TextInputType.visiblePassword
                      : TextInputType.text,
                  decoration: const InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: Icon(Icons.lock_outline, color: Colors.black),
                      suffixIcon:
                          Icon(Icons.visibility_outlined, color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: const Color.fromARGB(250, 221, 214, 214),
                          ),
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: const Color.fromARGB(200, 221, 214, 214),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      contentPadding: EdgeInsets.all(10),
                      hintText: "Enter Your Password",
                      hintStyle: TextStyle(
                        color: Color.fromARGB(249, 87, 85, 85),
                      )),
                )),
            const SizedBox(
              height: 30,
            ),
            Container(
                width: 340,
                margin: const EdgeInsets.only(left: 15),
                child: TextField(
                  obscureText: false,
                  keyboardType: isPassword
                      ? TextInputType.visiblePassword
                      : TextInputType.text,
                  decoration: const InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: Icon(Icons.lock, color: Colors.black),
                      suffixIcon: Icon(Icons.visibility, color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: const Color.fromARGB(250, 221, 214, 214),
                          ),
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: const Color.fromARGB(200, 221, 214, 214),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      contentPadding: EdgeInsets.all(10),
                      hintText: "Enter Your Confirm Password",
                      hintStyle: TextStyle(
                        color: Color.fromARGB(249, 87, 85, 85),
                      )),
                )),
            const SizedBox(
              height: 30,
            ),
            Container(
                width: 350,
                height: 40,
                margin: const EdgeInsets.only(left: 15),
                child: TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      primary: Colors.black,
                      backgroundColor:
                          Color.fromARGB(255, 140, 232, 20), // Background Color
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    child: const Text(
                      "SignUp",
                      style: TextStyle(fontSize: 20),
                    ))),
          ],
        ));
  }
}
