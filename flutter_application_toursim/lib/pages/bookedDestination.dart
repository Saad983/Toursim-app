import 'package:flutter/material.dart';
import 'package:flutter_application_toursim/pages/homeBar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookedDestination extends StatefulWidget {
  const BookedDestination({
    super.key,
    required this.price,
    required this.destId,
    required this.destName,
    required this.image,
  });

  final double price;
  final int destId;
  final String destName;
  final String image;

  @override
  State<BookedDestination> createState() => _BookedDestinationState();
}

class _BookedDestinationState extends State<BookedDestination> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Booked Destination'),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
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
        ),
        body: Center(
          child: Container(
            height: 300.h,
            width: 400.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.sp),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                )
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(15.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15.r),
                        child: Image.asset(
                          widget.image,
                          height: 130.h,
                          width: 100.w,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 20.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.destName,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              'Destination ID: ${widget.destId}',
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 14.sp,
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              'Price: Rs. ${widget.price.toStringAsFixed(2)}',
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      Row(
                        children: List.generate(
                          5,
                          (index) => Icon(
                            Icons.star,
                            size: 20.sp,
                            color: index < 4
                                ? Colors.yellow.shade700
                                : Colors.grey.shade300,
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        '4.0',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 30.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade100,
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        child: const Center(
                          child: Text('11:00 PM'),
                        ),
                      ),
                      Container(
                        height: 30.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade100,
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        child: const Center(
                          child: Text('01:00 PM'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
