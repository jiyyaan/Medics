import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class MenuButton extends StatelessWidget {
  const MenuButton({
    super.key,
    this.color = Colors.black,
    this.textColor = Colors.white,
  });
  final Color color;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        color: color,
        itemBuilder: (context) {
          return [
            PopupMenuItem<int>(
              value: 0,
              child: Text("My Account", style: TextStyle(color: textColor),),
            ),
            PopupMenuItem<int>(
              onTap: (){
                Future.delayed(const Duration(seconds: 0,),).then((value) => Navigator.pushNamed(context, '/settings'),);
              },
              value: 1,
              child: Text("Settings", style: TextStyle(color: textColor),),
            ),
            PopupMenuItem<int>(
              value: 2,
              child: Text("Logout", style: TextStyle(color: textColor),),
            ),
          ];
        },
        onSelected: (value) {
          if (value == 0) {
            if (kDebugMode) {
              print("My account menu is selected.");
            }
          } else if (value == 1) {
            if (kDebugMode) {
              print("Settings menu is selected.");
            }
          } else if (value == 2) {
            if (kDebugMode) {
              print("Logout menu is selected.");
            }
          }
        });
  }
}
