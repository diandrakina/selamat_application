import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:selamat_application/styles/styles.dart';
import 'package:selamat_application/widget/customTextFormField.dart';
import 'package:selamat_application/widget/customCheckboxButton.dart';
import 'package:selamat_application/widget/customElevatedButton.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          iconSize: 18,
          icon: Icon(
            FontAwesomeIcons.arrowLeft,
            color: AppColors.white,
          ),
          onPressed: () {},
        ),
        title: Text('Chats', style: TextStyles.GR_24_bold),
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: AppColors.darkModeCard,
              child: TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(12),
                      hintText: 'Search',
                      hintStyle: TextStyles.regular_14)),
            ),
          ),
          Column(
            children: [
              Container(
                height: 300,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
