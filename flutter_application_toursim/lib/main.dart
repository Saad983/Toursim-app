import 'package:flutter/material.dart';

import 'package:flutter_application_toursim/pages/Favourites.dart';
import 'package:flutter_application_toursim/pages/SignUp.dart';
import 'package:flutter_application_toursim/pages/destination.dart';
import 'package:flutter_application_toursim/pages/homeBar.dart';
import 'package:flutter_application_toursim/pages/homepage.dart';
import 'package:flutter_application_toursim/pages/login.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'pages/forgetPassword.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                inputDecorationTheme: InputDecorationTheme(
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2.0.w),
                      borderRadius: BorderRadius.circular(8.0.r),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.grey, width: 2.0.w),
                        borderRadius: BorderRadius.circular(8.0.r)),
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.grey, width: 2.0.w),
                        borderRadius: BorderRadius.circular(8.0.r))),
                scaffoldBackgroundColor: Colors.blue.shade50,
                useMaterial3: true,
              ),
              home: const LoginPage());
        });
  }
}
