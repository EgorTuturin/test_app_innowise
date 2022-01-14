class CurrentWeatherModel {
  List<ListWeather>? list;

  CurrentWeatherModel({this.list});

  CurrentWeatherModel.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      list = <ListWeather>[];
      json['list'].forEach((v) {
        list!.add(ListWeather.fromJson(v));
      });
    }
  }
}

class ListWeather {
  Main? main;
  List<Weather>? weather;
  Wind? wind;
  String? dtTxt;

  ListWeather({
    this.main,
    this.weather,
    this.wind,
    this.dtTxt,
  });

  ListWeather.fromJson(Map<String, dynamic> json) {
    main = json['main'] != null ? Main.fromJson(json['main']) : null;
    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather!.add(Weather.fromJson(v));
      });
    }
    wind = json['wind'] != null ? Wind.fromJson(json['wind']) : null;
    dtTxt = json['dt_txt'];
  }
}

class Main {
  double? temp;
  int? pressure;
  int? humidity;

  Main({
    this.temp,
    this.pressure,
    this.humidity,
  });

  Main.fromJson(Map<String, dynamic> json) {
    temp = json['temp'].toDouble();
    pressure = json['pressure'];
    humidity = json['humidity'];
  }
}

class Weather {
  String? main;
  String? description;

  Weather({this.main, this.description});

  Weather.fromJson(Map<String, dynamic> json) {
    main = json['main'];
    description = json['description'];
  }
}

class Wind {
  double? speed;

  Wind({this.speed});

  Wind.fromJson(Map<String, dynamic> json) {
    speed = json['speed'].toDouble();
  }
}
