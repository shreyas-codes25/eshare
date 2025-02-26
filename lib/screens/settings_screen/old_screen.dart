// import 'package:eshare/helper/prefs_helper.dart';
// import 'package:eshare/screens/settings_screen/setting_tile.dart';
// import 'package:eshare/widgets/app_bar.dart';
// import 'package:flutter/material.dart';

// class Settings extends StatefulWidget {
//   const Settings({super.key});

//   @override
//   State<Settings> createState() => _SettingsState();
// }

// class _SettingsState extends State<Settings> {
//   late String _username = "Guest";

//   @override
//   void initState() {
//     super.initState();
//     _loadUsername();
//   }

//   Future<void> _loadUsername() async {
//     String? username = await PrefsHelper().getPreference("username");
//     if (mounted) {
//       setState(() {
//         _username = username ?? "Guest"; // Provide a default value
//       });
//     }
//   }

//   void _logout() async {
//     await PrefsHelper().clearSharedPreferences(context);
//     if (mounted) {
//       setState(() {
//         _username = "Guest"; // Reset username after logout
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).colorScheme.onPrimary,
//       appBar: appBar("Settings", context),
//       body: Column(
//         children: [
//           // Static Account Settings Tile
//           Container(
//             color: Colors.white, // Background to keep it visually distinct
//             child: Column(
//               children: [
//                 ListTile(
//                   title: Text(
//                     _username,
//                     style: const TextStyle(
//                         fontWeight: FontWeight.bold, fontSize: 20),
//                   ),
//                   subtitle: const Text("Account Settings"),
//                   leading: const Icon(Icons.account_circle),
//                   trailing: IconButton(
//                     icon: const Icon(
//                       Icons.power_settings_new,
//                       size: 30,
//                       color: Colors.red,
//                     ),
//                     onPressed: _logout,
//                   ),
//                 ),
//                 const Divider(), // Divider to separate the static section from the scrollable list
//               ],
//             ),
//           ),
//           // Scrollable ListView for other settings
//           Expanded(
//             child: ListView(
//               children: [
//                 settingTile("Notifications", Icons.notifications,
//                     "Manage your notifications", () {}),
//                 settingTile(
//                     "Privacy", Icons.privacy_tip, "Manage your privacy", () {}),
//                 settingTile("About", Icons.info, "About the app", () {}),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
