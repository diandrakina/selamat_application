import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:selamat_application/styles/styles.dart';

class SoundPicker extends StatefulWidget {
  const SoundPicker({super.key});

  @override
  State<SoundPicker> createState() => _SoundPickerState();
}

class _SoundPickerState extends State<SoundPicker> {
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
                "Sound",
                style: TextStyles.bold_30,
              ),
            ],
          ),
        ),

        //BODY
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Column(
                children: [
                  //PIN
                  ListTile(
                    title: Row(
                      children: [
                        const SizedBox(width: 10),
                        Text('Default', style: TextStyles.light_18),
                      ],
                    ),
                    trailing: const Icon(
                      Icons.done,
                      color: AppColors.white,
                    ),
                  ),
                  const Divider(
                    height: 5,
                  ),
                  ListTile(
                    title: Row(
                      children: [
                        const SizedBox(width: 10),
                        Text('Door Bell', style: TextStyles.light_18),
                      ],
                    ),
                  ),
                  const Divider(
                    height: 5,
                  ),
                  ListTile(
                    title: Row(
                      children: [
                        const SizedBox(width: 10),
                        Text('Bird', style: TextStyles.light_18),
                      ],
                    ),
                  ),
                  const Divider(
                    height: 5,
                  ),
                  ListTile(
                    title: Row(
                      children: [
                        const SizedBox(width: 10),
                        Text('Happy Birthday', style: TextStyles.light_18),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
