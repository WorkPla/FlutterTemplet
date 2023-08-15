import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_flutter_template/TextField/user_name_textField.dart';
import 'package:my_flutter_template/Buttons/login_button.dart';

class OTPVerify extends StatefulWidget {
  OTPVerify({super.key, required this.title, required this.mobile});
  final String title;
  final String mobile;

  @override
  State<OTPVerify> createState() => _OTPVerifyState();
}

class _OTPVerifyState extends State<OTPVerify> {
  final otpController = TextEditingController();
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
              UserNameField(
                title: "OTP",
                controller: otpController,
                obscureText: true,
              ),
              SizedBox(height: 25.h),
              LoginButton(
                onTap: () {
                  final mobile = widget.mobile;
                  print('tap on send otp to mobile number button $mobile.');
                },
                title: "SEND",
              ),
            ],
          ),
        )));
  }
}
