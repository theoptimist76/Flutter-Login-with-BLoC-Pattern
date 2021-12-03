// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bloc_pattern_login/pagetwo.dart';
import 'package:flutter/material.dart';

import 'bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  changePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PageTwo()),
    );
  }

  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final bloc = Bloc();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 300.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'BLOC LOGIN',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 45.0,
                              color: Colors.teal),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  StreamBuilder(
                      stream: bloc.email,
                      builder: (context, snapshot) {
                        return TextField(
                          onChanged: bloc.emailChanged,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            border: OutlineInputBorder(),
                            hintText: "Enter email",
                            labelText: "Email",
                            errorText: "snapshot.error",
                          ),
                        );
                      }),
                  SizedBox(
                    height: 10.0,
                  ),
                  StreamBuilder(
                      stream: bloc.password,
                      builder: (context, snapshot) {
                        return TextField(
                          onChanged: bloc.passwordChanged,
                          decoration: InputDecoration(
                            fillColor: Colors.teal,
                            border: OutlineInputBorder(),
                            hintText: "Enter password",
                            labelText: "Password",
                            errorText: "snapshot.error",
                          ),
                        );
                      }),
                  SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    height: 50.0,
                    width: double.infinity,
                    child: StreamBuilder<bool>(
                        stream: bloc.submitCheck,
                        builder: (context, snapshot) {
                          return FlatButton(
                            onPressed: () => snapshot.hasData
                                ? () => changePage(context)
                                : null,
                            color: Colors.teal,
                            child: Text(
                              "LOGIN",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                              ),
                            ),
                          );
                        }),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
