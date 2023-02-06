class Weather {
  bool? success;
  String? city;
  List<Result>? result;

  Weather({this.success, this.city, this.result});

  Weather.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    city = json['city'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['city'] = this.city;
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  String? date;
  String? day;
  String? icon;
  String? description;
  String? status;
  String? degree;
  String? min;
  String? max;
  String? night;
  String? humidity;

  Result(
      {this.date,
      this.day,
      this.icon,
      this.description,
      this.status,
      this.degree,
      this.min,
      this.max,
      this.night,
      this.humidity});

  Result.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    day = json['day'];
    icon = json['icon'];
    description = json['description'];
    status = json['status'];
    degree = json['degree'];
    min = json['min'];
    max = json['max'];
    night = json['night'];
    humidity = json['humidity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['day'] = this.day;
    data['icon'] = this.icon;
    data['description'] = this.description;
    data['status'] = this.status;
    data['degree'] = this.degree;
    data['min'] = this.min;
    data['max'] = this.max;
    data['night'] = this.night;
    data['humidity'] = this.humidity;
    return data;
  }
}