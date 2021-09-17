

class Weather {
  String name = '';
  String description = '';
 double temperature = 0;
  double percievedTemp = 0;
  int pressure = 0;
  int humidity = 0;

  Weather(
  this.name, this.description, this.humidity, this.percievedTemp, this.pressure, this.temperature
  );

  Weather.fromJson(Map<String, dynamic> weatherMap){
    this.name = weatherMap['name'];
    this.temperature = (weatherMap['main']['temp'] - 273.15) ?? 0;
    this.percievedTemp = (weatherMap['main']['feels_like'] - 273.15) ?? 0;
    this.pressure = (weatherMap['main']['pressure']) ?? 0;
    this.humidity = (weatherMap['main']['humidity']) ?? 0;
    this.description = (weatherMap['weather'][0]['main']) ?? 0;

  }
}