import 'package:flutter/material.dart';
import 'package:flutter_touchscreen/models/user.dart';
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
          leading: IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          /*
          actions: [
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                _key.currentState!.openEndDrawer();
              },
            )
          ],
         */
          bottom: User.currentUser!.permissions.contains("W")
              ? TabBar(tabs: [
                  Tab(
                    icon: Icon(Icons.developer_board),
                    text: "Sensors",
                  ),
                  Tab(
                    icon: Icon(Icons.memory),
                    text: "Components",
                  )
                ])
              : PreferredSize(
                  child: SizedBox(
                    height: 0,
                  ),
                  preferredSize: Size(MediaQuery.of(context).size.width, 0)),
        ),
        body: const TabBarView(
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
                    const Text("Use Dark-Mode:"),
                    Switch(value: true, onChanged: (value) {})
                  ],
                ),
              ),
              userIsAdmin
                  ? Divider(
                      thickness: 2,
                      color: Colors.red[800],
                    )
                  : const SizedBox(
                      height: 0,
                    )
            ],
          ),
        ),
      ),
    );
  }
}
