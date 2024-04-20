import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.orange,
      unselectedItemColor: Colors.grey,
      unselectedLabelStyle: TextStyle(color: Colors.grey),
      selectedLabelStyle:
          TextStyle(color: Colors.orange),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.space_dashboard_outlined,
          ),
          label: 'Dashboard',
        ),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.data_usage,
            ),
            label: 'Usage'),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.history,
            ),
            label: 'History'),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.support_agent_outlined,
            ),
            label: 'Support'),
      ],
    );
  }
}
