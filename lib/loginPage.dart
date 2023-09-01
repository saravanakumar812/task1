import 'package:flutter/material.dart';
import 'package:task1/signinPage.dart';
import 'package:task1/sql_helper.dart';

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({
    super.key,
  });

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  List<Map<String, dynamic>> journals = [];
  bool isLoading = true;
  void referlsJournals() async {
    final data = await DatabaseHelper.getItems();
    setState(() {
      isLoading = false;
      journals = data;
    });
  }

  // step2
  @override
  void initState() {
    super.initState();
    referlsJournals();
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('LOGIN PAGE'),
        ),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 110, vertical: 50),
              child: const Text(
                "Login Page",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
                width: 350,
                margin: const EdgeInsets.only(left: 15),
                child: TextFormField(
                  controller: emailController,
                  obscureText: false,
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
            const SizedBox(
              height: 30,
            ),
            Container(
                margin: const EdgeInsets.only(left: 15),
                width: 350,
                child: TextFormField(
                  controller: passwordController,
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
                      Login(null);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MySignUpPage()));
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(fontSize: 20),
                    ))),
            const SizedBox(
              height: 60,
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                "Not a User? Register Here !!!",
                style: TextStyle(fontSize: 20, color: Colors.red),
              ),
            )
          ],
        ));
  }

  void Login(int? id) {
    print("ok");
    if (id != null) {
      final existingJournal =
          journals.firstWhere((element) => element['id'] == id);
      emailController.text = existingJournal['email'];
      passwordController.text = existingJournal['password'];
    }
  }
}
