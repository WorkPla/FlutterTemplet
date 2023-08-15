import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_flutter_template/TextField/user_name_textField.dart';
import 'package:my_flutter_template/Buttons/login_button.dart';
import 'package:my_flutter_template/features/firebase_auth/otp_verify.dart';

class MobileInfo extends StatefulWidget {
  MobileInfo({super.key, required this.title});
  final String title;

  @override
  State<MobileInfo> createState() => _MobileInfoState();
}

class _MobileInfoState extends State<MobileInfo> {
  final usernameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
                "Please provide your phone number!",
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff1d232d),
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 44.h),
              UserNameField(
                title: "Name",
                controller: null,
                obscureText: false,
              ),
              SizedBox(height: 13.h),
              UserNameField(
                title: "Email",
                controller: null,
                obscureText: false,
              ),
              SizedBox(height: 13.h),
              UserNameField(
                title: "Mobile Number",
                controller: usernameController,
                obscureText: false,
              ),
              SizedBox(height: 25.h),
              LoginButton(
                onTap: () {
                  final mobile = usernameController.text;
                  print('tap on send otp to $mobile');

                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new OTPVerify(
                                title: "Verify OTP",
                                mobile: '$mobile',
                              )));
                },
                title: "SEND",
              ),
            ],
          ),
        )));
  }
}
