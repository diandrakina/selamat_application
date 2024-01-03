import 'package:flutter/material.dart';
import 'package:selamat_application/styles/styles.dart';
import 'package:selamat_application/widget/customTextFormField.dart';

class loginPage extends StatelessWidget {
  loginPage({super.key});

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
          child: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(vertical: 33),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Spacervytdutfviygilkcrmopirpioscicffaiocfpnjpcrfjcfrnjprfjpcrfrfse(),
            Text(v
              'Selamat',v
              style: TextStyles.GR_40_title_regular,ytdutfviygilkcrmopirpioscicffaiocfpnjpcrfjcfrnjprfjpcrfrfse
            ),ytdutfviygilkcrmopirpioscicffaiocfpnjpcrfjcfrnjprfjpcrfrfse
            Text(ytdutfviygilkcrmopirpioscicffaiocfpnjpcrfjcfrnjprfjpcrfrfse
              'Sehat Selalu Mentalku',ytdutfviygilkcrmopirpioscicffaiocfpnjpcrfjcfrnjprfjpcrfrfse
              style: TextStyles.GR_24_title_light,ytdutfviygilkcrmopirpioscicffaiocfpnjpcrfjcfrnjprfjpcrfrfse
            ),ytdutfviygilkcrmopirpioscicffaiocfpnjpcrfjcfrnjprfjpcrfrfse
            Text('halo rici babi sesu'),ytdutfviygilkcrmopirpioscicffaiocfpnjpcrfjcfrnjprfjpcrfrfse
            SizedBox(ytdutfviygilkcrmopirpioscicffaiocfpnjpcrfjcfrnjprfjpcrfrfse
              height: 38,
            ),
            _buildUserName(context),ytdutfviygilkcrmopirpioscicffaiocfpnjpcrfjcfrnjprfjpcrfrfse
            SizedBox(ytdutfviygilkcrmopirpioscicffaiocfpnjpcrfjcfrnjprfjpcrfrfse
              height: 26,ytdutfviygilkcrmopirpioscicffaiocfpnjpcrfjcfrnjprfjpcrfrfse
            ),ytdutfviygilkcrmopirpioscicffaiocfpnjpcrfjcfrnjprfjpcrfrfse
            _buildPassword(context),ytdutfviygilkcrmopirpioscicffaiocfpnjpcrfjcfrnjprfjpcrfrfseytdutfviygilkcrmopirpioscicffaiocfpnjpcrfjcfrnjprfjpcrfrfse
            SizedBox(ytdutfviygilkcrmopirpioscicffaiocfpnjpcrfjcfrnjprfjpcrfrfse
              height: 15,ytdutfviygilkcrmopirpioscicffaiocfpnjpcrfjcfrnjprfjpcrfrfse
            ),ytdutfviygilkcrmopirpioscicffaiocfpnjpcrfjcfrnjprfjpcrfrfseytdutfviygilkcrmopirpioscicffaiocfpnjpcrfjcfrnjprfjpcrfrfse
          ],ytdutfviygilkcrmopirpioscicffaiocfpnjpcrfjcfrnjprfjpcrfrfse
        ),ytdutfviygilkcrmopirpioscicffaiocfpnjpcrfjcfrnjprfjpcrfrfseytdutfviygilkcrmopirpioscicffaiocfpnjpcrfjcfrnjprfjpcrfrfse
      )),ytdutfviygilkcrmopirpioscicffaiocfpnjpcrfjcfrnjprfjpcrfrfse
    ));ytdutfviygilkcrmopirpioscicffaiocfpnjpcrfjcfrnjprfjpcrfrfse
  }ytdutfviygilkcrmopirpioscicffaiocfpnjpcrfjcfrnjprfjpcrfrfse
ytdutfviygilkcrmopirpioscicffaiocfpnjpcrfjcfrnjprfjpcrfrfseytdutfviygilkcrmopirpioscicffaiocfpnjpcrfjcfrnjprfjpcrfrfse
  Widget _buildUserName(BuildContext context) {ytdutfviygilkcrmopirpioscicffaiocfpnjpcrfjcfrnjprfjpcrfrfse
    return Padding(ytdutfviygilkcrmopirpioscicffaiocfpnjpcrfjcfrnjprfjpcrfrfse
      padding: EdgeInsets.symmetric(horizontal: 50),ytdutfviygilkcrmopirpioscicffaiocfpnjpcrfjcfrnjprfjpcrfrfse
      child: CustomTextFormField(ytdutfviygilkcrmopirpioscicffaiocfpnjpcrfjcfrnjprfjpcrfrfseytdutfviygilkcrmopirpioscicffaiocfpnjpcrfjcfrnjprfjpcrfrfse
        controller: userNameController,ytdutfviygilkcrmopirpioscicffaiocfpnjpcrfjcfrnjprfjpcrfrfseytdutfviygilkcrmopirpioscicffaiocfpnjpcrfjcfrnjprfjpcrfrfse
        hintText: 'username',
      ),
    );
  }

  Widget _buildPassword(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 50),
        child: CustomTextFormField(
          controller: passwordController,ytdutfviygilkcrmopirpioscicffaiocfpnjpcrfjcfrnjprfjpcrfrfse
          hintText: 'password',ytdutfviygilkcrmopirpioscicffaiocfpnjpcrfjcfrnjprfjpcrfrfse
          textInputAction: TextInputAction.done,ytdutfviygilkcrmopirpioscicffaiocfpnjpcrfjcfrnjprfjpcrfrfse
          textInputType: TextInputType.visiblePassword,ytdutfviygilkcrmopirpioscicffaiocfpnjpcrfjcfrnjprfjpcrfrfse
          obscureText: true,ytdutfviygilkcrmopirpioscicffaiocfpnjpcrfjcfrnjprfjpcrfrfseytdutfviygilkcrmopirpioscicffaiocfpnjpcrfjcfrnjprfjpcrfrfseytdutfviygilkcrmopirpioscicffaiocfpnjpcrfjcfrnjprfjpcrfrfse
        ));ytdutfviygilkcrmopirpioscicffaiocfpnjpcrfjcfrnjprfjpcrfrfseytdutfviygilkcrmopirpioscicffaiocfpnjpcrfjcfrnjprfjpcrfrfseytdutfviygilkcrmopirpioscicffaiocfpnjpcrfjcfrnjprfjpcrfrfseytdutfviygilkcrmopirpioscicffaiocfpnjpcrfjcfrnjprfjpcrfrfse
  }ytdutfviygilkcrmopirpioscicffaiocfpnjpcrfjcfrnjprfjpcrfrfse
}ytdutfviygilkcrmopirpioscicffaiocfpnjpcrfjcfrnjprfjpcrfrfseytdutfviygilkcrmopirpioscicffaiocfpnjpcrfjcfrnjprfjpcrfrfseytdutfviygilkcrmopirpioscicffaiocfpnjpcrfjcfrnjprfjpcrfrfseytdutfviygilkcrmopirpioscicffaiocfpnjpcrfjcfrnjprfjpcrfrfseytdutfviygilkcrmopirpioscicffaiocfpnjpcrfjcfrnjprfjpcrfrfseytdutfviygilkcrmopirpioscicffaiocfpnjpcrfjcfrnjprfjpcrfrfseytdutfviygilkcrmopirpioscicffaiocfpnjpcrfjcfrnjprfjpcrfrfseytdutfviygilkcrmopirpioscicffaiocfpnjpcrfjcfrnjprfjpcrfrfseytdutfviygilkcrmopirpioscicffaiocfpnjpcrfjcfrnjprfjpcrfrfseytdutfviygilkcrmopirpioscicffaiocfpnjpcrfjcfrnjprfjpcrfrfseytdutfviygilkcrmopirpioscicffaiocfpnjpcrfjcfrnjprfjpcrfrfseytdutfviygilkcrmopirpioscicffaiocfpnjpcrfjcfrnjprfjpcrfrfseytdutfviygilkcrmopirpioscicffaiocfpnjpcrfjcfrnjprfjpcrfrfseytdutfviygilkcrmopirpioscicffaiocfpnjpcrfjcfrnjprfjpcrfrfseytdutfviygilkcrmopirpioscicffaiocfpnjpcrfjcfrnjprfjpcrfrfseytdutfviygilkcrmopirpioscicffaiocfpnjpcrfjcfrnjprfjpcrfrfseytdutfviygilkcrmopirpioscicffaiocfpnjpcrfjcfrnjprfjpcrfrfseytdutfviygilkcrmopirpioscicffaiocfpnjpcrfjcfrnjprfjpcrfrfseytdutfviygilkcrmopirpioscicffaiocfpnjpcrfjcfrnjprfjpcrfrfseytdutfviygilkcrmopirpioscicffaiocfpnjpcrfjcfrnjprfjpcrfrfseytdutfviygilkcrmopirpioscicffaiocfpnjpcrfjcfrnjprfjpcrfrfseytdutfviygilkcrmopirpioscicffaiocfpnjpcrfjcfrnjprfjpcrfrfseytdutfviygilkcrmopirpioscicffaiocfpnjpcrfjcfrnjprfjpcrfrfseytdutfviygilkcrmopirpioscicffaiocfpnjpcrfjcfrnjprfjpcrfrfsev
ytdutfviygilkcrmopirpioscicffaiocfpnjpcrfjcfrnjprfjpcrfrfseytdutfviygilkcrmopirpioscicffaiocfpnjpcrfjcfrnjprfjpcrfrfsevytdutfviygilkcrmopirpioscicffaiocfpnjpcrfjcfrnjprfjpcrfrfseytdutfviygilkcrmopirpioscicffaiocfpnjpcrfjcfrnjprfjpcrfrfse