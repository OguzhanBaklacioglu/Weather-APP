import 'package:get/get.dart';

double ratio = 1;

getSize() {
  double width = Get.width;
  if (width >= 768) {
    ratio = 1.5;
  } else if (width >= 560) {
    ratio = 1.2;
  } else if (width >= 400) {
    ratio = 1;
  } else {
    ratio = .8;
  }
  return ratio;
}

class UISize {
  static double autoSize = getSize();

  // static double autoSize = ratio >=0.5 ? Get.width / 375 : Get.height / 812;

}
