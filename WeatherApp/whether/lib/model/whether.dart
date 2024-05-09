class Weather {
  String name = '';
  double temperature = 0;
  double preceived = 0;
  int pressure = 0;
  int humidity = 0;

  Weather(this.name, this.temperature, this.preceived, this.pressure,
      this.humidity);

  Weather.fromJson(Map<String, dynamic> weatherData) {
    this.name = weatherData['name'];
    this.temperature = (weatherData['main']['temp'] - 273.15) ?? 0;
    this.preceived = (weatherData['main']['feels_like'] - 273.15) ?? 0;
    this.pressure = weatherData['main']['pressure'] ?? 0;
    this.humidity = weatherData['main']['humidity'] ?? 0;
  }
}
