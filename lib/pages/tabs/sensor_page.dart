import 'package:flutter/material.dart';
import 'package:flutter_touchscreen/models/sensorData.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SensorPage extends StatefulWidget {
  const SensorPage({super.key});

  @override
  State<SensorPage> createState() => _SensorPageState();
}

class _SensorPageState extends State<SensorPage> {
  SensorDataset _currentDataSet = SensorDataset(1, DateTime.now(), 21, 80, 40);
  bool _loadingDataset = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void updateDataset() {
    setState(() {
      _loadingDataset = true;
    });

    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _currentDataSet = SensorDataset(1, DateTime.now(), 21, 80, 40);
        _loadingDataset = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Latest Update: ${_currentDataSet.time}"),
              SizedBox(
                width: 10,
              ),
              _loadingDataset
                  ? LoadingAnimationWidget.fallingDot(
                      color: Colors.white, size: 26)
                  : IconButton(
                      icon: Icon(Icons.refresh),
                      onPressed: () {
                        updateDataset();
                      },
                    ),
            ],
          ),
        ),
        Divider(),
        Expanded(
          child: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            children: [
              _SensorCard("Temperature", _currentDataSet.temp.toString(),
                  Icons.sunny, "°C"),
              _SensorCard(
                  "Humidity", _currentDataSet.humid.toString(), Icons.air, "%"),
              _SensorCard("Moisture", _currentDataSet.moist.toString(),
                  Icons.water, "%"),
            ],
          ),
        ),
      ],
    );
  }
}

Widget _SensorCard(String name, String value, IconData icon, String valueUnit) {
  return Padding(
    padding: const EdgeInsets.all(30.0),
    child: Card(
      elevation: 4,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 26,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                name,
                style: TextStyle(),
              ),
            ],
          ),
          Text("$value $valueUnit"),
        ],
      ),
    ),
  );
}
