import 'package:flutter/material.dart';
import 'package:medics/res/colors/app_colors.dart';
import 'package:medics/res/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool biometricActive = false;

  Future<void> setBiometric() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("biometric", biometricActive);
  }

  Future<bool?> getBiometric() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
     bool? value = prefs.getBool("biometric");
     return value;
  }

  Future currentStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? currentValue = await getBiometric();

    prefs.setBool('biometric', currentValue!);

    setState(() {
      biometricActive = currentValue;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppConstants.kpaddingLR),
        child: Column(
          children: [
            Card(
              color: AppColors.klightTeal,
              elevation: 3.0,
              shadowColor: AppColors.klightGrey,
              child: ListTile(
                title: const Text('Enable Touch ID'),
                trailing: Switch(
                  // thumb color (round icon)
                  activeColor: AppColors.klightTeal,
                  activeTrackColor: AppColors.kdarkColor,
                  inactiveThumbColor: Colors.blueGrey.shade600,
                  inactiveTrackColor: Colors.grey.shade400,
                  splashRadius: 50.0,
                  // boolean variable value
                  value: biometricActive,
                  // changes the state of the switch
                  onChanged: (value){
                    setState(() {
                      biometricActive = value;
                      setBiometric();
                    });
                  }
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
