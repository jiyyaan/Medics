import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class MenuButton extends StatelessWidget {
  const MenuButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        color: Colors.black,
        itemBuilder: (context) {
          return [
            const PopupMenuItem<int>(
              value: 0,
              child: Text("My Account"),
            ),
            PopupMenuItem<int>(
              onTap: (){
                Future.delayed(const Duration(seconds: 0,),).then((value) => Navigator.pushNamed(context, '/settings'),);
              },
              value: 1,
              child: const Text("Settings"),
            ),
            const PopupMenuItem<int>(
              value: 2,
              child: Text("Logout"),
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
