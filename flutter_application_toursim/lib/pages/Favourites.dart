import 'package:flutter/material.dart';
import 'package:flutter_application_toursim/pages/homeBar.dart';
import 'package:flutter_application_toursim/pages/homepage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key, required String title});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(
            Icons.close,
            size: 25.sp,
            color: Colors.black,
          ),
          onTap: () {
            final route = MaterialPageRoute(
              builder: (context) => const Homebar(type: '', title: ''),
            );
            Navigator.push(context, route);
          },
        ),
        title: const Text(
          'Favorites',
          style: TextStyle(
              fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: favorites.isEmpty
          ? const Center(child: Text('No favorites added'))
          : ListView.builder(
              itemCount: favorites.length, // Specify itemCount
              itemBuilder: (context, index) {
                var city = favorites[index];
                return _gridForCities(city, index);
              },
            ),
    );
  }

  Widget _gridForCities(Map<String, dynamic> city, int index) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.h),
      child: Align(
        alignment: Alignment.centerLeft,
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
                          city['image'],
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
                      SizedBox(height: 10.h),
                      Text(
                        city['destination_name'].toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${city['description'].toString().substring(0, 25)}...',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 40.w),
                          Text(
                            'Rs.25,999',
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
                            '4.5',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.normal),
                          ),
                          SizedBox(width: 10.w),
                          Icon(Icons.star,
                              size: 20.sp, color: Colors.yellow.shade700),
                          Icon(Icons.star,
                              size: 20.sp, color: Colors.yellow.shade700),
                          Icon(Icons.star,
                              size: 20.sp, color: Colors.yellow.shade700),
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
                                  borderRadius: BorderRadius.circular(15.r)),
                              child: const Center(child: Text('11:00 PM'))),
                          SizedBox(width: 10.w),
                          Container(
                              height: 30.h,
                              width: 70.w,
                              decoration: BoxDecoration(
                                  color: Colors.blue.shade100,
                                  borderRadius: BorderRadius.circular(15.r)),
                              child: const Center(child: Text('01:00 PM'))),
                          SizedBox(
                            width: 90.w,
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                favorites.removeAt(index);
                              });
                            },
                            icon: const Icon(Icons.favorite, color: Colors.red),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(width: 10.w, height: 20.h),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
