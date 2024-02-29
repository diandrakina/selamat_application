// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:selamat_application/models/user.dart';
// import 'package:selamat_application/models/message.dart';
// import 'package:selamat_application/styles/styles.dart';

// void main() {
//   runApp(ContactPage());
// }

// class ContactPage extends StatefulWidget {
//   const ContactPage({super.key});

//   @override
//   State<ContactPage> createState() => _ContactPageState();
// }

// class _ContactPageState extends State<ContactPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: AppColors.bgDarkMode,
//         leading: IconButton(
//           iconSize: 18,
//           icon: Icon(
//             FontAwesomeIcons.arrowLeft,
//             color: AppColors.white,
//           ),
//           onPressed: () {},
//         ),
//         title: Text('Chats', style: TextStyles.GR_24_bold),
//         elevation: 0.0,
//       ),
//       body: Column(
//         children: [
//           TextField(
//               decoration: InputDecoration(
//                   filled: true,
//                   fillColor: AppColors.darkModeCard,
//                   contentPadding: EdgeInsets.all(12),
//                   hintText: 'Search',
//                   hintStyle: TextStyles.regular_14)),
//           Column(
//             children: [
//               Container(
//                 height: MediaQuery.of(context).size.height,
//                 color: AppColors.bgDarkMode,
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(0),
//                       topRight: Radius.circular(0)),
//                   child: ListView.builder(
//                     itemCount: chats.length,
//                     itemBuilder: (BuildContext context, int index) {
//                       final Message chat = chats[index];
//                       return Container(
//                         margin:
//                             EdgeInsets.only(top: 5.0, bottom: 5.0, right: 5.0),
//                         padding: EdgeInsets.symmetric(
//                             horizontal: 10.0, vertical: 5.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Row(
//                               children: [
//                                 CircleAvatar(
//                                   radius: 25,
//                                   backgroundImage:
//                                       AssetImage(chat.sender.profilePicUrl),
//                                 ),
//                                 SizedBox(width: 10.0),
//                                 Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       chat.sender.fullName,
//                                       style: TextStyles.medium_18,
//                                     ),
//                                     SizedBox(height: 5.0),
//                                     Container(
//                                       width: MediaQuery.of(context).size.width *
//                                           0.45,
//                                       child: Text(
//                                         chat.text,
//                                         style: TextStyles.GR_16_light,
//                                         overflow: TextOverflow.ellipsis,
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ],
//                             ),
//                             Column(
//                               children: [
//                                 Text(
//                                   chat.time,
//                                   style: TextStyles.GR_16_light,
//                                 )
//                               ],
//                             )
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:flutter/material.dart';
import 'package:selamat_application/styles/styles.dart';
import 'package:selamat_application/widget/navbar.dart';
import 'package:selamat_application/widget/searchBar.dart';
import 'package:selamat_application/widget/widget_discovery/container_habits.dart';
import 'package:selamat_application/widget/widget_discovery/container_profile_psikolog.dart';
import 'package:selamat_application/widget/widget_login_register/customElevatedButton.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp Home',
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF075E54),
      ),
      home: WhatsAppHome(),
    );
  }
}

class WhatsAppHome extends StatefulWidget {
  @override
  _WhatsAppHomeState createState() => _WhatsAppHomeState();
}

class _WhatsAppHomeState extends State<WhatsAppHome> {
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
        title: Text(
          'Chats',
          style: TextStyles.GR_24_bold,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Implement search functionality
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              // Implement more options
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 20, // Assuming there are 20 recent chats
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey,
              backgroundImage:
                  AssetImage('assets/images/login_page/facebook_logo.png'),
            ),
            title: Text(
              'Contact Name',
              style: TextStyles.GR_16_regular,
            ),
            subtitle: Text(
              'Last message from contact',
              style: TextStyle(color: Colors.white70),
            ),
            trailing: Text(
              '10:30 AM',
              style: TextStyle(color: Colors.white70),
            ), // Last message time
            onTap: () {
              // Open chat with this contact
            },
          );
        },
      ),
    );
  }
}
