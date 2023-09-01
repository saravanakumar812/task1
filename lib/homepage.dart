import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List? makeList;

  @override
  void initState() {
    super.initState();
    fetch();
  }

  Future<String> fetch() async {
    final data = {'year': '2019'};
    var headers = {
      'Content-Type': 'application/json',
    };
    final response = await http.post(
        Uri.parse('https://kuwycredit.in/servlet/rest/ltv/forecast/ltvMakes'),
        headers: headers,
        body: jsonEncode(data));
    var responseData = json.decode(response.body);
    if (response.statusCode == 200) {
      makeList = responseData["makeList"];
      print("Data : " + makeList.toString());
    } else {
      throw Exception('Failed.');
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        backgroundColor: Colors.amber,
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: FutureBuilder(
            future: fetch(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.data != null) {
                return ListView.builder(
                  itemCount: makeList!.length,
                  itemBuilder: (BuildContext context, int i) {
                    return ListTile(
                      title: Text(makeList![i].toString()),
                    );
                  },
                );
              } else {
                return Container(
                    child: const Center(
                  child: Text('Failed'),
                ));
              }
            }),
      ),
      drawer: Drawer(
        child: Column(children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              color: Colors.blue[50],
            ),
            child: Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 20, top: 20),
                  child: const Text("saravana"),
                ),
                const SizedBox(
                  width: 25,
                ),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      "Balaji Dayalan",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "000 007",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 75,
          ),
          const Row(
            children: [
              SizedBox(
                width: 25,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                "Home",
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          const Row(
            children: [
              SizedBox(
                width: 25,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                "Company Profile",
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          const Row(
            children: [
              SizedBox(
                width: 25,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                "Attendence",
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          const Row(
            children: [
              SizedBox(
                width: 25,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                "Leave",
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          const Row(
            children: [
              SizedBox(
                width: 25,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                "Medical",
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          const Row(
            children: [
              SizedBox(
                width: 25,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                "Loan",
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          const Row(
            children: [
              SizedBox(
                width: 25,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                "Payslip",
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          const Row(
            children: [
              SizedBox(
                width: 25,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                "View All Suggestions",
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          const Row(
            children: [
              SizedBox(
                width: 25,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                "View All Employee",
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          const Row(
            children: [
              SizedBox(
                width: 25,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                "Documents",
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          const Row(
            children: [
              SizedBox(
                width: 25,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                "Learning",
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          const Row(
            children: [
              SizedBox(
                width: 25,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                "Gallery",
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          const Row(
            children: [
              SizedBox(
                width: 25,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                "Help Desk",
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
