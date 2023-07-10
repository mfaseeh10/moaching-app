import 'package:flutter/material.dart';
import 'package:moaching_app/authentication_module/views/login_module/bloc/bloc.dart';
import 'package:moaching_app/authentication_module/views/login_module/view/login.dart';
import 'package:moaching_app/authentication_module/views/signup_module/view/view.dart';

import '../../constants/constant_colors.dart';
import '../../custom_widget/custom_colored_button.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final TextEditingController? _email = TextEditingController();
  final TextEditingController? _password = TextEditingController();
  final FocusNode? _emailNode = FocusNode();
  final FocusNode? _passwordNode = FocusNode();
  LoginBloc? _loginBloc;
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size mediaData = MediaQuery.of(context).size;

    return Scaffold(
      // backgroundColor: ConstantColors.backgroundColor,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          fit: StackFit.passthrough,
          children: [
            Container(
              height: mediaData.height,
              child: Align(
                child: Image.asset(
                  'images/topleftcircle.png',
                  height: 150,
                ),
                alignment: Alignment.topLeft,
              ),
            ),
            Container(
              height: mediaData.height,
              child: Align(
                child: Image.asset(
                  alignment: Alignment.bottomRight,
                  'images/bottomrightcircle.png',
                  height: 250,
                ),
                alignment: Alignment.bottomRight,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: mediaData.height * 0.15,
                  ),
                  Image.asset('images/moachingLogo.png'),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Welcome to',
                    style: TextStyle(
                      fontSize: 32,
                    ),
                  ),
                  Text(
                    'Moaching',
                    style: TextStyle(
                      fontSize: 32,
                      color: ConstantColors.clickTextColor,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Moaching er et værktøj, som kan hjælpe dig på din vej til en sundere livsstil.',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomColoredButton(
                    showCircle: false,
                    label: 'Get Started',
                    mediaData: mediaData,
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => SignUp()));
                    },
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account? ",
                          style:
                              TextStyle(color: ConstantColors.backgroundColor)),
                      TextButton(
                        child: Text(
                          "Sign In",
                          style:
                              TextStyle(color: ConstantColors.clickTextColor),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
