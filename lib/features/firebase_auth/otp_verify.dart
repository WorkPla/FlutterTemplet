import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_flutter_template/TextField/otp_text_field.dart';
import 'package:my_flutter_template/Buttons/login_button.dart';

// https://medium.com/@ufukcatalca/generate-apns-certificate-for-ios-push-notifications-ada9234d4c09
// https://blog.openreplay.com/phone-based-authentication-in-flutter-with-firebase/
class OTPVerify extends StatefulWidget {
  OTPVerify({super.key, required this.title, required this.mobile});
  final String title;
  final String mobile;
  var otpCode = '';

  @override
  State<OTPVerify> createState() => _OTPVerifyState();
}

class _OTPVerifyState extends State<OTPVerify> {
  final otpController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  var otpFieldVisibility = false;
  var receivedID = '';
  var otpCode = '';

  void verifyUserPhoneNumber() {
    print('Firebase verifyUserPhoneNumber');
    auth.verifyPhoneNumber(
      phoneNumber: widget.mobile,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential).then(
              (value) => print('Logged In Successfully'),
            );
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
      },
      codeSent: (String verificationId, int? resendToken) {
        receivedID = verificationId;
        otpFieldVisibility = true;
        setState(() {});
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        receivedID = verificationId;
      },
    );
  }

  Future<void> verifyOTPCode() async {
    print('Firebase verifyOTPCode <$otpCode>');
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: receivedID,
      smsCode: otpCode,
    );
    await auth
        .signInWithCredential(credential)
        .then((value) => print('User Login In Successful'));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: new AppBar(
          title: new Text(widget.title),
        ),
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 44.h),
              Text(
                "Please provide the OTP to verify!",
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff1d232d),
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 44.h),
              PinputExample(
                getOtpValue: (String value) {
                  otpCode = value;
                },
              ),
              SizedBox(height: 25.h),
              LoginButton(
                onTap: () {
                  final mobile = widget.mobile;
                  print(
                      'tap on send otp to mobile number button $mobile && $receivedID.');
                  if (otpFieldVisibility) {
                    verifyOTPCode();
                  } else {
                    verifyUserPhoneNumber();
                  }

                  FocusManager.instance.primaryFocus?.unfocus();
                },
                title: "SEND",
              ),
            ],
          ),
        )));
  }
}
