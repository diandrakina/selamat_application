import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:selamat_application/models/message_model.dart';
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
        backgroundColor: AppColors.bgDarkMode,
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
          TextField(
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(12),
                  hintText: 'Search',
                  hintStyle: TextStyles.regular_14)),
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                color: AppColors.bgDarkMode,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  child: ListView.builder(
                    itemCount: chats.length,
                    itemBuilder: (BuildContext context, int index) {
                      final Message chat = chats[index];
                      return Container(
                        margin:
                            EdgeInsets.only(top: 5.0, bottom: 5.0, right: 20.0),
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 35.0,
                                  backgroundImage:
                                      AssetImage(chat.sender.imageUrl),
                                ),
                                SizedBox(width: 10.0),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      chat.sender.name,
                                      style: TextStyles.medium_18,
                                    ),
                                    SizedBox(height: 5.0),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.45,
                                      child: Text(
                                        chat.text,
                                        style: TextStyles.light_18,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  chat.time,
                                  style: TextStyles.thin_18,
                                )
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
