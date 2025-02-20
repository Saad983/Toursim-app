import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserSetting extends StatefulWidget {
  const UserSetting({super.key});

  @override
  State<UserSetting> createState() => _UserSettingState();
}

class _UserSettingState extends State<UserSetting> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Center(
      child: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50.sp),
                child: Image.asset(
                  height: 150.h,
                  width: 100.w,
                  'assets/city1.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              const Positioned(
                  left: 300, bottom: 100, right: 100, child: Icon(Icons.edit)),
            ]),
            SizedBox(
              height: 40.h,
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Change Username',
                labelText: 'Change Username',
                suffixIcon: Icon(Icons.person),
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Change Password',
                labelText: 'Change Password',
                suffixIcon: Icon(Icons.password),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12.r))),
                onPressed: () {},
                child: Text(
                  'Update ',
                  style: TextStyle(
                      color: Colors.blue.shade600,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold),
                )),
            SizedBox(
              height: 40.h,
            ),
          ],
        ),
      ),
    )));
  }
}
