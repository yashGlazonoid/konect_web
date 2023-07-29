import 'package:flutter/material.dart';
import 'package:konect_desktop/pages/PiGeneratorPage.dart';
import 'package:side_navigation/side_navigation.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> views = const [
    PiGenerator(),
    Center(
      child: Text('Account'),
    ),
    Center(
      child: Text('Settings'),
    ),
  ];

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Konect"),
      ),
      body: Row(
        children: [
          SideNavigationBar(
            selectedIndex: selectedIndex,
            items: const [
              SideNavigationBarItem(
                icon: Icons.dashboard,
                label: 'Dashboard',
              ),
              SideNavigationBarItem(
                icon: Icons.person,
                label: 'Account',
              ),
              SideNavigationBarItem(
                icon: Icons.settings,
                label: 'Settings',
              ),
            ],
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            toggler: SideBarToggler(
                expandIcon: Icons.keyboard_arrow_left,
                shrinkIcon: Icons.keyboard_arrow_right,
                onToggle: () {
                  print('Toggle');
                }),
          ),
          Expanded(
            child: views.elementAt(selectedIndex),
          )
        ],
      ),
    );
  }
}
