import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp_starter_project/controller/global_controller.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({super.key});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  String city = "";
  String date = DateFormat("yMMMMd").format(DateTime.now());
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  void initState() {
    // TODO: implement initState
    getaddress(globalController.getlattitude().value,
        globalController.getlongitude().value);
    super.initState();
  }

  void getaddress(lat, lon) async {
    List<Placemark> placemark = await placemarkFromCoordinates(lat, lon);
    if (kDebugMode) {
      print(placemark);
    }
    Placemark place = placemark[1];
    setState(() {
      city = place.locality!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      //ADDRESS
      children: [
        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: Text(
            city,
            style: TextStyle(fontSize: 35, height: 2),
          ),
        ),

        //DATE AND TIME

        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: Text(
            date.toString(),
            style: TextStyle(
                fontSize: 16, color: Colors.grey.shade700, height: 1.5),
          ),
        )
      ],
    );
  }
}
