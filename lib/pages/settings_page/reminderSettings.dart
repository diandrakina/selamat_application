import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:selamat_application/pages/settings_page/soundPicker.dart';
import 'package:selamat_application/styles/styles.dart';

class ReminderSettings extends StatefulWidget {
  const ReminderSettings({super.key});

  @override
  State<ReminderSettings> createState() => _ReminderSettingsState();
}

class _ReminderSettingsState extends State<ReminderSettings> {
  bool _sound = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //APPBAR
        appBar: AppBar(
          toolbarHeight: 80,
          leadingWidth: double.maxFinite,
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          leading: Row(
            children: [
              const Padding(padding: EdgeInsets.all(5)),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const FaIcon(
                  Icons.arrow_back,
                  color: AppColors.white,
                  size: 25,
                ),
              ),
              const Padding(padding: EdgeInsets.all(5)),
              Text(
                "Reminder Settings",
                style: TextStyles.bold_30,
              ),
            ],
          ),
        ),

        //BODY
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.inactiveTask,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      //PIN
                      SwitchListTile(
                        activeColor: AppColors.baseColor,
                        inactiveThumbColor: Colors.white,
                        inactiveTrackColor: AppColors.inactiveTask,
                        title: Row(
                          children: [
                            const FaIcon(
                              FontAwesomeIcons.bell,
                              color: AppColors.white,
                            ),
                            const SizedBox(width: 10),
                            Text('On/off', style: TextStyles.light_18),
                          ],
                        ),
                        value: _sound,
                        onChanged: (bool value) {
                          setState(() {
                            _sound = value;
                          });
                        },
                      ),
                      const Divider(
                        height: 5,
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SoundPicker(),
                            ),
                          );
                        },
                        title: Row(
                          children: [
                            const Icon(Icons.music_note,
                                color: AppColors.white),
                            const SizedBox(width: 10),
                            Text('Reminder Sound', style: TextStyles.light_18),
                          ],
                        ),
                        trailing: const Icon(
                          Icons.navigate_next,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
