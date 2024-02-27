import 'package:flutter/material.dart';
import 'package:flutter_touchscreen/pages/tabs/components_page.dart';
import 'package:flutter_touchscreen/pages/tabs/sensor_page.dart';

class PageWrapper extends StatefulWidget {
  const PageWrapper({super.key});

  @override
  State<PageWrapper> createState() => _PageWrapperState();
}

class _PageWrapperState extends State<PageWrapper> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  bool userIsAdmin = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        key: _key,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                _key.currentState!.openEndDrawer();
              },
            )
          ],
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.info),
                text: "Sensors",
              ),
              Tab(
                icon: Icon(Icons.computer),
                text: "Components",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SensorPage(),
            ComponentsPage(),
          ],
        ),
        endDrawer: Drawer(
          child: ListView(
            children: [
              ListTile(
                title: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Use Dark-Mode:"),
                    Switch(value: true, onChanged: (value) {})
                  ],
                ),
              ),
              userIsAdmin
                  ? Divider(
                      thickness: 2,
                      color: Colors.red[800],
                    )
                  : SizedBox(
                      height: 0,
                    )
            ],
          ),
        ),
      ),
    );
  }
}
