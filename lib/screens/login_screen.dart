import 'package:bustle_beats/screens/find_song_screen.dart';
import 'package:bustle_beats/utils/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginWithPhoneState createState() => _LoginWithPhoneState();
}

class _LoginWithPhoneState extends State<LoginScreen> {
  TextEditingController phoneController = TextEditingController();
  // TextEditingController(text: "+923028997122");
  TextEditingController otpController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  bool otpVisibility = false;
  bool _isLoading = false;

  String verificationID = "";

  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
    otpController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to Bustle Beats',
              style: TextStyle(color: secondaryAppColor, fontSize: 30),
            ),
            const SizedBox(
              height: 150,
            ),
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(
                  labelText: "Phone number",
                  hintText: "e.g +233573456732",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: secondaryAppColor),
                  )),
              keyboardType: TextInputType.phone,
            ),
            Visibility(
              visible: otpVisibility,
              child: TextField(
                controller: otpController,
                decoration: const InputDecoration(
                    labelText: 'OTP',
                    hintText: 'Enter OTP',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: secondaryAppColor),
                    )),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            // ElevatedButton(
            //     onPressed: () {
            //       if (otpVisibility) {
            //         verifyOTP();
            //       } else {
            //         loginWithPhone();
            //       }
            //     },
            //     child: Text(otpVisibility ? "Verify" : "Login")),
            InkWell(
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: const ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                  ),
                  color: secondaryAppColor,
                ),
                child: !_isLoading
                    ? Text(
                        otpVisibility ? "Verify" : "Login",
                        style: const TextStyle(fontSize: 20),
                      )
                    : const CircularProgressIndicator(
                        color: Colors.white,
                      ),
              ),
              onTap: () {
                if (otpVisibility) {
                  verifyOTP();
                } else {
                  loginWithPhone();
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  void loginWithPhone() async {
    setState(() {
      _isLoading = true;
    });

    auth.verifyPhoneNumber(
      phoneNumber: phoneController.text,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
      },
      codeSent: (String verificationId, int? resendToken) {
        setState(() {
          _isLoading = false;
        });
        otpVisibility = true;
        verificationID = verificationId;
        setState(() {});
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  void verifyOTP() async {
    setState(() {
      _isLoading = true;
    });
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationID, smsCode: otpController.text);

    await auth.signInWithCredential(credential).then((value) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: ((context) => FindSongScreen())));
    });
  }
}
