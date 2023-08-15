// https://www.youtube.com/watch?v=LWteDQes4Kk

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_flutter_template/Buttons/login_button.dart';
import 'package:my_flutter_template/TextField/password_textField.dart';
import 'package:my_flutter_template/TextField/user_name_textField.dart';

class ResponsiveLoginPage extends StatefulWidget {
  ResponsiveLoginPage({super.key, required this.title});
  final String title;

  @override
  State<ResponsiveLoginPage> createState() => _ResponsiveLoginPageState();
}

class _ResponsiveLoginPageState extends State<ResponsiveLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Page title

              SizedBox(height: 44.h),
              Text(
                "Hello! Welcome back. Please Log in  👋🏾",
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff1d232d),
                ),
                textAlign: TextAlign.left,
              ),

              // Text Field

              SizedBox(height: 103.h),
              UserNameField(title: "User Name"),
              SizedBox(height: 16.h),
              PasswordField(),
              SizedBox(height: 29.h),

              // forgot password text

              Text(
                "Forgot your password?",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff3D55D5),
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 45.h),

              // Login button

              LoginButton(onTap: () {
                print('tap on login button.');
              }),
              SizedBox(height: 40.h),

              // Don’t have an account? sign up

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    child: Text(
                      'Don’t have an account? ',
                      style: TextStyle(color: Color(0xff1D232E)),
                    ),
                    onTap: () {
                      print("tap on Not a member? button");
                    },
                  ),
                  const SizedBox(width: 4),
                  InkWell(
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Color(0xff3D55D5),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      print("tap on Register now button");
                    },
                  ),
                ],
              )
            ],
          ),
        )));
  }
}
