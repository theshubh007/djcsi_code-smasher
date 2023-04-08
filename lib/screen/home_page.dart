import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  final ImagePicker picker = ImagePicker();
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xff6096B4),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: ()async{
                  var status = await Permission.photos.status;
                  print(status);
                  await picker.pickImage(source: ImageSource.gallery);
                },
                child: Card(
                  color: Colors.transparent,
                  elevation: 10,
                  child: Container(
                      width: width * 0.80,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.lightBlue.shade100,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.all(color: Colors.white)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset("assets/addPhoto.png", height: 80, color: Colors.black,),
                          SizedBox(width: 18,),
                          Text("Upload Photo", style: TextStyle(fontSize: 16, color: Colors.black, fontFamily: "Anuphan"),),
                        ],
                      )
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: ()async{
                  var status = await Permission.photos.status;
                  print(status);
                  await picker.pickImage(source: ImageSource.gallery);
                },
                child: Card(
                  color: Colors.transparent,
                  elevation: 10,
                  child: Container(
                    // alignment: Alignment.,
                      width: width * 0.80,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.lightBlue.shade100,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: Colors.white)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset("assets/aadharCard.png", height: 90),
                          SizedBox(width: 9,),
                          Text("Upload Aadharcard ", style: TextStyle(fontSize: 16, fontFamily: "Anuphan"),),
                        ],
                      )
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: ()async{
                  var status = await Permission.photos.status;
                  print(status);
                  await picker.pickImage(source: ImageSource.gallery);
                },
                child: Card(
                  color: Colors.transparent,
                  elevation: 10,
                  child: Container(
                    // alignment: Alignment.,
                    width: width * 0.80,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.lightBlue.shade100,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: Colors.white)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset("assets/panCard.png", height: 90),
                        SizedBox(width: 10,),
                        Text("Upload Pancard", style: TextStyle(fontSize: 16, fontFamily: "Anuphan"),),
                      ],
                    )
                  ),
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}
