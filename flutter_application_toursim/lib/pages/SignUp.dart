import 'package:flutter/material.dart';
import 'package:flutter_application_toursim/pages/login.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../services/NetworkHelper.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String username = "";
  String email = "";
  String password = "";
  String msg = "";

  final _formKey = GlobalKey<FormState>();

  validate() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        //  msg = "Your Registration has been completed please signIn";
        _addUserName();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          'Your Registration has been completed please signIn',
          style: TextStyle(
              fontSize: 12, color: Colors.blue, fontWeight: FontWeight.bold),
        )));
      });
    }
  }

  /// Shows a confirmation dialog box
  void showConDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Information',
            style: TextStyle(
                fontSize: 32, color: Colors.blue, fontWeight: FontWeight.bold),
          ),
          content: const Text(
            'Do you want to submit this record?',
            style: TextStyle(
                fontSize: 16, color: Colors.red, fontWeight: FontWeight.bold),
          ),
          actions: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: MaterialButton(
                    onPressed: () {
                      validate();
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Ok',
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                    ),
                    color: Colors.grey,
                    minWidth: 80,
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.red,
                        fontWeight: FontWeight.bold),
                  ),
                  color: Colors.grey,
                  minWidth: 100,
                ),
              ],
            )
          ],
        );
      },
    );
  }

  /// Sends data to the API
  Future<http.Response> _addUserName() async {
    final http.Response response = await Network().postData({
      "name": username,
      "email": email,
      "password": password,
    }, '/addUserName.php');

    print('response ---- ${jsonDecode(response.body)}');

    setState(() {
      var res = jsonDecode(response.body);
      msg = res['msg'];
    });

    return response;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/city1.jpg'), fit: BoxFit.cover),
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: SizedBox(
                    height: 65.h,
                    width: 400.w,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Name',
                        labelText: 'Name',
                        suffixIcon: Icon(Icons.person),
                      ),
                      onChanged: (value) {
                        setState(() {
                          username = value;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "User Name must be entered";
                        } else if (RegExp(r'(?=.*?[0-9])').hasMatch(value)) {
                          return "User Name cannot contain numbers";
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: SizedBox(
                    height: 65.h,
                    width: 400.w,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Email',
                        labelText: 'Email',
                        suffixIcon: Icon(Icons.email),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {
                        setState(() {
                          email = value;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Email must be entered";
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: SizedBox(
                    height: 65.h,
                    width: 400.w,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Password',
                        labelText: 'Password',
                        suffixIcon: Icon(Icons.password),
                      ),
                      obscureText: true,
                      onChanged: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password must be entered";
                        } else if (value.length < 6) {
                          return "Password must be at least 6 characters long";
                        } else if (!RegExp(
                                r'(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])')
                            .hasMatch(value)) {
                          return "Password must include upper, lower, and digits";
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade600,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    fixedSize: Size(380.w, 70.h),
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  onPressed: () {
                    showConDialog(context);
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
