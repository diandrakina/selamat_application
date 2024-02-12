import 'package:flutter/material.dart';
import 'package:selamat_application/styles/styles.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Welcome!',
          style: TextStyles.GR_42_bold,
        ),
      ),
    );
  }
}

// class WelcomePage extends StatelessWidget {
//   const WelcomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: AppColors.bgDarkMode,
//         title: Center(
//           child: Text('Selamat', style: TextStyles.GR_42_bold),
//           ),
//       ),
//       body: Center(
//         child: Text(
//           'Are you ready to change?',
//           style: TextStyles.GR_24_title_regular,
//         ),
//       ),
//     );
//   }
// }