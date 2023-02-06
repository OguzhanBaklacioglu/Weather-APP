import 'package:digitalsahne1/controllers/controller_dashboard.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:digitalsahne1/uisize/uicolor.dart';
import 'package:digitalsahne1/uisize/uisize.dart';
import 'package:digitalsahne1/uisize/uitexts.dart';

class ViewDashboard extends StatefulWidget {
  ViewDashboard({Key? key}) : super(key: key);

  @override
  State<ViewDashboard> createState() => _ViewDashboardState();
}

class _ViewDashboardState extends State<ViewDashboard> {
  final c = Get.put(ControllerDashboard());

  @override
  Widget build(BuildContext context) {
    /*DateTime now = DateTime.now();
    String month = time(now);*/
    String title = c.month + " " + c.now.day.toString();

    return Obx(() => (Scaffold(
          backgroundColor: UIbackgroundColor(),
          drawer: const Drawer(),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: UIColors.backGround,
            centerTitle: true, //ortalama yapmak için kullandıkf
            title: Text(
              c.month.value + " " + c.now.day.toString(),
              textAlign: TextAlign.center,
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      c.getCtoFdegree();
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      primary: UIColors.backGround,
                      elevation: 0,
                      textStyle: UITextStyle.boldWhiteForDegree),
                  child: Text(c.degree.value)),
            ],
          ),
          body: bodyTopSingleChild(c.weatherList, title),
        )));
  }

  SingleChildScrollView bodyTopSingleChild(
      List<dynamic> otherDays, String title) {
    return SingleChildScrollView(
        child: c.weatherList.isNotEmpty
            ? Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      c.placemarks![0].administrativeArea!,
                                      style: UITextStyle.locationTextStyle,
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      (double.parse(c.weatherList[0].degree!))
                                              .toStringAsFixed(0) +
                                          c.degree.value,
                                      style: UITextStyle.biggestWhiteText,
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      c.weatherList[0].status!,
                                      style: UITextStyle.locationTextStyle,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                child: Column(
                                  children: [
                                    Image.network(
                                      c.weatherList[0].icon!,
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  divider(),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "Now",
                                  style: UITextStyle.thinGrayText,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                    (double.parse(c.weatherList[0].degree!) + 1)
                                            .toStringAsFixed(0) +
                                        c.degree.value,
                                    style: UITextStyle.boldWhiteForDegree),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "1 pm",
                                  style: UITextStyle.thinGrayText,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                    (double.parse(c.weatherList[0].degree!) - 1)
                                            .toStringAsFixed(0) +
                                        c.degree.value,
                                    style: UITextStyle.boldWhiteForDegree),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "2 pm",
                                  style: UITextStyle.thinGrayText,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                    (double.parse(c.weatherList[0].degree!))
                                            .toStringAsFixed(0) +
                                        c.degree.value,
                                    style: UITextStyle.boldWhiteForDegree),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "3 pm",
                                  style: UITextStyle.thinGrayText,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                    (double.parse(c.weatherList[0].degree!) + 1)
                                            .toStringAsFixed(0) +
                                        c.degree.value,
                                    style: UITextStyle.boldWhiteForDegree),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "4 pm",
                                  style: UITextStyle.thinGrayText,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                    (double.parse(c.weatherList[0].degree!))
                                            .toStringAsFixed(0) +
                                        c.degree.value,
                                    style: UITextStyle.boldWhiteForDegree),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  divider(),
                  otherDaysListView(),
                ],
              )
            : const Center(child: CircularProgressIndicator()));
  }

  Divider divider() {
    return Divider(
      thickness: 1,
      color: UIColors.abstractGray,
    );
  }

  ListView otherDaysListView() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return Row(
          children: [
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      c.weatherList[index].day!,
                      style: UITextStyle.normalWhiteForTime,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  ListTile(
                      title: Image.network(
                    c.weatherList[index].icon!,
                    height: 40,
                    width: 40,
                  ))
                ],
              ),
            ),
            const Spacer(),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(
                                (double.parse(c.weatherList[index].max!))
                                    .toStringAsFixed(0),
                                style: UITextStyle.normalWhiteForTime,
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(
                                (double.parse(c.weatherList[index].min!))
                                    .toStringAsFixed(0),
                                style: UITextStyle.thinGrayText,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        );
      },
      itemCount: c.weatherList.length,
    );
  }

  String time(DateTime now) {
    int month = now.month.toInt();
    switch (month) {
      case 1:
        return "January";
      case 2:
        return "February";
      case 3:
        return "March";
      case 4:
        return "April";
      case 5:
        return "May";
      case 6:
        return "June";
      case 7:
        return "July";
      case 8:
        return "August";
      case 9:
        return "September";
      case 10:
        return "October";
      case 11:
        return "November";
      case 12:
        return "December";

      default:
        return "ay";
    }
  }

  Color UIbackgroundColor() {
    if (c.weatherList.isNotEmpty) {
      if (c.weatherList[0].status == "Rain") {
        UIColors.backGround = Color.fromRGBO(102, 178, 255, 0.4);
        return UIColors.backGround;
      } else if (c.weatherList[0].status == "Clouds") {
        UIColors.backGround = Color.fromRGBO(224, 224, 224, 0.4);
        return UIColors.backGround;
      } else if (c.weatherList[0].status == "Clear") {
        UIColors.backGround = Colors.orange.shade400;
        return UIColors.backGround;
      } else {
        return UIColors.backGround;
      }
    } else {
      return UIColors.backGround;
    }
  }
}
