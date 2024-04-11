import 'package:flutter/material.dart';
import 'package:sliding_switch/sliding_switch.dart';

class ComponentsPage extends StatefulWidget {
  const ComponentsPage({super.key});

  @override
  State<ComponentsPage> createState() => _ComponentsPageState();
}

class _ComponentsPageState extends State<ComponentsPage> {
  bool automaticCompontents = false;
  bool light = false;
  bool heatmat = false;
  bool pump = false;

  Widget _componentCard(bool value, String name, IconData icon) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: InkWell(
        child: Card(
          elevation: value ? 4 : 0,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 26,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 26,
                ),
              ),
            ],
          ),
        ),
        onLongPress: () {
          //TODO: Implement HTTP Function
          if (!automaticCompontents) {
            _changeDeviceState(name);
          } else {
            showDialog(
              context: context,
              barrierDismissible: true,
              builder: (BuildContext context) {
                return const AlertDialog(
                  title: Text("ERROR"),
                  content: Text(
                      "You cannot change Component status\nwhen Components are Working automaticly"),
                  actions: [],
                );
              },
            );
          }
        },
      ),
    );
  }

  void _changeDeviceState(String name) async {
    /*bool? answer = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Are you sure..."),
          content: Text("... you want to change the State of the $name"),
          actions: [
            TextButton(
              child: Text("No"),
              onPressed: () {
                Navigator.pop(context, false);
              },
            ),
            TextButton(
              child: Text("Yes"),
              onPressed: () {
                Navigator.pop(context, true);
              },
            ),
          ],
        );
      },
    );*/
    bool answer = true;

    if (answer) {
      setState(() {
        switch (name) {
          case "Ceiling Light":
            if (light) {
              light = false;
            } else {
              light = true;
            }
            break;
          case "Heatmat":
            if (heatmat) {
              heatmat = false;
            } else {
              heatmat = true;
            }
            break;
          case "Water Pump":
            if (pump) {
              pump = false;
            } else {
              pump = true;
            }
            break;
          default:
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  const Text("Automatic Components: "),
                  SlidingSwitch(
                    value: automaticCompontents,
                    onChanged: ((value) {
                      setState(() {
                        automaticCompontents = value;
                        print(automaticCompontents);
                      });
                    }),
                    onTap: () {},
                    onDoubleTap: () {},
                    onSwipe: () {},
                  )
                ],
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
        ),
        const Divider(),
        Expanded(
          child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            children: [
              _componentCard(light, "Ceiling Light", Icons.solar_power),
              _componentCard(heatmat, "Heatmat", Icons.local_fire_department),
              _componentCard(pump, "Water Pump", Icons.water_drop),
            ],
          ),
        ),
      ],
    );
  }
}
