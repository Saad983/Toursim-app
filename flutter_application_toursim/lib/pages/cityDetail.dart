import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_toursim/pages/DestinationDetail.dart';
import 'package:flutter_application_toursim/pages/GetDesByName.dart';
import 'package:flutter_application_toursim/pages/homepage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application_toursim/services/NetworkHelper.dart';
import 'package:http/http.dart' as http;

class CityDetail extends StatefulWidget {
  const CityDetail({super.key, required this.title});

  final String title;
  @override
  State<CityDetail> createState() => _CityDetailState();
}

class _CityDetailState extends State<CityDetail> {
  List city = [];
  List citybyId = [];

  Future<http.Response> _getCitiesbyId() async {
    final http.Response response =
        await Network().postData({'id': widget.title}, '/getCityById.php');
    print('response ----${jsonDecode(response.body)}');

    setState(() {
      var res = jsonDecode(response.body);
      setState(() {
        citybyId = res['city'];
        // Yahan per City likha howa tha wo bhi bagair "" quotes ky jb ky data product ky naam sy aarha hai API sy
      });
    });
    return response;
  }

  Future<http.Response> _getCities() async {
    final http.Response response = await Network().postData(
        {'id': widget.title, 'O': '0', 'S': '3'}, '/getDesByCity.php');
    print('response ----${jsonDecode(response.body)}');

    setState(() {
      var res =
          jsonDecode(response.body); // DOne hai ab Bs alignment sahi krlo UI
      setState(() {
        city = res['destinations'];
        // Yahan per City likha howa tha wo bhi bagair "" quotes ky jb ky data product ky naam sy aarha hai API sy
      });
    });
    return response;
  }

  @override
  void initState() {
    _getCitiesbyId();
    _getCities();
    super.initState();
  }

  destinationDetailPage() {
    // Navigator.push(
    // context,
//MaterialPageRoute(
    //     fullscreenDialog: true,
    //    builder: (context) => Destinationdetail(
//destinationId: 'destination_$index',
    //      )));
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
            actions: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          fullscreenDialog: true,
                          builder: (context) =>
                              DestinationByName(title: name)));
                },
              ),
            ]),
        body: SingleChildScrollView(
          child: Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10.w, right: 10.w),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    height: 300.h,
                    width: double.infinity,
                    child: Center(
                      child: city.isNotEmpty && city[0]["image"] != null
                          ? Image.asset(
                              '${city[0]["image"]}',
                              fit: BoxFit.cover,
                            )
                          : const Text("Image not available"),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        citybyId[0]['name'].toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    citybyId[0]['description'].toString(),
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.normal),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  _gridForCities(),
                ],
              ), // S,hows a loader until data is available
            ),
          ),
        ),
      ),
    );
  }

  _gridForCities() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: city.length,
      itemBuilder: (context, index) {
        var item = city[index];
        return Padding(
          padding: EdgeInsets.only(bottom: 15.h),
          child: Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Destinationdetail(
                            title: item['destination_id'].toString()),
                      ));
                },
                child: Container(
                  height: 170.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 5.w),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.h),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15.r),
                              child: Opacity(
                                opacity: 0.9,
                                child: Image.asset(
                                  '${item["image"]}',
                                  height: 130.h,
                                  width: 100.w,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 20.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                item['destination_name']
                                    .toString(), // Replace with actual data key
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${item['description'].toString().substring(0, 25)}...',
                                    // Replace with actual data key
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 40.w,
                                  ),
                                  Text(
                                    'Rs.25,999', // Replace with actual price data
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    '4.5', // Replace or dynamically generate rating
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  SizedBox(width: 10.w),
                                  Icon(
                                    Icons.star,
                                    size: 20.sp,
                                    color: Colors.yellow.shade700,
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 20.sp,
                                    color: Colors.yellow.shade700,
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 20.sp,
                                    color: Colors.yellow.shade700,
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.h),
                              Row(
                                children: [
                                  Container(
                                      height: 30.h,
                                      width: 70.w,
                                      decoration: BoxDecoration(
                                          color: Colors.blue.shade100,
                                          borderRadius:
                                              BorderRadius.circular(15.r)),
                                      child: const Center(
                                          child: Text('11:00 PM'))),
                                  SizedBox(width: 10.w),
                                  Container(
                                      height: 30.h,
                                      width: 70.w,
                                      decoration: BoxDecoration(
                                          color: Colors.blue.shade100,
                                          borderRadius:
                                              BorderRadius.circular(15.r)),
                                      child: const Center(
                                          child: Text('01:00 PM'))),
                                ],
                              )
                            ],
                          ),
                          SizedBox(width: 10.w, height: 20.h),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
