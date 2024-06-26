import 'package:flutter/material.dart';
import 'package:selamat_application/pages/login_page/createPasswordPage.dart';
import 'package:selamat_application/pages/login_page/loginPage.dart';
import 'package:selamat_application/styles/styles.dart';
import 'package:selamat_application/utils/richie_utils.dart';
import 'package:selamat_application/utils/text_field_input.dart';

class CreateEmailPage extends StatefulWidget {
  const CreateEmailPage({super.key});

  @override
  State<CreateEmailPage> createState() => _CreateEmailPageState();
}

class _CreateEmailPageState extends State<CreateEmailPage> {
  final TextEditingController _emailController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
  }

  void chooseEmail() {
    setState(() {
      _isLoading = true;
    });
    String email = _emailController.text;
    // print('P1 ${email}');
    String res = "Some error occured";
    try {
      if (email.isNotEmpty) {
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
          builder: (context) => CreatePasswordPage(email: email),
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
                'Insert your Email',
                style: TextStyles.GR_24_title_regular,
              ),
              Text(
                'Insert your email down here',
                style: TextStyles.GR_15_title_light,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.15,
              ),
              TextFieldInput(
                textEditingController: _emailController,
                hintText: "email",
                textInputType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.05,
              ),
              InkWell(
                onTap: chooseEmail,
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
                  // ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
