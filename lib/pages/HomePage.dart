import 'package:flutter/material.dart';
import 'package:konect_desktop/pages/PiGeneratorPage.dart';
import 'package:konect_desktop/pages/login/SignUpPage.dart';
import 'package:konect_desktop/pages/login/googleSignIn.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.auth,
    required this.name,
    required this.email,
    required this.imageUrl,
  }) : super(key: key);

  final bool auth;
  final String name;
  final String email;
  final String imageUrl;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  List<Widget> get pages {
    List<Widget> allPages = [
      PiGenerator(),
      GoogleSignInButton(),
    ];
    if (!widget.auth) {
      allPages.insert(0, SignUpPage(name: widget.name, email: widget.email, uid: widget.imageUrl,imageUrl: widget.imageUrl,));
    }
    return allPages;
  }

  @override
  Widget build(BuildContext context) {
    bool auth = widget.auth;
    String name = widget.name;
    String email = widget.email;
    String imageUrl = widget.imageUrl;

    return Scaffold(
      body: Row(
        children: [
          AppDrawer(
            selectedIndex: selectedIndex,
            onItemTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            disabled: !auth,
            name: name,
            imageUrl: imageUrl,
            email: email,
          ),
          VerticalDivider(thickness: 1, width: 1),
          Expanded(child: pages[selectedIndex]),
        ],
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTap;
  final bool disabled;
  final String name;
  final String email;
  final String imageUrl;

  const AppDrawer({
    required this.selectedIndex,
    required this.onItemTap,
    this.disabled = false,
    required this.name,
    required this.email,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250, // Fixed width for the sidebar
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(name),
              accountEmail: Text(email),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(imageUrl),
              ),
            ),
            ListTile(
              leading: Icon(Icons.point_of_sale_sharp),
              title: Text('Sales Sync'),
              onTap: disabled ? null : () => onItemTap(0),
              selected: selectedIndex == 0,
            ),
            ListTile(
              leading: Icon(Icons.reorder),
              title: Text('Add Order'),
              onTap: disabled ? null : () => onItemTap(1),
              selected: selectedIndex == 1,
            ),ListTile(
              leading: Icon(Icons.generating_tokens),
              title: Text('PI Generator'),
              onTap: disabled ? null : () => onItemTap(1),
              selected: selectedIndex == 1,
            ),ListTile(
              leading: Icon(Icons.payment),
              title: Text('Awaited Payment'),
              onTap: disabled ? null : () => onItemTap(1),
              selected: selectedIndex == 1,
            ),ListTile(
              leading: Icon(Icons.reorder),
              title: Text('Current Orders'),
              onTap: disabled ? null : () => onItemTap(1),
              selected: selectedIndex == 1,
            ),ListTile(
              leading: Icon(Icons.sync),
              title: Text('Sales Sync'),
              onTap: disabled ? null : () => onItemTap(1),
              selected: selectedIndex == 1,
            ),ListTile(
              leading: Icon(Icons.reorder),
              title: Text('All Orders'),
              onTap: disabled ? null : () => onItemTap(1),
              selected: selectedIndex == 1,
            ),ListTile(
              leading: Icon(Icons.inventory),
              title: Text('Invoices'),
              onTap: disabled ? null : () => onItemTap(1),
              selected: selectedIndex == 1,
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Log Out'),
              onTap: () async {
                SharedPreferences pref = await SharedPreferences.getInstance();
                pref.setBool("auth", false);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
