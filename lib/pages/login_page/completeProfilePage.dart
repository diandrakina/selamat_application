import 'package:flutter/material.dart';
import 'package:selamat_application/pages/login_page/before_we_start_page.dart';
import 'package:selamat_application/pages/login_page/loginPage.dart';
import 'package:selamat_application/pages/rule_page/privacyPolicy.dart';
import 'package:selamat_application/styles/styles.dart';
import 'package:selamat_application/utils/richie_utils.dart';
import 'package:selamat_application/utils/text_field_input.dart';

class CompleteProfilePage extends StatefulWidget {
  CompleteProfilePage({
    super.key,
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
  @override
  State<CompleteProfilePage> createState() => _CompleteProfilePageState();
}

class _CompleteProfilePageState extends State<CompleteProfilePage> {
  final TextEditingController _phoneNumController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();
  bool _isChecked = false;
  bool _isLoading = false;
  bool _isPicked = false;
  DateTime selectedDate = DateTime.now();

  void completeProfile() {
    setState(() {
      _isLoading = true;
    });
    String _email = widget.email;
    String _password = widget.password;
    // print('P3 ${_email}');
    // print('P3 ${_password}');
    String phoneNum = _phoneNumController.text;
    String fullName = _fullNameController.text;
    DateTime dateOfBirth = DateTime.now();
    String res = "Some error occured";
    try {
      if (phoneNum.isNotEmpty && fullName.isNotEmpty && _isChecked) {
        res = "success";
      }
    } catch (err) {
      res = err.toString();
    }
    setState(() {
      _isLoading = false;
    });

    if (res != 'success') {
      showSnackBar(res, context);
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => BeforeWeStartPage(
            email: _email,
            password: _password,
            phoneNum: phoneNum,
            fullName: fullName,
            dateOfBirth: dateOfBirth,
          ),
        ),
      );
    }
  }

  void navigateToPrivacyPolicy() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const PrivacyPolicy(),
      ),
    );
  }

  void navigateToLogin() {
    Navigator.of(context).push(
      MaterialPageRoute(

        builder: (context) => LoginPage(),

      ),
    );
  }

  void pickDate() async {
    final DateTime? dateTime = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(3000),
    );
    setState(() {
      _isPicked = true;
    });
    if (dateTime != null) {
      setState(() {
        selectedDate = dateTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: AppColors.bgDarkMode,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: AppColors.white,
            onPressed: () async {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            children: [
              Flexible(
                flex: 1,
                child: Container(),
              ),
              Text(
                'Complete your profile',
                style: TextStyles.GR_24_title_regular,
              ),
              Text(
                'provide your detail, thanks :)',
                style: TextStyles.GR_15_title_light,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.15,
              ),
              TextFieldInput(
                textEditingController: _phoneNumController,
                hintText: "phone number",
                textInputType: TextInputType.text,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.05,
              ),
              TextFieldInput(
                textEditingController: _fullNameController,
                hintText: "full name",
                textInputType: TextInputType.text,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.05,
              ),
              TextField(
                controller: _dateOfBirthController,
                style: const TextStyle(
                    color: AppColors.white, fontWeight: FontWeight.w400),
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.calendar_month),
                    onPressed: pickDate,
                    color: AppColors.white,
                  ),
                  hintStyle: TextStyles.GR_16_regular,
                  // hintStyle: TextStyle(
                  //     color: AppColors.white, fontWeight: FontWeight.w400),
                  hintText: _isPicked
                      ? "${selectedDate.day}-${selectedDate.month}-${selectedDate.year}"
                      : "date of birth",
                  border: OutlineInputBorder(
                      borderSide: Divider.createBorderSide(context)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: Divider.createBorderSide(context)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: Divider.createBorderSide(context)),
                  // filled: true,
                  contentPadding: const EdgeInsets.all(8),
                ),
                keyboardType: TextInputType.text,
                readOnly: true,
              ),
              Container(
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 20,
                      width: 20,
                      margin: const EdgeInsets.only(
                        left: 5,
                        right: 10,
                      ),
                      child: Checkbox(
                          value: _isChecked,
                          // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          onChanged: (newBool) {
                            setState(() {
                              _isChecked = newBool!;
                            });
                          }),
                    ),
                    Text(
                      'i\'ve read and accepted the ',
                      style: TextStyles.GR_12_light,
                    ),
                    GestureDetector(
                      onTap: navigateToPrivacyPolicy,
                      child: Text(
                        "privacy and policy",
                        style: TextStyles.GR_14_bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.05,
              ),
              InkWell(
                onTap: completeProfile,
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      color: AppColors.bluePowderBlack),
                  child: _isLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.white,
                          ),
                        )
                      : Text(
                          "Next",
                          style: TextStyles.bold_18,
                        ),
                ),
              ),
              Flexible(
                flex: 2,
                child: Container(),
              ),
              const Divider(
                color: AppColors.inactive,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                    ),
                    child: Text(
                      'already have an account? ',
                      style: TextStyles.GR_15_light,
                    ),
                  ),
                  GestureDetector(
                    onTap: navigateToLogin,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                      ),
                      child: Text(
                        "Login",
                        style: TextStyles.bold_15_blue,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
