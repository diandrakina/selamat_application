import 'package:flutter/material.dart';
import 'package:selamat_application/pages/login_page/completeProfilePage.dart';
import 'package:selamat_application/pages/login_page/loginPage.dart';
import 'package:selamat_application/styles/styles.dart';
import 'package:selamat_application/utils/richie_utils.dart';
import 'package:selamat_application/utils/text_field_input.dart';

class CreatePasswordPage extends StatefulWidget {
  CreatePasswordPage({
    super.key,
    required this.email,
  });
  final String email;

  @override
  State<CreatePasswordPage> createState() => _CreatePasswordPageState();
}

class _CreatePasswordPageState extends State<CreatePasswordPage> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _isLoading = false;

  void createPasswordAndConfirm() {
    // print("${_email}");
    setState(() {
      _isLoading = true;
    });
    String _email = widget.email;
    String password = _passwordController.text;
    // print('P2 ${_email}');
    String confirmPassword = _confirmPasswordController.text;
    String res = "Some error occured";
    try {
      if ((password.isNotEmpty && confirmPassword.isNotEmpty) &&
          password == confirmPassword) {
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
          builder: (context) => CompleteProfilePage(
            email: _email,
            password: password,
          ),
        ),
      );
    }
  }

  void navigateToLogin() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
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
                'Create Password',
                style: TextStyles.GR_24_title_regular,
              ),
              Text(
                'for security, create a strong password',
                style: TextStyles.GR_15_title_light,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.15,
              ),
              TextFieldInput(
                textEditingController: _passwordController,
                hintText: "password",
                textInputType: TextInputType.text,
                isPass: true,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.05,
              ),
              TextFieldInput(
                textEditingController: _confirmPasswordController,
                hintText: "confirm password",
                textInputType: TextInputType.text,
                isPass: true,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.05,
              ),
              InkWell(
                onTap: createPasswordAndConfirm,
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
