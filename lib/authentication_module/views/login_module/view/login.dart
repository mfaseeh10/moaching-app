import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:moaching_app/authentication_module/repository/repository.dart';
import 'package:moaching_app/authentication_module/views/login_module/bloc/bloc.dart';
import 'package:moaching_app/authentication_module/views/reset_passord/view/view.dart';
import 'package:moaching_app/authentication_module/views/signup_module/view/view.dart';
import 'package:moaching_app/constants/constant_colors.dart';
import 'package:moaching_app/custom_widget/custom_colored_button.dart';
import 'package:moaching_app/custom_widget/custom_transparent_button.dart';
import 'package:moaching_app/custom_widget/text_form_field.dart';
import 'package:moaching_app/workout_module/views/training_program/views/create_training_program.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController? _email = TextEditingController();
  final TextEditingController? _password = TextEditingController();
  final FocusNode? _emailNode = FocusNode();
  final FocusNode? _passwordNode = FocusNode();
  LoginBloc? _loginBloc;
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  bool get isPopulated => _email!.text.isNotEmpty && _password!.text.isNotEmpty;

  bool isLoginButtonEnabled(LoginState state) {
    // return true;
    return state.isFormValid && isPopulated && !state.isSubmitting;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _email!.dispose();
    _password!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size mediaData = MediaQuery.of(context).size;

    return RepositoryProvider(
      create: (context) => UserRepository(),
      child: Scaffold(
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
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  BlocProvider(
                    create: (context) => LoginBloc(
                      userRepository:
                          RepositoryProvider.of<UserRepository>(context),
                    ),
                    child: BlocConsumer<LoginBloc, LoginState>(
                      listener: (context, state) {
                        if (state.isSubmitting) {
                          var snackBar = SnackBar(
                            content: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text('Logging In...'),
                                CircularProgressIndicator(),
                              ],
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }

                        if (state.isSuccess) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const CreateTrainingProgram()));
                        }
                      },
                      builder: (context, state) {
                        return Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 200),
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                  color: ConstantColors.textFieldColor,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              //margin: const EdgeInsets.only(top: 25.0),
                              padding:
                                  const EdgeInsets.only(left: 25, right: 25),
                              child: Form(
                                key: _key,
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 17,
                                    ),
                                    CustomTextFormField(
                                      controller: _email,
                                      hintText: 'Enter Your Email',
                                      obscureText: false,
                                    ),
                                    const SizedBox(
                                      height: 24,
                                    ),
                                    CustomTextFormField(
                                      controller: _password,
                                      hintText: 'Enter Your Password',
                                      obscureText: false,
                                    ),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ForgotPasswordScreen()));
                                            },
                                            child: Text(
                                              'Forgot your password?',
                                              style: TextStyle(
                                                color: ConstantColors
                                                    .textFieldColor
                                                    .withOpacity(0.8),
                                                fontSize: 12,
                                                fontFamily: 'Muli',
                                              ),
                                            ),
                                          ),
                                        ]),

                                    CustomColoredButton(
                                      showCircle: state.isLogin,
                                      label: 'Sign In',
                                      mediaData: mediaData,
                                      onTap: () {
                                        context.read<LoginBloc>().add(
                                              LoginWithCredentialsPressed(
                                                email: _email!.text,
                                                password: _password!.text,
                                              ),
                                            );
                                      },
                                    ),
                                    const SizedBox(
                                      height: 60,
                                    ),
                                    // ignore: prefer_const_constructors
                                    Center(
                                      // ignore: prefer_const_constructors
                                      child: Text(
                                        'Sign In with',
                                        // ignore: prefer_const_constructors
                                        style: TextStyle(
                                          color: ConstantColors.textFieldColor,
                                          fontSize: 12,
                                          fontFamily: 'Muli',
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CustomTransparentButton(
                                          mediaData: mediaData,
                                          onTap: () {
                                            // context
                                            //     .read<LoginBloc>()
                                            //     .add(LoginWithApplePressed());
                                          },
                                          iconData: FontAwesomeIcons.apple,
                                          label: '',
                                          color: Colors.black,
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        CustomTransparentButton(
                                          mediaData: mediaData,
                                          onTap: () {
                                            // context
                                            //     .read<LoginBloc>()
                                            //     .add(LoginWithFaceBookPressed());
                                          },
                                          iconData: FontAwesomeIcons.facebook,
                                          label: '',
                                          color: Colors.blue,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account? ",
                          style:
                              TextStyle(color: ConstantColors.backgroundColor)),
                      TextButton(
                        child: Text(
                          "Sign Up",
                          style:
                              TextStyle(color: ConstantColors.clickTextColor),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUp()));
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
