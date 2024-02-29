import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
            padding: EdgeInsets.only(left: 5),
            color: AppColors.bgDarkMode,
            child: Row(
              children: [
                const Padding(padding: EdgeInsets.all(5)),
                const FaIcon(
                  FontAwesomeIcons.xmark,
                  color: AppColors.white,
                  size: 30,
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
                decoration: InputDecoration(border: UnderlineInputBorder()),
              ),

              //EDIT BIO
              SizedBox(height: 20.0),
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
                  decoration: InputDecoration(border: UnderlineInputBorder())),

              //EDIT DATE OF BIRTH
              SizedBox(height: 20.0),
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
                decoration: InputDecoration(
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
