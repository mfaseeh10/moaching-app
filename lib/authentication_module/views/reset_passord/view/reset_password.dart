part of'view.dart';




class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _email = TextEditingController();

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size mediaData = MediaQuery.of(context).size;
    return RepositoryProvider(
      create: (context) => UserRepository(),
      child: Scaffold(
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
                Container(
                  height: mediaData.height,
                  width: mediaData.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 180,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 28),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: ConstantColors.textFieldColor,
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      BlocProvider(
                        create: (context) => ResetBloc(
                            userRepository:
                            RepositoryProvider.of<UserRepository>(context)),
                       child: BlocConsumer<ResetBloc, ResetState>(
                         listener: (context, state) {
                           if (state.isSubmitting) {
                             var snackBar = SnackBar(
                               content: Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: const [
                                   Text('Sending Email ...'),
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
                                     builder: (context) => const LoginScreen()));
                           }
                         },
                         builder: (context , state)=> Column(
                           children: [
                             Container(
                               padding: EdgeInsets.only(left: 22, right: 22),
                               child: CustomTextFormField(
                                 controller: _email,
                                 hintText: 'Enter Your Email',
                                 obscureText: false,
                               ),
                             ),
                             SizedBox(
                               height: 30,
                             ),
                             Container(
                               padding: EdgeInsets.only(left: 10, right: 10),
                               child: CustomColoredButton(
                                 showCircle: state.isEmailSent,
                                 label: 'Reset Password',
                                 mediaData: mediaData,
                                 onTap: () {
                                   context.read<ResetBloc>().add(
                                     SendEmailForResetPassword(email:_email.text)
                                   );
                                 },
                               ),
                             ),
                           ],
                         ),
                       ),
                     )
                    ],
                  ),
                ),
                AppBar(
                  elevation: 0, backgroundColor: Colors.transparent, //
                  foregroundColor: Colors.black,
                ),
              ],
            ),
          )),
    );
  }
}
