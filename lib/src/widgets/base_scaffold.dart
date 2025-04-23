import 'package:flutter/material.dart';
import '../routes/app_routes.dart';

class BaseScaffold extends StatelessWidget {
  final Widget child;
  final int currentIndex;

  const BaseScaffold({
    super.key,
    required this.child,
    required this.currentIndex,
  });

  void _onTabTapped(BuildContext context, int index) {
    String route;
    switch (index) {
      case 1:
        route = AppRoutes.reservation;
        break;
      case 2:
        route = AppRoutes.settings;
        break;
      case 0:
      default:
        route = AppRoutes.home;
    }
    if (ModalRoute.of(context)!.settings.name != route) {
      Navigator.pushReplacementNamed(context, route);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'My App',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.black),
            onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Notifications tapped'))),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue.shade700, Colors.blue.shade400],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              accountName: const Text('Syed Saad'),
              accountEmail: const Text('saad@example.com'),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage('assets/images/logo.png'),
              ),
              otherAccountsPictures: [
                IconButton(
                  icon: const Icon(Icons.settings, color: Colors.white),
                  onPressed: () {
                    // Handle settings button tap
                  },
                ),
              ],
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
                _onTabTapped(context, 0);
              },
            ),
            ListTile(
              leading: const Icon(Icons.calendar_today),
              title: const Text('Reservation'),
              onTap: () {
                Navigator.pop(context);
                _onTabTapped(context, 1);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                _onTabTapped(context, 2);
              },
            ),
            const Divider(),
            const ListTile(
              leading: Icon(Icons.info),
              title: Text('About'),
            ),
            const ListTile(
              leading: Icon(Icons.language),
              title: Text('Help'),
            ),
            const ListTile(
              leading: Icon(Icons.share),
              title: Text('Privacy Policy'),
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
      ),
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: Colors.amber[800],
        onTap: (i) => _onTabTapped(context, i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today), label: 'Reservation'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}
