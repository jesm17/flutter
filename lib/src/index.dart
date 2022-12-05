import 'package:flutter/material.dart';

class IndexMenu extends StatefulWidget {
  static String id = "menu_page";

  @override
  State<IndexMenu> createState() => _IndexMenuState();
}

class _IndexMenuState extends State<IndexMenu> {
  @override
  Widget build(BuildContext context) {
    
    
    return Container(
        child: Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text('volver'),
      ),
    ));
  }
}
