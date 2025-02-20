import 'package:flutter/material.dart';
import 'package:flutter_application_toursim/pages/SignUp.dart';
import 'package:flutter_application_toursim/pages/forgetPassword.dart';
import 'package:flutter_application_toursim/pages/homeBar.dart';
import 'package:flutter_application_toursim/services/NetworkHelper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String pwd = '';
  String msg = '';

  // Validation method to ensure fields are filled
  validate() {
    setState(() {
      if (email == '') {
        msg = 'Email must be entered';
      } else if (pwd == '') {
        msg = 'Password must be entered';
      } else {
        _authLogin(); // Call login function
      }
    });
  }

  // Login API integration
  Future<http.Response> _authLogin() async {
    final http.Response response = await Network()
        .postData({"email": email, "pwd": pwd}, '/authLogin.php');

    print('Response: ${jsonDecode(response.body)}');

    setState(() {
      var res = jsonDecode(response.body);
      msg = res['msg']; // Extract role or error message

      if (msg == 'user') {
        Navigator.push(
            context,
            MaterialPageRoute(
                fullscreenDialog: true,
                builder: (context) => Homebar(
                      title: '',
                      type: msg, // Pass 'user' role
                    )));
      } else if (msg == 'admin') {
        Navigator.push(
            context,
            MaterialPageRoute(
                //  Homebar main kuch pass he nh kiya title main ye bhi hoga ? G kses?kesy chgaly ga kya aarha hai kese paaskarna hai batao G krna hahai
                fullscreenDialog: true,
                builder: (context) => Homebar(
                      title: msg,
                      type: msg, // Pass 'admin' role
                    )));
      } else {
        msg = "Invalid User ID or Password"; // Handle errors
      }
    });

    return response;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Email Input Field
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: SizedBox(
                height: 65.h,
                width: 400.w,
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Enter Email',
                    labelText: 'Enter Email',
                    suffixIcon: Icon(Icons.person),
                  ),
                  onChanged: (value) {
                    setState(() {
                      email = value.isEmpty ? '' : value;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 20.h),

            // Password Input Field
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: SizedBox(
                height: 65.h,
                width: 400.w,
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Enter Password',
                    labelText: 'Enter Password',
                    suffixIcon: Icon(Icons.password),
                  ),
                  obscureText: true,
                  onChanged: (value) {
                    setState(() {
                      pwd = value.isEmpty ? '' : value;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 30.h),

            // Forget Password Button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12.r)),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ForgetpasswordPage()));
                  },
                  child: Text(
                    'Forget Password?',
                    style: TextStyle(
                        color: Colors.blue.shade600,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30.h),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                fixedSize: Size(380.w, 70.h),
                backgroundColor: Colors.blue.shade600,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10.r)),
              ),
              onPressed: validate,
              child: Text(
                'Log In',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold),
              ),
            ),

            SizedBox(height: 40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '  Don`t have an account yet? ',
                  style: TextStyle(
                      color: Colors.blue.shade700,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold),
                ),
                InkWell(
                  child: Text(
                    ' Create one ',
                    style: TextStyle(
                        color: Colors.blue.shade900,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    final route = MaterialPageRoute(
                      builder: (context) => const SignupPage(),
                    );
                    Navigator.push(context, route);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
