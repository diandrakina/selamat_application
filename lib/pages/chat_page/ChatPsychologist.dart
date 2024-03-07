import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:selamat_application/pages/discovery_page/psychologistDetailPage.dart';
import 'package:selamat_application/styles/styles.dart';
import 'package:selamat_application/widget/navbar.dart';
import 'package:selamat_application/widget/searchBar.dart';
import 'package:selamat_application/widget/widget_discovery/container_habits.dart';
import 'package:selamat_application/widget/widget_discovery/container_profile_psikolog.dart';
import 'package:selamat_application/widget/widget_login_register/customElevatedButton.dart';
// Import the psychologist detail page

class ChatPsycho extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatPsycho> {
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
    return SafeArea(
      child: Scaffold(
        //APPBAR
        appBar: AppBar(
          leadingWidth: double.maxFinite,
          toolbarHeight: 80,
          backgroundColor: AppColors.bgDarkMode,
          elevation: 0.0,
          leading: Row(
            children: [
              const Padding(padding: EdgeInsets.all(5)),
              IconButton(
                icon: const FaIcon(
                  Icons.arrow_back,
                  color: AppColors.white,
                  size: 25,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              const CircleAvatar(
                backgroundImage: AssetImage(
                    'assets/images/discovery_page/psikolog/ChenZheyuan.jpg'),
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                width: 220,
                child: Text(
                  'Chen Zheyuan',
                  style: TextStyles.bold_24,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.more_horiz),
                iconSize: 30.0,
                color: Colors.white,
                onPressed: () {},
              ),
            ],
          ),
        ),

        //BODY
        body: Column(
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
            Container(
              color: AppColors.bgDarkMode,
              child: _buildTextComposerButton(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextComposerButton() {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: AppColors.darkModeCard,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.all(20.0),
      child: SizedBox(
        width: 180,
        child: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PsychologistDetailPage()),
            );
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                Colors.blue), // Set button color to blue
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(12), // Set border radius to 12
              ),
            ),
          ),
          child: Text(
            'Chat Again',
            style: TextStyles.GR_16_bold, // Adjust style as needed
          ),
        ),
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  const ChatMessage({required this.text, required this.isSender});

  final String text;
  final bool isSender;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      child: Row(
        mainAxisAlignment:
            isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          isSender
              ? const SizedBox()
              : Container(
                  width: 40.0,
                  height: 40.0,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/images/discovery_page/psikolog/ChenZheyuan.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
          const SizedBox(width: 10.0),
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
              padding: const EdgeInsets.all(10.0),
              child: Text(
                text,
                style: TextStyle(color: isSender ? Colors.white : Colors.black),
                softWrap: true,
              ),
            ),
          ),
          const SizedBox(width: 10.0),
          isSender
              ? Container(
                  width: 40.0,
                  height: 40.0,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/images/discovery_page/psikolog/ChenZheyuan.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
