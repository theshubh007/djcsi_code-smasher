import 'dart:ffi';
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
  Future imgFromGallery() async {
    await Permission.photos.request();
    var permissionstatus = await Permission.photos.status;

    if (permissionstatus.isGranted) {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      setState(() {
        if (pickedFile != null) {
          img = File(pickedFile.path);
        } else {
          print('No image selected.');
        }
      });
    } else {
      print('Grant Permission and try again');
    }
  }

  @override
  final ImagePicker picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            img != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.file(
                      img!,
                      width: 100,
                      height: 100,
                      fit: BoxFit.fitHeight,
                    ),
                  )
                : const SizedBox(),
            InkWell(
              onTap: () async {
                await imgFromGallery();
              },
              child: Container(
                  // alignment: Alignment.,
                  width: width * 0.80,
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.all(Radius.circular(07)),
                    // border: Border.all(color: Colors.red)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset("assets/addPhoto.png", height: 85),
                      const SizedBox(
                        width: 18,
                      ),
                      const Text(
                        "Add Photo",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  )),
            ),
            const SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {
                print("OK");
              },
              child: Container(
                  // alignment: Alignment.,
                  width: width * 0.80,
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.all(Radius.circular(07)),
                    // border: Border.all(color: Colors.red)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset("assets/aadharCard.png", height: 90),
                      const SizedBox(
                        width: 9,
                      ),
                      const Text(
                        "Add Aadharcard Photo",
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  )),
            ),
            const SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {
                print("OK");
              },
              child: Container(
                  // alignment: Alignment.,
                  width: width * 0.80,
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.all(Radius.circular(07)),
                    // border: Border.all(color: Colors.red)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset("assets/panCard.png", height: 90),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Add Pancard Photo",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      )),
    );
  }
}
