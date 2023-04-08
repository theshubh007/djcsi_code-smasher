import 'dart:ffi';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: (){
                  print("OK");
                },
                child: Container(
                  // alignment: Alignment.,
                    width: width * 0.80,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.all(Radius.circular(07)),
                      // border: Border.all(color: Colors.red)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.add, size: 40,),
                        SizedBox(width: 18,),
                        Text("Add Photo", style: TextStyle(fontSize: 20),),
                      ],
                    )
                ),
              ),
              SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: (){
                  print("OK");
                },
                child: Container(
                  // alignment: Alignment.,
                    width: width * 0.80,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.all(Radius.circular(07)),
                      // border: Border.all(color: Colors.red)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.add, size: 40,),
                        SizedBox(width: 10,),
                        Text("Add Pancard Photo", style: TextStyle(fontSize: 20),),
                      ],
                    )
                ),
              ),
              SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: (){
                  print("OK");
                },
                child: Container(
                  // alignment: Alignment.,
                  width: width * 0.80,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.all(Radius.circular(07)),
                      // border: Border.all(color: Colors.red)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.add, size: 40,),
                      SizedBox(width: 10,),
                      Text("Add Pancard Photo", style: TextStyle(fontSize: 20),),
                    ],
                  )
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}
