// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:selamat_application/models/user.dart';
// import 'package:selamat_application/models/message.dart';
// import 'package:selamat_application/styles/styles.dart';
// import 'package:selamat_application/styles/styles.dart';
// import 'package:selamat_application/widget/navbar.dart';
// import 'package:selamat_application/widget/searchBar.dart';
// import 'package:selamat_application/widget/widget_discovery/container_habits.dart';
// import 'package:selamat_application/widget/widget_discovery/container_profile_psikolog.dart';
// import 'package:selamat_application/widget/widget_login_register/customElevatedButton.dart';

// void main() {
//   runApp(ChatPage());
// }

// class ChatPage extends StatefulWidget {
//   // final User user;

//   const ChatPage({super.key});

//   @override
//   _ChatScreenState createState() => _ChatScreenState();
// }

// class _ChatScreenState extends State<ChatPage> {
//   _buildMessage(Message message, bool isMe) {
//     final Container msg = Container(
//       margin: isMe
//           ? EdgeInsets.only(
//               top: 8.0,
//               bottom: 8.0,
//               left: 80.0,
//             )
//           : EdgeInsets.only(
//               top: 8.0,
//               bottom: 8.0,
//             ),
//       padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
//       width: MediaQuery.of(context).size.width * 0.75,
//       decoration: BoxDecoration(
//         color: isMe ? Colors.blue : Colors.grey[800],
//         borderRadius: isMe
//             ? BorderRadius.only(
//                 topLeft: Radius.circular(15.0),
//                 bottomLeft: Radius.circular(15.0),
//                 topRight: Radius.circular(15.0),
//               )
//             : BorderRadius.only(
//                 topRight: Radius.circular(15.0),
//                 bottomRight: Radius.circular(15.0),
//                 topLeft: Radius.circular(15.0),
//               ),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Text(
//             message.time,
//             style: TextStyles.GR_14_bold,
//           ),
//           SizedBox(height: 8.0),
//           Text(message.text, style: TextStyles.GR_14_light),
//         ],
//       ),
//     );
//     if (isMe) {
//       return msg;
//     }
//     return Row(
//       children: <Widget>[
//         msg,
//         // IconButton(
//         //   icon: message.isLiked
//         //       ? Icon(Icons.favorite)
//         //       : Icon(Icons.favorite_border),
//         //   iconSize: 30.0,
//         //   color:
//         //       message.isLiked ? Theme.of(context).primaryColor : Colors.white,
//         //   onPressed: () {},
//         // )
//       ],
//     );
//   }

//   _buildMessageComposer() {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 8.0),
//       height: 70.0,
//       color: AppColors.bgDarkMode,
//       child: Row(
//         children: <Widget>[
//           IconButton(
//             icon: Icon(Icons.photo),
//             iconSize: 25.0,
//             color: Theme.of(context).primaryColor,
//             onPressed: () {},
//           ),
//           Expanded(
//             child: TextField(
//               textCapitalization: TextCapitalization.sentences,
//               onChanged: (value) {},
//               decoration: InputDecoration.collapsed(
//                 hintText: 'Message...',
//                 hintStyle: TextStyles.GR_14_light,
//               ),
//             ),
//           ),
//           IconButton(
//             icon: Icon(Icons.send),
//             iconSize: 25.0,
//             color: Theme.of(context).primaryColor,
//             onPressed: () {},
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).primaryColor,
//       appBar: AppBar(
//         leading: IconButton(
//           iconSize: 18,
//           icon: Icon(
//             FontAwesomeIcons.arrowLeft,
//             color: AppColors.white,
//           ),
//           onPressed: () {},
//         ),
//         title: Text(
//           'Agus',
//           style: TextStyles.GR_24_bold,
//         ),
//         elevation: 0.0,
//         actions: <Widget>[
//           IconButton(
//             icon: Icon(Icons.more_horiz),
//             iconSize: 30.0,
//             color: Colors.white,
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: GestureDetector(
//         onTap: () => FocusScope.of(context).unfocus(),
//         child: Column(
//           children: <Widget>[
//             Expanded(
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: AppColors.bgDarkMode,
//                   // borderRadius: BorderRadius.only(
//                   //   topLeft: Radius.circular(30.0),
//                   //   topRight: Radius.circular(30.0),
//                   // ),
//                 ),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(30.0),
//                     topRight: Radius.circular(30.0),
//                   ),
//                   child: ListView.builder(
//                     reverse: true,
//                     padding: EdgeInsets.only(top: 15.0),
//                     itemCount: messages.length,
//                     itemBuilder: (BuildContext context, int index) {
//                       final Message message = messages[index];
//                       final bool isMe = message.sender.uid == currentUser.uid;
//                       return _buildMessage(message, isMe);
//                     },
//                   ),
//                 ),
//               ),
//             ),
//             _buildMessageComposer(),
//           ],
//         ),
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
// import 'package:flutter/material.dart';

void main() {
  runApp(ChatPage());
}

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(scaffoldBackgroundColor: AppColors.bgDarkMode),
      title: 'Chat Page',
      home: Scaffold(
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
          title: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/images/login_page/facebook_logo.png'),
                ),
              ),
              Text(
                'Agus',
                style: TextStyles.GR_24_bold,
              ),
            ],
          ),
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.more_horiz),
              iconSize: 30.0,
              color: Colors.white,
              onPressed: () {},
            ),
          ],
        ),
        body: ChatScreen(),
      ),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<ChatMessage> _messages = [];

  TextEditingController _textController = TextEditingController();

  void _handleSubmitted(String text) {
    _textController.clear();
    ChatMessage message = ChatMessage(
      text: text,
      isSender: true,
    );
    setState(() {
      _messages.insert(0, message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            reverse: true,
            itemCount: _messages.length,
            itemBuilder: (context, index) {
              return _messages[index];
            },
          ),
        ),
        // Divider(height: 1.0),
        Container(
          decoration: BoxDecoration(
            color: AppColors.bgDarkMode,
          ),
          child: _buildTextComposer(),
        ),
      ],
    );
  }

  Widget _buildTextComposer() {
    return Container(
      color: AppColors.darkModeCard,
      margin: EdgeInsets.all(20.0),
      child: Row(
        children: <Widget>[
          Flexible(
            child: TextField(
              controller: _textController,
              onSubmitted: _handleSubmitted,
              decoration: InputDecoration(
                fillColor: AppColors.darkModeCard,
                filled: true,
                hintText: 'Message',
                hintStyle: TextStyles.GR_16_regular,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide.none,
                ),
              ),
              style: TextStyles.GR_16_regular,
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.send,
              color: AppColors.white,
            ),
            onPressed: () {
              if (_textController.text.isNotEmpty) {
                _handleSubmitted(_textController.text);
              }
            },
          ),
        ],
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  ChatMessage({required this.text, required this.isSender});

  final String text;
  final bool isSender;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      child: Row(
        mainAxisAlignment:
            isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          isSender
              ? SizedBox()
              : Container(
                  width: 40.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/images/login_page/facebook_logo.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
          SizedBox(width: 10.0),
          Flexible(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width *
                    0.7, // Limiting message width
              ),
              decoration: BoxDecoration(
                color: isSender ? Colors.blue : Colors.grey[300],
                borderRadius: BorderRadius.circular(8.0),
              ),
              padding: EdgeInsets.all(10.0),
              child: Text(
                text,
                style: TextStyle(color: isSender ? Colors.white : Colors.black),
                softWrap: true,
              ),
            ),
          ),
          SizedBox(width: 10.0),
          isSender
              ? Container(
                  width: 40.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/images/login_page/facebook_logo.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
