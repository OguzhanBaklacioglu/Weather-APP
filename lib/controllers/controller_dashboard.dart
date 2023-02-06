import 'package:digitalsahne1/services/api_client.dart';
import 'package:dio/dio.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../models/model.dart';

class ControllerDashboard extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    getDate();
    await getLocation();
    await getWeather();
  }

  final client = APIClient(Dio(BaseOptions(
      contentType: "application/json",
      headers: {
        "authorization": "apikey 0iogObG5UXVyh19X7XVDZ3:6usZsWOsVMiAck0c8hY0Eo"
      })));

  final RxList<Result> _weatherList = <Result>[].obs;
  List<Result> get weatherList => _weatherList.value;

  List<Placemark>? placemarks;
  RxString degree = "°C".obs;
  RxString city = "".obs;

  DateTime now = DateTime.now();

  RxString month = "".obs;

  getWeather() async {
    Weather response;
    try {
      response = await client.splashData(city.value);
      _weatherList.value = response.result!;
    } catch (e) {}
  }

  getCtoFdegree() {
    if (degree == "°C") {
      weatherList.forEach((element) {
        double CtoFdegree = double.parse(element.degree!);
        CtoFdegree = (((9 / 5 * CtoFdegree) + 32));
        element.degree = CtoFdegree.toString();

        double CtoFdegreeMin = double.parse(element.min!);
        CtoFdegreeMin = (((9 / 5 * CtoFdegreeMin) + 32));
        element.min = CtoFdegreeMin.toString();

        double CtoFdegreeMax = double.parse(element.max!);
        CtoFdegreeMax = (((9 / 5 * CtoFdegreeMax) + 32));
        element.max = CtoFdegreeMax.toString();
      });
      degree = "°F".obs;
    } else {
      getWeather();
      degree = "°C".obs;
    }
  }

  getLocation() async {
    LocationPermission permission;
    permission = await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    print(position.toString());
    placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
   // city = (placemarks![0].administrativeArea!).obs;
       city = "bursa".obs;
  }

  getDate() {
    month.value = time(now).value;
  }

  RxString time(DateTime now) {
    int month = now.month.toInt();
    switch (month) {
      case 1:
        return "January".obs;
      case 2:
        return "February".obs;
      case 3:
        return "March".obs;
      case 4:
        return "April".obs;
      case 5:
        return "May".obs;
      case 6:
        return "June".obs;
      case 7:
        return "July".obs;
      case 8:
        return "August".obs;
      case 9:
        return "September".obs;
      case 10:
        return "October".obs;
      case 11:
        return "November".obs;
      case 12:
        return "December".obs;

      default:
        return "ay".obs;
    }
  }
}
