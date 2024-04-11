class SensorDataset {
  int id;
  DateTime time;
  double? temp;
  double? humid;
  double? moist;

  SensorDataset(this.id, this.time, [this.temp, this.humid, this.moist]);

  static void getSensorNewestSensorFromBackend() {}
}
