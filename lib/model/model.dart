class Weather {
  double temp;
  double minTemp;
  double maxTemp;
  String date;

  Weather({
    this.temp,
    this.minTemp,
    this.maxTemp,
    this.date,
  });

  Weather.fromJson(Map<String, dynamic> json)
      : this.temp = json['the_temp'],
        this.minTemp = json['min_temp'],
        this.maxTemp = json['max_temp'],
        this.date = json['applicable_date'];

  @override
  String toString() {
    return "Date: $date, Temp: ${temp.toStringAsFixed(2)}c, Min Temp: ${minTemp.toStringAsFixed(2)}c, Max Temp: ${maxTemp.toStringAsFixed(2)}c\n";
  }
}
