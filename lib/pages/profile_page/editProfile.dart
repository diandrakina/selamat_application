import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:selamat_application/models/user.dart';
import 'package:selamat_application/pages/home_page/homePage.dart';
import 'package:selamat_application/pages/profile_page/profileSharedSchedule.dart';
import 'package:selamat_application/providers/user_provider.dart';
import 'package:selamat_application/resources/firestore_methods.dart';
import 'package:selamat_application/resources/storage_methods.dart';
import 'package:selamat_application/styles/styles.dart';
import 'package:selamat_application/utils/richie_utils.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _phoneNumController = TextEditingController();
  String _name = '';
  String _bio = '';
  String _phoneNum = '';

  Uint8List? _image;
  String _photoUrl = '';
  bool _isLoading = false;

  @override
  void initState() {
    final User user = Provider.of<UserProvider>(context).getUser;
    super.initState();
      _name = user.fullName;
      _bio = user.bio;
      _phoneNum = user.phoneNum;
  }

  void selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  void clearImage() {
    setState(() {
      _image = null;
    });
  }

  void confirmUpdateProfile(String uid) async {
    String _photoUrlConfirmed = _photoUrl;
    try {
      if (_image != null) {
        String photoUrl = await StorageMethods()
            .uploadImageToStorage('profilePicture', _image!, false);
        _photoUrlConfirmed = photoUrl;
      }
      print(uid);
      print(_photoUrlConfirmed);
      print(_name);
      print(_bio);
      print(_phoneNum);
      String res = await FirestoreMethods().updateProfile(
        uid,
        // 'cb', //
        _name, //
        _photoUrlConfirmed, //
        _bio, //
        _phoneNum,
        // "PPPP", //
        // _photoUrlConfirmed, //
        // "_bio", //
        // "_phoneNum",
      );
      if (res == 'success') {
        showSnackBar("Profile Updated!", context);
        clearImage();
        setState(() {
          _isLoading = false;
        });
        Provider.of<UserProvider>(context, listen: false).refreshUser();
      } else {
        showSnackBar(res, context);
        setState(() {
          _isLoading = true;
        });
      }
    } catch (e) {
      showSnackBar(e.toString(), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<UserProvider>(context).getUser;
    
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
                    Navigator.of(context).pop();
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
              Center(
                child: Stack(
                  children: [
                    _image != null
                        ? CircleAvatar(
                            radius: 64,
                            backgroundImage: MemoryImage(
                              _image!,
                            ),
                          )
                        : const CircleAvatar(
                            radius: 64,
                            backgroundImage: NetworkImage(
                                'https://t4.ftcdn.net/jpg/00/64/67/63/360_F_64676383_LdbmhiNM6Ypzb3FM4PPuFP9rHe7ri8Ju.jpg'),
                          ),
                    Positioned(
                      bottom: -10,
                      left: 80,
                      child: IconButton(
                        onPressed: selectImage,
                        icon: const Icon(
                          Icons.add_a_photo,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              //EDIT FULL NAME
              Text(
                'Full Name',
                style: TextStyles.bold_18,
              ),
              TextField(
                controller: _fullNameController,
                onChanged: (value) {
                  setState(() {
                    _name = _fullNameController.text;
                  });
                  print(_name);
                },
                style: TextStyles.regular_18,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: _name,
                  hintStyle: TextStyles.regular_18,
                  border: UnderlineInputBorder(),
                ),
              ),

              //EDIT BIO
              const SizedBox(height: 20.0),
              Text(
                'Bio',
                style: TextStyles.bold_18,
              ),
              TextField(
                style: TextStyles.regular_18,
                controller: _bioController,
                onChanged: (value) {
                  setState(() {
                    _bio = _bioController.text;
                  });
                },
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: _bio,
                  hintStyle: TextStyles.regular_18,
                  border: UnderlineInputBorder(),
                ),
              ),

              //EDIT phone num
              const SizedBox(height: 20.0),
              Text(
                'Phone Number',
                style: TextStyles.bold_18,
              ),
              TextField(
                style: TextStyles.regular_18,
                onChanged: (value) {
                  setState(() {
                    _phoneNum = _phoneNumController.text;
                  });
                },
                controller: _phoneNumController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: _phoneNum,
                  hintStyle: TextStyles.regular_18,
                  border: UnderlineInputBorder(),
                ),
              ),
              Flexible(
                child: Container(),
                flex: 1,
              ),
              SizedBox(
                height: 50,
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: () {
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
                                  "Save Changes",
                                  style: TextStyles.bold_24,
                                ),
                                Text(
                                  "Are you sure want to save the changes you made?",
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
                                      // INIIIII
                                      onTap: () {
                                        print("AAAAAAAAAAAAAAAAA");
                                        confirmUpdateProfile(user.uid);
                                        Navigator.of(context)
                                            .popUntil((route) => route.isFirst);
                                      },
                                      child: Text(
                                        "Save",
                                        style: TextStyles.alertBlue,
                                      ),
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
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
        //TOMBOL SAVE
        // bottomNavigationBar:
      ),
    );
  }
}
