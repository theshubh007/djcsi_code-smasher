import 'package:flutter/material.dart';


class ListOfEmployee extends StatefulWidget {
  const ListOfEmployee({Key? key}) : super(key: key);

  @override
  State<ListOfEmployee> createState() => _ListOfEmployeeState();
}

class _ListOfEmployeeState extends State<ListOfEmployee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text("HELLO"),
        ),
      ),
    );;
  }
}
