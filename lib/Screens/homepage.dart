import 'package:flutter/material.dart';

import '../pagetwo.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  changePage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PageTwo()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
