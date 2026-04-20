import 'package:ecomm_app_flutter/components/bottom_nav_bar.dart';
import 'package:ecomm_app_flutter/pages/cart_page.dart';
import 'package:ecomm_app_flutter/pages/shop_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> pages = const [ShopPage(), CartPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(onTabChange: navigateBottomBar),

      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),

      drawer: Drawer(
        backgroundColor: Colors.white,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DrawerHeader(
                child: Center(
                  child: Image.asset(
                    'lib/images/logo.png',
                    color: Colors.blue,
                    height: 80,
                  ),
                ),
              ),

              const Divider(),

              ListTile(
                leading: const Icon(Icons.home, color: Colors.blue),
                title: const Text('Home', style: TextStyle(color: Colors.blue)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              ListTile(
                leading: const Icon(Icons.info, color: Colors.blue),
                title: const Text(
                  'About',
                  style: TextStyle(color: Colors.blue),
                ),
                onTap: () {},
              ),

              const Spacer(),

              ListTile(
                leading: const Icon(Icons.logout, color: Colors.blue),
                title: const Text(
                  'Logout',
                  style: TextStyle(color: Colors.blue),
                ),
                onTap: () {},
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),

      body: pages[_selectedIndex],
    );
  }
}
