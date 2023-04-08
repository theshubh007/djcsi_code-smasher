import 'package:action_slider/action_slider.dart';
import 'package:auth_employee/Firebase_Services.dart';
import 'package:auth_employee/my_home_page.dart';
import 'package:auth_employee/screen/admin_info_page.dart';
import 'package:flutter/material.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({Key? key}) : super(key: key);

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Stack(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.blueGrey,
            ),
            // Image.asset("assets/homepage.png", fit: BoxFit.cover, height: height,),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 400.0),
              child: Center(
                child: ActionSlider.standard(
                  width: 300.0,
                  icon: const Icon(
                    Icons.done,
                  ),
                  child: const Text('Slide To Confirm'),
                  action: (controller) async {
                    controller.loading();
                    // await Future.delayed(const Duration(seconds: 3));
                    await Firebase_Serv.signInWithGoogle().then((value) async {
                      controller.success();
                      await Future.delayed(const Duration(seconds: 1));
                      
                      await Firebase_Serv.checkif_admin_is_registered(
                              value.user!.uid)
                          .then((value) {
                        if (value == true) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MyHomePage()));
                        } else {
                          //go to forms to take admin info
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const Admin_info_page()));
                        }
                      });
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class DialogBuilder {
  DialogBuilder(this.context);

  final BuildContext context;

  void showLoadingIndicator() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
            onWillPop: () async => false,
            child: const AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              backgroundColor: Colors.black87,
              content: LoadingIndicator(text: 'processing'),
            ));
      },
    );
  }

  void hideOpenDialog() {
    Navigator.of(context).pop();
  }
}

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key, this.text = ''});

  final String text;

  @override
  Widget build(BuildContext context) {
    var displayedText = text;

    return Container(
        padding: const EdgeInsets.all(16),
        color: Colors.black87,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              _getLoadingIndicator(),
              _getHeading(context),
              _getText(displayedText)
            ]));
  }

  Padding _getLoadingIndicator() {
    return const Padding(
        padding: EdgeInsets.only(bottom: 16),
        child: SizedBox(
            width: 32,
            height: 32,
            child: CircularProgressIndicator(strokeWidth: 3)));
  }

  Widget _getHeading(context) {
    return const Padding(
        padding: EdgeInsets.only(bottom: 4),
        child: Text(
          'Please wait …',
          style: TextStyle(color: Colors.white, fontSize: 16),
          textAlign: TextAlign.center,
        ));
  }

  Text _getText(String displayedText) {
    return Text(
      displayedText,
      style: const TextStyle(color: Colors.white, fontSize: 14),
      textAlign: TextAlign.center,
    );
  }
}
