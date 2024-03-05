import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:selamat_application/pages/profile_page/profileSharedSchedule.dart';
import 'package:selamat_application/styles/styles.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String _name = '';
  String _age = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //APPBAR
        appBar: AppBar(
          toolbarHeight: 80,
          leadingWidth: double.maxFinite,
          leading: Container(
            padding: const EdgeInsets.only(left: 5),
            color: AppColors.bgDarkMode,
            child: Row(
              children: [
                const Padding(padding: EdgeInsets.all(5)),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NewProfilePage(),
                      ),
                    );
                  },
                  child: const FaIcon(
                    FontAwesomeIcons.xmark,
                    color: AppColors.white,
                    size: 30,
                  ),
                ),
                const Padding(padding: EdgeInsets.all(10)),
                SizedBox(
                  width: 300,
                  child: Text(
                    "Edit Profile",
                    style: TextStyles.bold_30,
                  ),
                ),
              ],
            ),
          ),
        ),
        resizeToAvoidBottomInset: false,

        //BODY
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //EDIT FULL NAME
              Text(
                'Full Name',
                style: TextStyles.bold_18,
              ),
              TextField(
                style: TextStyles.regular_18,
                onChanged: (value) {
                  setState(
                    () {
                      _name = value;
                    },
                  );
                },
                decoration:
                    const InputDecoration(border: UnderlineInputBorder()),
              ),

              //EDIT BIO
              const SizedBox(height: 20.0),
              Text(
                'Bio',
                style: TextStyles.bold_18,
              ),
              TextField(
                  style: TextStyles.regular_18,
                  onChanged: (value) {
                    setState(() {
                      _age = value;
                    });
                  },
                  decoration:
                      const InputDecoration(border: UnderlineInputBorder())),

              //EDIT DATE OF BIRTH
              const SizedBox(height: 20.0),
              Text(
                'Date of Birth',
                style: TextStyles.bold_18,
              ),
              TextField(
                style: TextStyles.regular_18,
                onChanged: (value) {
                  setState(() {
                    _age = value;
                  });
                },
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                ),
              ),
              const SizedBox(height: 320.0),

              //TOMBOL SAVE
              Center(
                child: Container(
                  height: 50,
                  width: double.maxFinite,
                  child: ElevatedButton(
                    onPressed: () {
                      // Proses simpan data di sini
                      // Misalnya, kita hanya mencetak data yang diubah
                      print('Name: $_name');
                      print('Age: $_age');
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            backgroundColor: AppColors.darkModeCard,
                            content: Container(
                              padding: const EdgeInsets.all(5),
                              height: 180,
                              width: 380,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Discard Changes",
                                    style: TextStyles.bold_24,
                                  ),
                                  Text(
                                    "Are you sure want to discard the changes you made?",
                                    style: TextStyles.light_18,
                                  ),
                                  const SizedBox(
                                    height: 50,
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 100,
                                      ),
                                      GestureDetector(
                                        child: Text(
                                          "No Thanks",
                                          style: TextStyles.alertGrey,
                                        ),
                                        onTap: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      GestureDetector(
                                        child: Text(
                                          "Discard",
                                          style: TextStyles.alertRed,
                                        ),
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  NewProfilePage(),
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    style: CustomButtonStyles.buttonBlue,
                    child: Text(
                      'Save',
                      style: TextStyles.bold_16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
