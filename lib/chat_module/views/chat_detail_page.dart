import 'package:flutter/material.dart';
import 'package:moaching_app/constants/constant_colors.dart';

class ChatDetailPage extends StatefulWidget {
  static String routeName = "/messageDetails";

  @override
  _ChatDetailPageState createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_rounded,
            color: ConstantColors.gradientSecond,
          ),
        ),
        title: Row(
          children: <Widget>[
            Container(
              width: 20,
              height: 40,
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      margin: EdgeInsets.all(2),
                      padding: EdgeInsets.all(1),
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.green,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Leonardo Dicaprio',
                  style: TextStyle(
                    color: ConstantColors.textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Last Active 2 hrs ago',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.video_call_outlined,
              color: ConstantColors.textColor,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.phone_outlined,
              color: ConstantColors.textColor,
            ),
          ),
          IconButton(
            onPressed: () {
              // Navigator.of(context).pushNamed(Routes.doctorProfile);
            },
            icon: Icon(
              Icons.more_vert,
              color: ConstantColors.textColor,
            ),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    MessageItem(
                      send: false,
                      message: 'Hello',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    MessageItem(
                      send: true,
                      message: 'Hello mate! \nHow are you?',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    MessageItem(
                      send: false,
                      message: 'Awesome! \nI hope you\'re doing well.',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    MessageItem(
                      send: false,
                      message: 'Don\'t forget about your next leg day :D .',
                    ),
                  ],
                ),
              ),
            ),
          ),
          SafeArea(
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.grey, width: 0.5),
                ),
              ),
              child: Row(
                children: <Widget>[
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.grey[400],
                      size: 25,
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide:
                              BorderSide(color: Colors.transparent, width: 0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide:
                              BorderSide(color: Colors.transparent, width: 0),
                        ),
                        filled: true,
                        fillColor: Colors.grey[100],
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 10,
                        ),
                        hintText: 'Say Something',
                        hintStyle: TextStyle(
                          color: Colors.grey[400],
                        ),
                      ),
                      autofocus: false,
                      style: TextStyle(
                        color: ConstantColors.gradientSecond,
                      ),
                      cursorWidth: 1,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.send,
                      //color: Colors.grey[300],
                      color: ConstantColors.gradientSecond.withOpacity(0.8),
                      size: 25,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MessageItem extends StatelessWidget {
  final bool send;
  final String message;

  const MessageItem({Key? key, required this.send, required this.message})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: send ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: <Widget>[
        Visibility(
          visible: !send,
          child: CircleAvatar(
            radius: 18,
            backgroundColor: Colors.transparent,
            child: Image.asset(
              'images/malepng.png',
              fit: BoxFit.fill,
            ),
          ),
        ),
        Flexible(
          child: Container(
            margin: EdgeInsets.only(
              left: !send ? 5 : (MediaQuery.of(context).size.width / 2) - 80,
              right: send ? 5 : (MediaQuery.of(context).size.width / 2) - 80,
            ),
            padding: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 15,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(send ? 20 : 0),
                bottomRight: Radius.circular(send ? 0 : 20),
              ),
              color: send
                  ? ConstantColors.gradientSecond.withOpacity(0.8)
                  : Color(0xffD3D3D3),
            ),
            child: SelectableText(
              message,
              style: TextStyle(
                color: send ? Colors.white : ConstantColors.textColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.start,
            ),
          ),
        ),
      ],
    );
  }
}
