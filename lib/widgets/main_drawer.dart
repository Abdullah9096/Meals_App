import 'package:Meals1/screens/Filterscreen.dart';

import '../screens/Filterscreen.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(IconData icon, String title, Function tabHandle) {
    return ListTile(
        leading: Icon(
          icon,
          size: 25,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: tabHandle);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 150,
            color: Theme.of(context).accentColor,
            alignment: Alignment.centerLeft,
            child: Text(
              'Cooking up!',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile(
            Icons.restaurant,
            'Meals',
            () {
              Navigator.pushReplacementNamed(
                context,
                '/',
              );
            },
          ),
          SizedBox(
            height: 10,
          ),
          buildListTile(
            Icons.settings,
            'Filters',
            () {
              Navigator.pushReplacementNamed(
                context,
                FiltersSreen.routename,
              );
            },
          ),
        ],
      ),
    );
  }
}
