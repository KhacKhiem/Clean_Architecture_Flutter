import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/entities/chlorine_injections.dart';
import 'package:flutter_application_1/domain/entities/station.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class Reports extends StatelessWidget {
  Stations station;
  List<ChlorineInjections> history;
  Reports(this.station, this.history);
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
          ),
        ),
        body: portraitView(),
      );
  Widget portraitView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 20.h,
            width: 80.w,
            margin: EdgeInsets.all(20),
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.blue,
                  blurRadius: 10.0,
                )
              ],
              color: Colors.blue,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            padding: EdgeInsets.all(10),
            child: stationInfo(),
          ),
          Container(
            width: 60.w,
            height: 5.h,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              // ignore: prefer_const_literals_to_create_immutables
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                )
              ],
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Text(
              'Recent Activities',
              style: TextStyle(fontSize: 12.sp, color: Colors.blue),
            ),
          ),
          stationHistory(),
        ],
      ),
    );
  }

  Widget stationInfo() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Text(
          'Reports',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'Sf',
              fontSize: 25.sp),
        ),
        Container(
          height: 10.h,
          width: 70.w,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.white,
                      size: 15,
                    ),
                    Text(
                      station.stationAddress.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Text(
                  station.stationName.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Sf',
                      fontSize: 22.sp),
                ),
              ]),
            ],
          ),
        )
      ],
    );
  }

  Widget stationHistory() {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 300,
      width: 320,
      child: ListView.builder(
        itemCount: history.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  // ignore: prefer_const_literals_to_create_immutables
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5.0,
                    )
                  ],
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.blue,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                        DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.parse(
                            history[index].injectionTime.toString())),
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Sf',
                            fontSize: 13.0)),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(history[index].employeeName.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Sf',
                                fontSize: 13.0)),
                        Text('+' + history[index].chlorineVolume.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Sf',
                                fontSize: 13.0)),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                height: 8,
              )
            ],
          );
        },
      ),
    );
  }
}
