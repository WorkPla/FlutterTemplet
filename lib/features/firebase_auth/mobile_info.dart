import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
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
  var userPhoneNo;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        // https://stackoverflow.com/questions/67571423/bottom-overflowed-by-x-pixels-when-showing-keyboard
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
              IntlPhoneField(
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
                initialCountryCode: 'BD',
                onChanged: (phone) {
                  print(phone.completeNumber);
                  userPhoneNo = phone.completeNumber;
                },
                validator: (value) {
                  print(value);
                  if (value != null && value.completeNumber.length == 14) {
                    // hide keyboard when found a valid number
                    FocusManager.instance.primaryFocus?.unfocus();
                  }
                  return null;
                },
              ),
              SizedBox(height: 25.h),
              LoginButton(
                onTap: () {
                  print('tap on send otp to $userPhoneNo');

                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new OTPVerify(
                                title: "Verify OTP",
                                mobile: '$userPhoneNo',
                              )));
                },
                title: "SEND",
              ),
            ],
          ),
        )));
  }
}
