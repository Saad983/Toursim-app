import 'dart:async';
import 'dart:convert';
import 'dart:core';

import 'package:flutter/material.dart';

import 'package:flutter_application_toursim/pages/GetDesByName.dart';
import 'package:flutter_application_toursim/pages/SignUp.dart';
import 'package:flutter_application_toursim/pages/bookedDestination.dart';
import 'package:flutter_application_toursim/pages/cityDetail.dart';
import 'package:flutter_application_toursim/pages/confirm_booking.dart';
import 'package:flutter_application_toursim/pages/homeBar.dart';
import 'package:flutter_application_toursim/pages/login.dart';
import 'package:flutter_application_toursim/services/NetworkHelper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({super.key, required this.title});

  @override
  State<HomePage> createState() => _HomePageState();
}

List<Map<String, dynamic>> favorites = [];

String name = '';
final PageController pCtrl = PageController();

final List<String> imageList = [
  'images/Quetta.jpg',
  'images/Islamabad.jpg',
  'images/Multan.jpg',
  'images/Peshawar.jpg',
];

class _HomePageState extends State<HomePage> {
  int _currenPage = 0;
  Timer? _timer;

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (_currenPage < imageList.length - 1) {
        _currenPage++;
      } else {
        _currenPage = 0;
      }
      pCtrl.animateToPage(_currenPage,
          duration: const Duration(microseconds: 400),
          curve: Curves.easeInOutCubic);
    });
  }

  List city = [];

  Future<http.Response> _getCities() async {
    final http.Response response = await Network().postData({
      'O': '0',
      'S': '10',
    }, '/getCities.php');
    print('response ----${jsonDecode(response.body)}');

    setState(() {
      var res = jsonDecode(response.body);
      setState(() {
        city = res['product'];
        // Yahan per City likha howa tha wo bhi bagair "" quotes ky jb ky data product ky naam sy aarha hai API sy
      });
    });
    return response;
  }

  @override
  void initState() {
    _getCities();
    super.initState();
    _startAutoScroll();
  }

  @override
  void dispose() {
    _timer?.cancel();
    pCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
          title: TextFormField(
            decoration: const InputDecoration(
                hintText: 'Search here', labelText: 'Search here'),
            onChanged: (value) {
              setState(() {
                if (value.isEmpty) {
                  name = '';
                } else {
                  name = value;
                }
              });
            },
          ),
          leading: PopupMenuButton(
              icon: const Icon(Icons.menu),
              itemBuilder: (context) {
                return [
                  const PopupMenuItem<int>(
                    value: 0,
                    child: Row(children: [
                      Text("LogOut    "),
                      Icon(Icons.logout_rounded)
                    ]),
                  ),
                ];
              },
              onSelected: (value) {
                if (value == 0) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          fullscreenDialog: true,
                          builder: (context) => const LoginPage()));
                } else if (value == 1) {
                  {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            fullscreenDialog: true,
                            builder: (context) => const BookedDestination(
                                  price: 100,
                                  destName: 'Karachi',
                                  destId: 1,
                                  image: '',
                                )));
                  }
                }
              }),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        fullscreenDialog: true,
                        builder: (context) => DestinationByName(title: name)));
              },
            ),
          ]),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        SizedBox(
          height: 250.h,
          child: PageView.builder(
            controller: pCtrl,
            itemCount: imageList.length,
            itemBuilder: (context, index) {
              return Image.asset(
                imageList[index],
                fit: BoxFit.cover,
                width: double.infinity,
              );
            },
          ),
        ),
        SizedBox(height: 30.h),
        Expanded(
          child: ListView.builder(
            itemCount: 8,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final cityItem = city[
                  index]; //ye kyuon likha  direct loop sy is liye chal rha tha aaap ny upper galat likha tha
              // Initialize krny ky liye Ky mujhy jo items chaheye wo city list ky is index per hai is main sy choose krny hain sir ne tohye nhi kia wahah toh direct loop chala tha
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.h, vertical: 15.w),
                child: GestureDetector(
                  child: Column(children: [
                    Container(
                      height: 200.h,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(color: Colors.black, blurRadius: 1.r),
                          ],
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(15.r),
                          image: DecorationImage(
                            image: AssetImage(
                              '${cityItem["images"]}',
                            ),
                            fit: BoxFit.cover,
                            //  opacity: 0.7
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            cityItem['name'].toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ]),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            fullscreenDialog: true,
                            builder: (context) => CityDetail(
                                  title:
                                      cityItem["city_id"].toString(), // yahan
                                )));
                  },
                ),
              );
            },
          ),
        ),
      ]),
    ));
  }
}
