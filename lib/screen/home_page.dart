import 'dart:io';
import 'package:auth_employee/Firebase_Services.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _adharController = TextEditingController();
  final TextEditingController _experienceController = TextEditingController();
  final TextEditingController _experticeController = TextEditingController();
  final TextEditingController _pancardController = TextEditingController();

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

  void clearcontroller() {
    _nameController.clear();
    _adharController.clear();
    _experienceController.clear();
    _experticeController.clear();
    _pancardController.clear();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Employee name",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: _nameController,
                          decoration: const InputDecoration(
                            hintText: "Enter name of the employee",
                            border: OutlineInputBorder(),
                            focusColor: Colors.white10,
                            focusedBorder: OutlineInputBorder(
                              // borderRadius: BorderRadius.circular(25.0),
                              borderSide: BorderSide(
                                color: Colors.black38,
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Employee adhar number",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: _adharController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            hintText: "Enter adhar number of employee",
                            border: OutlineInputBorder(),
                            focusColor: Colors.white10,
                            focusedBorder: OutlineInputBorder(
                              // borderRadius: BorderRadius.circular(25.0),
                              borderSide: BorderSide(
                                color: Colors.black38,
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Employee PAN number",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: _pancardController,
                          decoration: const InputDecoration(
                            hintText: "Enter PAN number of employee",
                            border: OutlineInputBorder(),
                            focusColor: Colors.white10,
                            focusedBorder: OutlineInputBorder(
                              // borderRadius: BorderRadius.circular(25.0),
                              borderSide: BorderSide(
                                color: Colors.black38,
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Employee Year of experience",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: _experienceController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            hintText: "Enter Year of experience of employee",
                            border: OutlineInputBorder(),
                            focusColor: Colors.white10,
                            focusedBorder: OutlineInputBorder(
                              // borderRadius: BorderRadius.circular(25.0),
                              borderSide: BorderSide(
                                color: Colors.black38,
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Employee Expertice",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: _experticeController,
                          decoration: const InputDecoration(
                            hintText: "Enter expertice of employee",
                            border: OutlineInputBorder(),
                            focusColor: Colors.white10,
                            focusedBorder: OutlineInputBorder(
                              // borderRadius: BorderRadius.circular(25.0),
                              borderSide: BorderSide(
                                color: Colors.black38,
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        )
                      ],
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          bool present = await Firebase_Serv
                              .check_employee_is_already_registered(
                                  _adharController.text.trim(),
                                  _pancardController.text.trim());

                          if (present) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        "Employee is already registered with this adhar number or pancard number")));
                          } else {
                            await Firebase_Serv.upload_employee_data_bothplace(
                                _nameController.text.trim(),
                                _adharController.text.trim(),
                                _pancardController.text.trim(),
                                _experienceController.text.trim(),
                                _experticeController.text.trim());
                            setState(() {
                              clearcontroller();
                            });
                          }
                        }
                      },
                      child: const Text("Submit")),
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
                  // InkWell(
                  //   onTap: () {
                  //     print("OK");
                  //   },
                  //   child: Container(
                  //       // alignment: Alignment.,
                  //       width: width * 0.80,
                  //       padding: const EdgeInsets.all(10),
                  //       decoration: const BoxDecoration(
                  //         color: Colors.black12,
                  //         borderRadius: BorderRadius.all(Radius.circular(07)),
                  //         // border: Border.all(color: Colors.red)
                  //       ),
                  //       child: Row(
                  //         mainAxisAlignment: MainAxisAlignment.start,
                  //         children: [
                  //           Image.asset("assets/aadharCard.png", height: 90),
                  //           const SizedBox(
                  //             width: 9,
                  //           ),
                  //           const Text(
                  //             "Add Aadharcard Photo",
                  //             style: TextStyle(fontSize: 18),
                  //           ),
                  //         ],
                  //       )),
                  // ),
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
                        padding: const EdgeInsets.all(8),
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
            ),
          ),
        )),
      ),
    );
  }
}
