import 'package:educational_institute/Services/AuthentificationSerivce.dart';
import 'package:educational_institute/Services/navigating_page.dart';
import 'package:educational_institute/Services/show_dialogue.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_core/firebase_core.dart';

// to validate form
final GlobalKey<FormState> _formKey = GlobalKey();

class LoginTextField extends StatefulWidget {
  //validating text
  String validateText;
  //padding size
  double padding;
  //hint and label for textfield
  String hint;
  //to determine either its password or username
  bool textFieldIsPassword;
  //icon for textfield
  IconData iconData;

  //validating funciton
  final fieldController;

  //constructure
  LoginTextField({
    @required this.fieldController,
    @required this.textFieldIsPassword,
    @required this.padding,
    @required this.hint,
    @required this.iconData,
    @required this.validateText,
    //@required this.validatingFunction,
  });

  @override
  _LoginTextFieldState createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  var validatingFunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: widget.padding, right: widget.padding),
      child: TextFormField(
        keyboardType:
            widget.textFieldIsPassword ? TextInputType.emailAddress : null,
        controller: widget.fieldController,

        //this is for password textfield
        obscureText: widget.textFieldIsPassword,
        decoration: InputDecoration(
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),

          //focus border to set border property when clicked
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          border: InputBorder.none,
          prefixIcon: Icon(
            widget.iconData,
            color: Colors.blue,
          ),
          hintText: widget.hint,
          hintStyle: TextStyle(color: Colors.blue),
          //this is how we fill background color
          filled: true,
          fillColor: Colors.grey[100],
          //errorText: isUserNameValidate ? '* required' : null,
          //making boarder of textfield
        ),
        validator: (value) {
          if (value.isEmpty) {
            return widget.validateText;
          }
          return null;
        },
      ),
    );
  }
}

class InstituteLogIn extends StatefulWidget {
  @override
  _InstituteLogInState createState() => _InstituteLogInState();
}

class _InstituteLogInState extends State<InstituteLogIn> {
  bool isUserNameValidate = false;
  String _email = 'mrtspkt@gmail.com';

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });
  }

  var _usernameController = new TextEditingController();
  var _passwordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            //resizeToAvoidBottomInset: false,
            body: Column(
              //NOTE: expanded widget divides flex property to all its child
              children: [
                SvgPicture.asset(
                  'assets/images/EI-logo.svg',
                  height: size.height * 0.2,
                  color: Colors.blue,
                ),
                Text(
                  'Educational Institute',
                  style: TextStyle(
                      fontSize: size.height * 0.04, color: Colors.blue),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: size.height * 0.2,
                          ),
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                LoginTextField(
                                  fieldController: _usernameController,
                                  iconData: Icons.account_circle,
                                  padding: size.width * 0.05,
                                  hint: 'Username/Email',
                                  textFieldIsPassword: false,
                                  validateText: 'Please Enter Username/Email',
                                ),
                                SizedBox(
                                  height: size.height * 0.05,
                                ),
                                LoginTextField(
                                  // validator:
                                  fieldController: _passwordController,
                                  iconData: Icons.vpn_key,
                                  padding: size.width * 0.05,
                                  hint: 'Password',
                                  textFieldIsPassword: true,
                                  validateText: 'Please Enter Password',
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.1,
                          ),
                          Container(
                            width: size.width * 0.4,
                            height: size.height * 0.05,
                            child: RaisedButton(
                              color: Colors.blue.shade900,
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  FocusScope.of(context)
                                      .requestFocus(new FocusNode());
                                  AuthWrapper().fromInstituteLogInScreen(
                                      context,
                                      _usernameController.text,
                                      _passwordController.text);
                                  _usernameController.clear();
                                  _passwordController.clear();
                                  DialogServices().showLoaderDialog(
                                      context, 'Loggine In..');
                                }
                              },
                              shape: RoundedRectangleBorder(
                                  //for rounded border
                                  borderRadius:
                                      BorderRadius.circular(size.height * 0.02),
                                  side: BorderSide(color: Colors.transparent)),
                              child: Text(
                                'Log In',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          InkWell(
                            onTap: () async {
                              await AuthServices(FirebaseAuth.instance)
                                  .resetPassword(_email, context)
                                  .then((value) => showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: Text('Success'),
                                            content: Text(
                                                'Reset email has been sent to your email'),
                                          );
                                        },
                                      ));
                            },
                            child: Text(
                              'forget password?',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
