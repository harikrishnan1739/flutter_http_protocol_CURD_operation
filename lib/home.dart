import 'package:flutter/material.dart';
import 'package:new_http_project_flutter/httpProvider.dart';
import 'package:new_http_project_flutter/userdetail.dart';
import 'dart:convert';
import 'dart:io';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'http CRUD operation',
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        ),
        leading: null,
        elevation: 0,
        backgroundColor: Colors.purple,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // ignore: avoid_unnecessary_containers
          Container(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: GestureDetector(
                  onTap: () async {
                    var response =
                        await BaseProvider().get('/users').catchError((err) {});
                    if (response == null) {
                      return;
                    } else {
                      debugPrint("successful");
                    }
                    var users = userFromJson(response);
                    debugPrint("User Count : ${users.length.toString()}");
                  },
                  child: Container(
                    height: 60,
                    width: 380,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.purple,
                          spreadRadius: 1,
                          blurRadius: 8,
                          offset: Offset(4, 4),
                        ),
                        BoxShadow(
                          color: Colors.white,
                          spreadRadius: 2,
                          blurRadius: 8,
                          offset: Offset(-4, -4),
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        "GET \n fitching data",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: GestureDetector(
                  onTap: () async {
                    var user = User();
                    var response = await BaseProvider()
                        .post('/users', user)
                        .catchError((err) {});
                    if (response == null) {
                      return debugPrint('something went wrong');
                    }
                    debugPrint('successful:');
                  },
                  child: Container(
                    height: 60,
                    width: 380,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.purple,
                          spreadRadius: 1,
                          blurRadius: 8,
                          offset: Offset(4, 4),
                        ),
                        BoxShadow(
                          color: Colors.white,
                          spreadRadius: 2,
                          blurRadius: 8,
                          offset: Offset(-4, -4),
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        "POST \n add user",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: GestureDetector(
                  onTap: () async {
                    var id = 2;
                    var userinfo = User();
                    var response = await BaseProvider()
                        .put('/users $id', userinfo)
                        .catchError((err) {});
                    if (response == null) {
                      return debugPrint('Empty');
                    } else {
                      debugPrint("successfully added");
                    }
                    var users = userFromJson(response);
                    debugPrint("User information : ${users.length.toString()}");
                  },
                  child: Container(
                    height: 60,
                    width: 380,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.purple,
                          spreadRadius: 1,
                          blurRadius: 8,
                          offset: Offset(4, 4),
                        ),
                        BoxShadow(
                          color: Colors.white,
                          spreadRadius: 2,
                          blurRadius: 8,
                          offset: Offset(-4, -4),
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        "PUT \n edit user",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.amber),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: GestureDetector(
                  onTap: () async {
                    var id = User().id;
                    var response = await BaseProvider()
                        .delete('/users$id')
                        .catchError((err) {});
                    if (response == null) {
                      return debugPrint('something went wrong');
                    } else {
                      debugPrint("successfully deleleted");
                    }
                  },
                  child: Container(
                    height: 60,
                    width: 380,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.purple,
                          spreadRadius: 1,
                          blurRadius: 8,
                          offset: Offset(4, 4),
                        ),
                        BoxShadow(
                          color: Colors.white,
                          spreadRadius: 2,
                          blurRadius: 8,
                          offset: Offset(-4, -4),
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        "DEL \n delete data",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
