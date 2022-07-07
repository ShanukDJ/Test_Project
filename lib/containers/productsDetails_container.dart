import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components/button.dart';
import '../components/network_image.dart';
import '../model/arguments.dart';

class ProductDetailsContainer extends StatefulWidget {

  @override
  _ProductDetailsContainerState createState() => _ProductDetailsContainerState();
}

class _ProductDetailsContainerState extends State<ProductDetailsContainer> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    final Arguments args = ModalRoute.of(context).settings.arguments;
   return SingleChildScrollView(
   child: Container(
     child: Padding(
       padding: const EdgeInsets.only(top: 30),
       child: Column(
         children: [
           ImageFromURL(
               url: args.mainImage,
               width: 180.w,
               height: 120.h,
               fit: BoxFit.cover
           ),
           SizedBox(
             height: 20.h,
           ),
           Padding(
             padding: EdgeInsets.only(left: 20.h,right: 20.h),
             child: Text(args.description,textAlign: TextAlign.justify),
           ),
           SizedBox(
             height: 3.h,
           ),
           Padding(
             padding: const EdgeInsets.only(left: 20,right: 10),
             child: Row(
               children: [
                 SizedBox(
                   width: 42.h,
                 ),
                 Text("Brand Name:    "+args.brandName,style: TextStyle(fontWeight: FontWeight.bold)),
               ],
             ),
           ),

           SizedBox(
             height: 8.h,
           ),
           // Padding(
           //   padding: EdgeInsets.only(top: 20.h),
           //   child: ListView.builder(
           //     shrinkWrap: true,
           //     physics: NeverScrollableScrollPhysics(),
           //     itemCount: args.sizes.length,
           //     itemBuilder: (BuildContext context, int index) {
           //       return Text(args.sizes[index],textAlign: TextAlign.justify);
           //     },
           //   ),
           // )
           Row(
             children: [
               SizedBox(
                 width: 54.5.w,
               ),
               Text("Color:    " ,style: TextStyle(fontWeight: FontWeight.bold)),
               Text(args.color,textAlign: TextAlign.justify),
             ],
           ),
           SizedBox(
             height: 8,
           ),
           Row(
             children: [
               SizedBox(
                 width: 20,
               ),
               Text("Phone Number:    " ,style: TextStyle(fontWeight: FontWeight.bold)),
               Text(args.stockStatus ?? "",textAlign: TextAlign.justify),
             ],
           ),
           SizedBox(
             height: 8,
           ),
           Row(
             children: [
               SizedBox(
                 width: 51,
               ),
               Text("Longitude:    " ,style: TextStyle(fontWeight: FontWeight.bold)),
               // Text(args.longitude,textAlign: TextAlign.justify),
             ],
           ),
           SizedBox(
             height: 8,
           ),
           Row(
             children: [
               SizedBox(
                 width: 63,
               ),
               Text("Latitude:    " ,style: TextStyle(fontWeight: FontWeight.bold)),
               // Text(args.latitude,textAlign: TextAlign.justify),
             ],
           ),
           SizedBox(
             height: 30,
           ),
           Button(
               buttonColor: Colors.green,
               buttonText: "Show Location",
               clickAction: () {
                 setState(() {
                   // Navigator.push(context, MaterialPageRoute(builder: (context) => Map()));
                 });
               }
           ),
         ],
       ),
     ),

   ),
 );
}}
