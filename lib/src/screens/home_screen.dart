import 'package:flutter/material.dart';
import 'package:table_bookings_partner_flutter/src/routes/app_routes.dart';
import 'package:table_bookings_partner_flutter/src/screens/home_page.dart';
import 'package:table_bookings_partner_flutter/src/screens/reservation_page.dart';
import 'package:table_bookings_partner_flutter/src/screens/settings_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _counter = 0;
  int _selectedIndex = 0;

  void _increment() => setState(() => _counter++);
  void _decrement() => setState(() => _counter--);

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(_scaffoldKey.currentContext!).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final pages = <Widget>[
      HomePage(increment: _increment, decrement: _decrement, counter: _counter),
      const ReservationPage(),
      const SettingsPage(),
    ];

    return Scaffold(
      key: _scaffoldKey,
      appBar: _buildAppBar(),
      drawer: _buildMainDrawer(context),
      endDrawer: _buildEndDrawer(),
      body: IndexedStack(index: _selectedIndex, children: pages),
      floatingActionButton: _buildFloatingActionButton(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 6,
      iconTheme: const IconThemeData(color: Colors.black),
      title: const Text(
        'Home',
        style: TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications, color: Colors.black),
          onPressed: () => _showSnackBar('Notification Button Pressed'),
        ),
        IconButton(
          icon: const Icon(Icons.search, color: Colors.black),
          onPressed: () => _showSnackBar('Search Button Pressed'),
        ),
      ],
    );
  }

  Drawer _buildMainDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue.shade700, Colors.blue.shade400],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            accountName: const Text(
              'Syed Saad',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            accountEmail: const Text('saad@example.com'),
            currentAccountPicture: const CircleAvatar(
              backgroundImage: AssetImage('assets/images/logo.png'),
            ),
            otherAccountsPictures: [
              IconButton(
                icon: const Icon(Icons.settings, color: Colors.white70),
                onPressed: () {
                  Navigator.pop(context);
                  setState(() => _selectedIndex = 2);
                },
              ),
            ],
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
              setState(() => _selectedIndex = 0);
            },
          ),
          ListTile(
            leading: const Icon(Icons.calendar_today),
            title: const Text('Reservation'),
            onTap: () {
              Navigator.pop(context);
              setState(() => _selectedIndex = 1);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About'),
            onTap: () {
              Navigator.popAndPushNamed(context, AppRoutes.about);
            },
          ),
          ListTile(
            leading: const Icon(Icons.help),
            title: const Text('Help'),
            onTap: () {
              Navigator.popAndPushNamed(context, AppRoutes.help);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Log out'),
            onTap: () {
              Navigator.pop(context);
              // handle sign-out
            },
          ),
        ],
      ),
    );
  }

  Drawer _buildEndDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: const [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text(
              'End Drawer Header',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
          ),
        ],
      ),
    );
  }

  FloatingActionButton _buildFloatingActionButton() {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () => _showSnackBar('Floating Action Button Pressed'),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: (index) {
        setState(() => _selectedIndex = index);
        _showSnackBar('Tab $index selected');
      },
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          label: 'Reservation',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
    );
  }
}
