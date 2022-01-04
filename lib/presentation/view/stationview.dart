import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_application_1/domain/entities/processing_system.dart';
import 'package:flutter_application_1/domain/entities/station.dart';
import 'package:flutter_application_1/presentation/view/report.dart';
import 'package:sizer/sizer.dart';

class Station extends StatelessWidget {
  final List<Stations> stations;
  Station(this.stations);
  @override
  Widget build(BuildContext context) => DefaultTabController(
      length: 4,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: const Center(
              child: Text(
                'Station',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'Sf',
                    fontSize: 30.0),
              ),
            ),
            bottom: TabBar(
              unselectedLabelColor: Colors.grey,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.blue,
              ),
              tabs: <Widget>[
                Tab(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text('Station 1'),
                    ),
                  ),
                ),
                const Tab(
                  text: 'Station 2',
                ),
                const Tab(
                  text: 'Station 3-1',
                ),
                const Tab(
                  text: 'Station 3-2',
                )
              ],
            ),
          ),
          body: TabBarView(children: [
            View(stations[0], stations[0].processingSystems![0]),
            View(stations[1], stations[1].processingSystems![0]),
            View(stations[2], stations[2].processingSystems![0]),
            View(stations[2], stations[2].processingSystems![1]),
          ])));
}

class View extends StatelessWidget {
  final Stations station;
  final ProcessingSystems systems;
  View(this.station, this.systems);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(
            child: Container(
          padding: const EdgeInsets.all(20),
          width: 90.w,
          height: 20.h,
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Colors.blue,
              )
            ],
            color: Colors.blue,
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: Colors.white,
                                  size: 10.sp,
                                ),
                                Text(
                                  station.stationAddress.toString(),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 8.sp),
                                ),
                              ],
                            ),
                            Text(
                              station.stationName.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontFamily: 'Sf',
                                  fontSize: 15.sp),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Reports(station,
                                        systems.chlorineInjections!.toList())));
                          },
                          child: Container(
                            width: 80,
                            height: 45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Text(
                                'History >>',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                    fontFamily: 'Sf',
                                    fontSize: 8.sp),
                              ),
                            ),
                          ),
                        ),
                      ]),
                ),
              ]),
        )),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    height: 40.h,
                    width: 25.w,
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 20.0,
                        )
                      ],
                    ),
                    child: systems.waterLevel! > 5
                        ? FAProgressBar(
                            currentValue: systems.waterLevel!,
                            verticalDirection: VerticalDirection.up,
                            size: 10,
                            borderRadius: BorderRadius.circular(20),
                            displayText: '0%',
                            progressColor: Colors.white,
                            displayTextStyle: TextStyle(
                                fontSize: 15.sp, fontWeight: FontWeight.bold),
                            direction: Axis.vertical,
                            maxValue: 10,
                            backgroundColor: Colors.black,
                          )
                        : FAProgressBar(
                            currentValue: systems.waterLevel!,
                            verticalDirection: VerticalDirection.up,
                            size: 10,
                            borderRadius: BorderRadius.circular(20),
                            displayText: '0%',
                            progressColor: Colors.red,
                            displayTextStyle: TextStyle(
                                fontSize: 15.sp, fontWeight: FontWeight.bold),
                            direction: Axis.vertical,
                            maxValue: 10,
                            backgroundColor: Colors.black,
                          )),
                Text('Water Level',
                    style: TextStyle(
                        color: Colors.white, fontFamily: 'Sf', fontSize: 8.sp)),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 40.h,
                  width: 25.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 18.h,
                        width: 25.w,
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              blurRadius: 20.0,
                            )
                          ],
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(systems.processingSystemName.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                    fontFamily: 'Sf',
                                    fontSize: 20.0)),
                            const Text('System',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                    fontFamily: 'Sf',
                                    fontSize: 20.0)),
                          ],
                        ),
                      ),
                      Container(
                        height: 20.h,
                        width: 25.w,
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              blurRadius: 20.0,
                            )
                          ],
                        ),
                        child: systems.chlorineConcentration! > 30
                            ? FAProgressBar(
                                currentValue: systems.chlorineConcentration!,
                                verticalDirection: VerticalDirection.up,
                                size: 100,
                                displayText: '%',
                                borderRadius: BorderRadius.circular(15),
                                progressColor: Colors.white,
                                displayTextStyle: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.bold),
                                direction: Axis.vertical,
                                maxValue: 100,
                                backgroundColor: Colors.black,
                              )
                            : FAProgressBar(
                                currentValue: systems.chlorineConcentration!,
                                verticalDirection: VerticalDirection.up,
                                size: 100,
                                displayText: '%',
                                borderRadius: BorderRadius.circular(15),
                                progressColor: Colors.redAccent,
                                displayTextStyle: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.bold),
                                direction: Axis.vertical,
                                maxValue: 100,
                                backgroundColor: Colors.black,
                              ),
                      ),
                    ],
                  ),
                ),
                Text('  Chlorine ',
                    style: TextStyle(
                        color: Colors.white, fontFamily: 'Sf', fontSize: 8.sp)),
              ],
            )
          ],
        )
      ]),
    );
  }
}
