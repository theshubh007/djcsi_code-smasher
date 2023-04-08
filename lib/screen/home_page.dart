import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? img;
  final ImagePicker _picker = ImagePicker();
  
  File? selectedImage;
  String base64Image = "";

  Future<void> chooseImage(type) async {
    // ignore: prefer_typing_uninitialized_variables
    var image;
    if (type == "camera") {
      image = await ImagePicker()
          .pickImage(source: ImageSource.camera, imageQuality: 10);
    } else {
      image = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 25);
    }
    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
        base64Image = base64Encode(selectedImage!.readAsBytesSync());
        // won't have any error now
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xff6096B4),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.red,
              child: Padding(
                padding: const EdgeInsets.all(8), // Border radius
                child: ClipOval(
                    child: selectedImage != null
                        ? Image.file(
                            selectedImage!,
                            fit: BoxFit.cover,
                            height: 100,
                            width: 100,
                          )
                        : Image.network(
                            'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg',
                            fit: BoxFit.cover,
                            height: 100,
                            width: 100,
                          )),
              ),
            ),
            InkWell(
              onTap: () async {
                chooseImage("galary");
              },
              child: Card(
                color: Colors.transparent,
                elevation: 10,
                child: Container(
                    width: width * 0.80,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.lightBlue.shade100,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: Colors.white)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          "assets/addPhoto.png",
                          height: 80,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          width: 18,
                        ),
                        const Text(
                          "Upload Photo",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontFamily: "Anuphan"),
                        ),
                      ],
                    )),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () async {
                // var status = await Permission.photos.status;
                // print(status);
                // await picker.pickImage(source: ImageSource.gallery);
              },
              child: Card(
                color: Colors.transparent,
                elevation: 10,
                child: Container(
                    // alignment: Alignment.,
                    width: width * 0.80,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.lightBlue.shade100,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: Colors.white)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset("assets/aadharCard.png", height: 90),
                        const SizedBox(
                          width: 9,
                        ),
                        const Text(
                          "Upload Aadharcard ",
                          style: TextStyle(fontSize: 16, fontFamily: "Anuphan"),
                        ),
                      ],
                    )),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () async {
                // var status = await Permission.photos.status;
                // print(status);
                // await picker.pickImage(source: ImageSource.gallery);
              },
              child: Card(
                color: Colors.transparent,
                elevation: 10,
                child: Container(
                    // alignment: Alignment.,
                    width: width * 0.80,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.lightBlue.shade100,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: Colors.white)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset("assets/panCard.png", height: 90),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "Upload Pancard",
                          style: TextStyle(fontSize: 16, fontFamily: "Anuphan"),
                        ),
                      ],
                    )),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
