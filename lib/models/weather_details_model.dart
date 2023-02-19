import 'dart:convert';

List<WeatherDetailsModel> weatherDetailsModelFromJson(String str) =>
    List<WeatherDetailsModel>.from(
        json.decode(str).map((x) => WeatherDetailsModel.fromJson(x)));

String weatherDetailsModelToJson(List<WeatherDetailsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WeatherDetailsModel {
  WeatherDetailsModel({
    required this.localObservationDateTime,
    required this.epochTime,
    required this.weatherText,
    required this.weatherIcon,
    required this.hasPrecipitation,
    this.precipitationType,
    required this.isDayTime,
    required this.temperature,
    required this.realFeelTemperature,
    required this.realFeelTemperatureShade,
    required this.relativeHumidity,
    required this.indoorRelativeHumidity,
    required this.dewPoint,
    required this.wind,
    required this.windGust,
    required this.uvIndex,
    required this.uvIndexText,
    required this.visibility,
    required this.obstructionsToVisibility,
    required this.cloudCover,
    required this.ceiling,
    required this.pressure,
    required this.pressureTendency,
    required this.past24HourTemperatureDeparture,
    required this.apparentTemperature,
    required this.windChillTemperature,
    required this.wetBulbTemperature,
    required this.precip1Hr,
    required this.precipitationSummary,
    required this.temperatureSummary,
    required this.mobileLink,
    required this.link,
  });

  DateTime localObservationDateTime;
  int epochTime;
  String weatherText;
  int weatherIcon;
  bool hasPrecipitation;
  dynamic precipitationType;
  bool isDayTime;
  ApparentTemperature temperature;
  ApparentTemperature realFeelTemperature;
  ApparentTemperature realFeelTemperatureShade;
  int relativeHumidity;
  int indoorRelativeHumidity;
  ApparentTemperature dewPoint;
  Wind wind;
  WindGust windGust;
  int uvIndex;
  String uvIndexText;
  ApparentTemperature visibility;
  String obstructionsToVisibility;
  int cloudCover;
  ApparentTemperature ceiling;
  ApparentTemperature pressure;
  PressureTendency pressureTendency;
  ApparentTemperature past24HourTemperatureDeparture;
  ApparentTemperature apparentTemperature;
  ApparentTemperature windChillTemperature;
  ApparentTemperature wetBulbTemperature;
  ApparentTemperature precip1Hr;
  Map<String, ApparentTemperature> precipitationSummary;
  TemperatureSummary temperatureSummary;
  String mobileLink;
  String link;

  factory WeatherDetailsModel.fromJson(Map<String, dynamic> json) =>
      WeatherDetailsModel(
        localObservationDateTime:
            DateTime.parse(json["LocalObservationDateTime"]),
        epochTime: json["EpochTime"],
        weatherText: json["WeatherText"],
        weatherIcon: json["WeatherIcon"],
        hasPrecipitation: json["HasPrecipitation"],
        precipitationType: json["PrecipitationType"],
        isDayTime: json["IsDayTime"],
        temperature: ApparentTemperature.fromJson(json["Temperature"]),
        realFeelTemperature:
            ApparentTemperature.fromJson(json["RealFeelTemperature"]),
        realFeelTemperatureShade:
            ApparentTemperature.fromJson(json["RealFeelTemperatureShade"]),
        relativeHumidity: json["RelativeHumidity"],
        indoorRelativeHumidity: json["IndoorRelativeHumidity"],
        dewPoint: ApparentTemperature.fromJson(json["DewPoint"]),
        wind: Wind.fromJson(json["Wind"]),
        windGust: WindGust.fromJson(json["WindGust"]),
        uvIndex: json["UVIndex"],
        uvIndexText: json["UVIndexText"],
        visibility: ApparentTemperature.fromJson(json["Visibility"]),
        obstructionsToVisibility: json["ObstructionsToVisibility"],
        cloudCover: json["CloudCover"],
        ceiling: ApparentTemperature.fromJson(json["Ceiling"]),
        pressure: ApparentTemperature.fromJson(json["Pressure"]),
        pressureTendency: PressureTendency.fromJson(json["PressureTendency"]),
        past24HourTemperatureDeparture: ApparentTemperature.fromJson(
            json["Past24HourTemperatureDeparture"]),
        apparentTemperature:
            ApparentTemperature.fromJson(json["ApparentTemperature"]),
        windChillTemperature:
            ApparentTemperature.fromJson(json["WindChillTemperature"]),
        wetBulbTemperature:
            ApparentTemperature.fromJson(json["WetBulbTemperature"]),
        precip1Hr: ApparentTemperature.fromJson(json["Precip1hr"]),
        precipitationSummary: Map.from(json["PrecipitationSummary"]).map(
            (k, v) => MapEntry<String, ApparentTemperature>(
                k, ApparentTemperature.fromJson(v))),
        temperatureSummary:
            TemperatureSummary.fromJson(json["TemperatureSummary"]),
        mobileLink: json["MobileLink"],
        link: json["Link"],
      );

  Map<String, dynamic> toJson() => {
        "LocalObservationDateTime": localObservationDateTime.toIso8601String(),
        "EpochTime": epochTime,
        "WeatherText": weatherText,
        "WeatherIcon": weatherIcon,
        "HasPrecipitation": hasPrecipitation,
        "PrecipitationType": precipitationType,
        "IsDayTime": isDayTime,
        "Temperature": temperature.toJson(),
        "RealFeelTemperature": realFeelTemperature.toJson(),
        "RealFeelTemperatureShade": realFeelTemperatureShade.toJson(),
        "RelativeHumidity": relativeHumidity,
        "IndoorRelativeHumidity": indoorRelativeHumidity,
        "DewPoint": dewPoint.toJson(),
        "Wind": wind.toJson(),
        "WindGust": windGust.toJson(),
        "UVIndex": uvIndex,
        "UVIndexText": uvIndexText,
        "Visibility": visibility.toJson(),
        "ObstructionsToVisibility": obstructionsToVisibility,
        "CloudCover": cloudCover,
        "Ceiling": ceiling.toJson(),
        "Pressure": pressure.toJson(),
        "PressureTendency": pressureTendency.toJson(),
        "Past24HourTemperatureDeparture":
            past24HourTemperatureDeparture.toJson(),
        "ApparentTemperature": apparentTemperature.toJson(),
        "WindChillTemperature": windChillTemperature.toJson(),
        "WetBulbTemperature": wetBulbTemperature.toJson(),
        "Precip1hr": precip1Hr.toJson(),
        "PrecipitationSummary": Map.from(precipitationSummary)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "TemperatureSummary": temperatureSummary.toJson(),
        "MobileLink": mobileLink,
        "Link": link,
      };
}

class ApparentTemperature {
  ApparentTemperature({
    required this.metric,
    required this.imperial,
  });

  Imperial metric;
  Imperial imperial;

  factory ApparentTemperature.fromJson(Map<String, dynamic> json) =>
      ApparentTemperature(
        metric: Imperial.fromJson(json["Metric"]),
        imperial: Imperial.fromJson(json["Imperial"]),
      );

  Map<String, dynamic> toJson() => {
        "Metric": metric.toJson(),
        "Imperial": imperial.toJson(),
      };
}

class Imperial {
  Imperial({
    required this.value,
    required this.unit,
    required this.unitType,
    this.phrase,
  });

  double value;
  String unit;
  int unitType;
  String? phrase;

  factory Imperial.fromJson(Map<String, dynamic> json) => Imperial(
        value: json["Value"]?.toDouble(),
        unit: json["Unit"],
        unitType: json["UnitType"],
        phrase: json["Phrase"],
      );

  Map<String, dynamic> toJson() => {
        "Value": value,
        "Unit": unit,
        "UnitType": unitType,
        "Phrase": phrase,
      };
}

class PressureTendency {
  PressureTendency({
    required this.localizedText,
    required this.code,
  });

  String localizedText;
  String code;

  factory PressureTendency.fromJson(Map<String, dynamic> json) =>
      PressureTendency(
        localizedText: json["LocalizedText"],
        code: json["Code"],
      );

  Map<String, dynamic> toJson() => {
        "LocalizedText": localizedText,
        "Code": code,
      };
}

class TemperatureSummary {
  TemperatureSummary({
    required this.past6HourRange,
    required this.past12HourRange,
    required this.past24HourRange,
  });

  PastHourRange past6HourRange;
  PastHourRange past12HourRange;
  PastHourRange past24HourRange;

  factory TemperatureSummary.fromJson(Map<String, dynamic> json) =>
      TemperatureSummary(
        past6HourRange: PastHourRange.fromJson(json["Past6HourRange"]),
        past12HourRange: PastHourRange.fromJson(json["Past12HourRange"]),
        past24HourRange: PastHourRange.fromJson(json["Past24HourRange"]),
      );

  Map<String, dynamic> toJson() => {
        "Past6HourRange": past6HourRange.toJson(),
        "Past12HourRange": past12HourRange.toJson(),
        "Past24HourRange": past24HourRange.toJson(),
      };
}

class PastHourRange {
  PastHourRange({
    required this.minimum,
    required this.maximum,
  });

  ApparentTemperature minimum;
  ApparentTemperature maximum;

  factory PastHourRange.fromJson(Map<String, dynamic> json) => PastHourRange(
        minimum: ApparentTemperature.fromJson(json["Minimum"]),
        maximum: ApparentTemperature.fromJson(json["Maximum"]),
      );

  Map<String, dynamic> toJson() => {
        "Minimum": minimum.toJson(),
        "Maximum": maximum.toJson(),
      };
}

class Wind {
  Wind({
    required this.direction,
    required this.speed,
  });

  Direction direction;
  ApparentTemperature speed;

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        direction: Direction.fromJson(json["Direction"]),
        speed: ApparentTemperature.fromJson(json["Speed"]),
      );

  Map<String, dynamic> toJson() => {
        "Direction": direction.toJson(),
        "Speed": speed.toJson(),
      };
}

class Direction {
  Direction({
    required this.degrees,
    required this.localized,
    required this.english,
  });

  int degrees;
  String localized;
  String english;

  factory Direction.fromJson(Map<String, dynamic> json) => Direction(
        degrees: json["Degrees"],
        localized: json["Localized"],
        english: json["English"],
      );

  Map<String, dynamic> toJson() => {
        "Degrees": degrees,
        "Localized": localized,
        "English": english,
      };
}

class WindGust {
  WindGust({
    required this.speed,
  });

  ApparentTemperature speed;

  factory WindGust.fromJson(Map<String, dynamic> json) => WindGust(
        speed: ApparentTemperature.fromJson(json["Speed"]),
      );

  Map<String, dynamic> toJson() => {
        "Speed": speed.toJson(),
      };
}
