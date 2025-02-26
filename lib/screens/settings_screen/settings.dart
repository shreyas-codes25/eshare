import 'package:eshare/helper/prefs_helper.dart';
import 'package:eshare/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool useDataForOffline = false;

  late String _username = "Guest";

  @override
  void initState() {
    super.initState();
    _loadUsername();
  }

  Future<void> _loadUsername() async {
    String? username = await PrefsHelper().getPreference("username");
    if (mounted) {
      setState(() {
        _username = username ?? "Guest"; // Provide a default value
      });
    }
  }

  void _logout() async {
    await PrefsHelper().clearSharedPreferences(context);
    if (mounted) {
      setState(() {
        _username = "Guest"; // Reset username after logout
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      appBar: appBar("Settings", context),
      body: ListView(
        children: [
          // Profile Section
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 20,
                      child: Icon(Icons.person, color: Colors.white, size: 30),
                    ),
                    const SizedBox(width: 16),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _username,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Spacer(),
                    IconButton(
                      icon: const Icon(
                        Icons.power_settings_new,
                        size: 30,
                        color: Colors.red,
                      ),
                      onPressed: _logout,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(),

          // Features Section
          ListTile(
            title: const Text("Camera Uploads"),
            trailing: Switch(value: false, onChanged: (val) {}),
          ),
          ListTile(
            title: const Text("Configure Passcode"),
            trailing: Switch(value: false, onChanged: (val) {}),
          ),
          ListTile(
            title: const Text("Connect a Computer"),
            onTap: () {},
          ),
          const Divider(),

          // Offline Settings
          ListTile(
            title: const Text("Offline Files"),
            subtitle: const Text("Currently using 0 Bytes"),
          ),
          ListTile(
            title: const Text("Use data for offline files"),
            trailing: Switch(
              value: useDataForOffline,
              onChanged: (val) {
                setState(() {
                  useDataForOffline = val;
                });
              },
            ),
          ),
          const Divider(),

          // Other Settings
          ListTile(
            title: const Text("Dark Mode"),
            subtitle: const Text("Follow System"),
          ),
        ],
      ),
    );
  }
}
