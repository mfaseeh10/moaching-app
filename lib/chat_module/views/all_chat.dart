import 'package:flutter/material.dart';
import 'package:moaching_app/chat_module/views/chat_detail_page.dart';
import 'package:moaching_app/constants/constant_colors.dart';

class AllChatScreen extends StatefulWidget {
  // static String routeName = "/messagePage";

  @override
  _AllChatScreenState createState() => _AllChatScreenState();
}

class _AllChatScreenState extends State<AllChatScreen>
    with AutomaticKeepAliveClientMixin<AllChatScreen> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      // appBar: AppBar(
      //   leading: GestureDetector(
      //     onTap: () {
      //       Navigator.pop(context);
      //     },
      //     child: Icon(
      //       Icons.arrow_back_rounded,
      //       color: ConstantColors.gradientSecond,
      //     ),
      //   ),
      //   backgroundColor: Colors.white,
      //   title: Text(
      //     'Messages',
      //     style: TextStyle(
      //         color: ConstantColors.gradientFirst,
      //         fontFamily: 'Muli',
      //         fontWeight: FontWeight.w700),
      //   ),
      // ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
                padding:
                    EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Chat (2)',
                      style: TextStyle(
                        color: ConstantColors.gradientSecond,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage(
                        'images/female_image3.png',
                      ),
                      // child: ClipRRect(
                      //   child: Image.asset(
                      //     'images/female_image3.png',
                      //     fit: BoxFit.fill,
                      //   ),
                      //   borderRadius: BorderRadius.circular(500.0),
                      // ),
                    ),
                  ],
                )),
            MessageListItem(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ChatDetailPage()));
              },
              imagePath: 'images/malepng.png',
              name: 'Leonardo Dicaprio',
              message: 'Wow that\'s awesome',
              time: '10 Min',
              unread: 10,
              online: false,
            ),
            MessageListItem(
              onTap: () {
                // Navigator.pushNamed(
                //   context,
                //   MessagesDetailPage.routeName,
                // );
              },
              imagePath: 'images/female_image2.png',
              name: 'Ana De Armas',
              message: 'Don\'t forget your leg day',
              time: '22 Min',
              unread: 2,
              online: true,
            ),
            MessageListItem(
              onTap: () {
                // Navigator.pushNamed(
                //   context,
                //   MessagesDetailPage.routeName,
                // );
              },
              imagePath: 'images/carol_hawkins_image.png',
              name: 'Liza Anderson',
              message: 'You: Good news 😃',
              time: '22 Min',
              unread: 0,
              online: false,
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class MessageListItem extends StatelessWidget {
  final VoidCallback onTap;
  final String imagePath;
  final String name;
  final String message;
  final String time;
  final int unread;
  final bool online;

  const MessageListItem(
      {Key? key,
      required this.onTap,
      required this.imagePath,
      required this.name,
      required this.message,
      required this.time,
      required this.unread,
      required this.online})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          children: <Widget>[
            Container(
              width: 50,
              height: 50,
              child: Stack(
                children: <Widget>[
                  CircleAvatar(
                    radius: 22.5,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage(
                      imagePath,
                    ),
                  ),
                  Visibility(
                    visible: online,
                    child: Align(
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
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    name,
                    style: TextStyle(
                      color: ConstantColors.textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    message,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Column(
              //crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  time,
                  style: TextStyle(
                    color: ConstantColors.gradientSecond.withOpacity(0.8),
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Visibility(
                  visible: (unread != 0 && unread != null) ? true : false,
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      //  borderRadius: BorderRadius.circular(100),
                      color: ConstantColors.gradientSecond.withOpacity(0.8),
                    ),
                    child: Text(
                      unread.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
