import 'package:flutter/material.dart';
import 'screens/library.dart';
import 'screens/login.dart';
import 'screens/profile.dart';

class Root extends StatefulWidget {
  final String username; 
  

  const Root({super.key, required this.username});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  int _selectedIndex = 0;
  final List<String> _title = 
  [
    "Destinasi Wisata", 
    "Profile"
  ];
    // final List<String> _title = ["List Destinasi", "Profile"];


  void _logout() {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const LoginPage()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      Destination(username: widget.username),
      Profile(username: widget.username, onLogout: _logout),
    ];

    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.place),
        title: Text(_title[_selectedIndex]),
        backgroundColor: const Color.fromARGB(255, 248, 230, 255),
      ),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.place), label: "Destinasi Wisata"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
