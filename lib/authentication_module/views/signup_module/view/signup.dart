part of'view.dart';

enum policyAgreement { yes, no }

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmpassword = TextEditingController();
  final TextEditingController _repeatemail = TextEditingController();
  final FocusNode _userNameNode = FocusNode();
  final FocusNode _emailNode = FocusNode();
  final FocusNode _passwordNode = FocusNode();
  final FocusNode _conformPasswordNode = FocusNode();
  final FocusNode _experienceLevelNode = FocusNode();

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  bool get isPopulated => _email.text.isNotEmpty && _password.text.isNotEmpty;
  bool isLoginButtonEnabled(RegisterState state) {
    // return true;
    return state.isFormValid && isPopulated && !state.isSubmitting;
  }

  policyAgreement? _character = policyAgreement.no;

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
              AppBar(
                elevation: 0, backgroundColor: Colors.transparent, //
                foregroundColor: Colors.black,
              ),
              Container(
                margin: EdgeInsets.only(top: 60.0),
    child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                BlocProvider(
                  create: (context) => RegisterBloc(
                      userRepository:
                          RepositoryProvider.of<UserRepository>(context)),
                  child: BlocConsumer<RegisterBloc, RegisterState>(
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

                      if(state.isSuccess){
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    GenderSelectScreen()));
                      }
                    },
                    builder: (context, state) {
                      return Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 80),
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                color: ConstantColors.textFieldColor,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            //margin: const EdgeInsets.only(top: 25.0),
                            padding: const EdgeInsets.only(left: 25, right: 25),
                            child: Form(
                              key: _key,
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 17,
                                  ),
                                  CustomTextFormField(
                                    controller: _firstName,
                                    hintText: 'First Name',
                                    obscureText: false,
                                  ),
                                  const SizedBox(
                                    height: 17,
                                  ),
                                  CustomTextFormField(
                                    controller: _lastName,
                                    hintText: 'Last Name',
                                    obscureText: false,
                                  ),
                                  const SizedBox(
                                    height: 17,
                                  ),
                                  CustomTextFormField(
                                    controller: _email,
                                    hintText: 'Enter Your Email',
                                    obscureText: false,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  CustomTextFormField(
                                    controller: _repeatemail,
                                    hintText: 'Repeat Email',
                                    obscureText: false,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  CustomTextFormField(
                                    controller: _password,
                                    hintText: 'Enter Your Password',
                                    obscureText: false,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  CustomTextFormField(
                                    controller: _confirmpassword,
                                    hintText: 'Repeat Your Password',
                                    obscureText: false,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  ListTile(
                                    title: const Text(
                                      'By Continuing you accept our privacy policy',
                                      style: TextStyle(fontSize: 10),
                                    ),
                                    leading: Radio<policyAgreement>(
                                      activeColor:
                                          ConstantColors.textFieldColor,
                                      value: policyAgreement.yes,
                                      groupValue: _character,
                                      onChanged: (policyAgreement? value) {
                                        setState(() {
                                          _character = value;
                                        });
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 17,
                                  ),
                                  CustomColoredButton(
                                    showCircle: state.isSignin,
                                    label: 'Sign Up',
                                    mediaData: mediaData,
                                    onTap: () {
                                      print("HELLO");
                                      final UserModel userModel = UserModel(
                                        firstName:_firstName.text,
                                        lastName:_lastName.text,
                                        email: _email.text,
                                        conformEmail : _repeatemail.text,
                                        password: _password.text,
                                        conformPassword :_confirmpassword.text,);

                                      context.read<RegisterBloc>().add(
                                        RegisterWithCredentialsPressed(
                                          userModel: userModel),
                                      );


                                    },
                                  ),
                                  const SizedBox(
                                    height: 90,
                                  ),
                                  // ignore: prefer_const_constructors
                                ],
                              ),
                            ))]);
                          // if(state.isSuccess){
                          //   Navigator.pushReplacement(
                          //       context,
                          //       MaterialPageRoute(
                          //           builder: (context) => const HomeScreen()));
                          // }
                      },

                      ),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                  ],
                ),
              ),
            ],
          ))),
    );
  }
}
