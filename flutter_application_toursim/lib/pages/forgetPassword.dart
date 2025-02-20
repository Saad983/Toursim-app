import 'package:flutter/material.dart';
import 'package:flutter_application_toursim/pages/login.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetpasswordPage extends StatefulWidget {
  const ForgetpasswordPage({super.key});

  @override
  State<ForgetpasswordPage> createState() => _ForgetpasswordPageState();
}

class _ForgetpasswordPageState extends State<ForgetpasswordPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
          child: Padding(
        padding: EdgeInsets.only(right: 20.w, left: 20.w),
        child: Container(
          height: 500.h,
          width: 500.w,
          decoration: BoxDecoration(
              color: Colors.white54, // Background color
              borderRadius:
                  BorderRadius.circular(50.0), // Circular border radius
              border: Border.all(color: Colors.grey // Border color
                  // Border width
                  )),
          child: Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  'Forgot your password',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.sp,
                      wordSpacing: 2.0.sp,
                      height: 2.0.h,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  "' Please enter the email address you'd like your \n password  reset information sent to'",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.sp,
                      wordSpacing: 2.0.sp,
                      height: 2.0.h,
                      fontWeight: FontWeight.normal),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  '   Enter email address',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.sp,
                      wordSpacing: 2.0.sp,
                      height: 2.0.h,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10.h,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: '   Enter email address',
                      hintText: '   Enter email address',
                      suffixIcon: Icon(Icons.email_outlined)),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  height: 60.h,
                  width: 400.w,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10.0.r),
                      border: Border.all(color: Colors.grey)),
                  child: Center(
                    child: Text(
                      '   Request reset links',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.sp,
                          wordSpacing: 2.0.sp,
                          height: 2.0.h,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ));
                    },
                    child: Text(
                      '  Back To Login',
                      style: TextStyle(
                          color: Colors.blue.shade400,
                          fontSize: 15.sp,
                          wordSpacing: 2.0.sp,
                          height: 2.0.h,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    ));
  }
}
