import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';
import 'package:saloon_plus_barber/ThemeData/fontstyle.dart';
import 'package:saloon_plus_barber/screens/components/bottom_nav.dart';

class LoginSignUp extends StatefulWidget {
  @override
  _LoginSignUpState createState() => _LoginSignUpState();
}

bool _isLoginObscurePressed = true;
bool _isSignUpObscurePwdPressed = true;
bool _isSignUpObscureCnfPwdPressed = true;

class _LoginSignUpState extends State<LoginSignUp>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  final loginFormKey = GlobalKey<FormState>();
  TextEditingController loginEmailController = new TextEditingController();
  TextEditingController loginPasswordController = new TextEditingController();

  final _signUpFormKey = GlobalKey<FormState>();
  TextEditingController signUpFirstNameController = new TextEditingController();
  TextEditingController signUpLastNameController = new TextEditingController();
  TextEditingController signUpPasswordController = new TextEditingController();
  TextEditingController signUpCnfPasswordController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FontStyle.primaryColor,
      body: SafeArea(
        child: KeyboardAvoider(
          autoScroll: true,
          child: Container(
            padding: EdgeInsets.only(
                left: 20.0.w, right: 20.0.w, top: 10.0.h, bottom: 10.0.h),
            height: MediaQuery.of(context).size.height - 80.0.h,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Spacer(),
                  TabBar(
                    indicatorColor: FontStyle.secondaryColor,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorPadding: EdgeInsets.symmetric(horizontal: 5.w),
                    controller: _tabController,
                    onTap: (int x) {
                      _tabController.index = x;
                    },
                    labelPadding:
                        EdgeInsets.only(bottom: 10.5.h, left: 0, right: 0),
                    labelColor: FontStyle.secondaryColor,
                    labelStyle: FontStyle.productsansSemiBold(null, 16.0),
                    unselectedLabelStyle: FontStyle.productsansRegular(
                        FontStyle.secondaryColor.withOpacity(1), 16.0),
                    tabs: <Widget>[
                      Text("LOG IN"),
                      Text("SIGN UP"),
                    ],
                  ),
                  Container(
                      height: 445.0.h,
                      width: MediaQuery.of(context).size.width,
                      child: TabBarView(
                          controller: _tabController,
                          children: <Widget>[login(), signUp()])),
                  Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget login() {
    return Container(
      padding: EdgeInsets.only(
          top: 35.0.h, bottom: 10.0.h, left: 10.0.w, right: 10.0.w),
      child: Form(
        key: loginFormKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              validator: (val) {
                return EmailValidator.validate(val) &&
                        RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(val)
                    ? null
                    : "Please enter a valid email";
              },
              controller: loginEmailController,
              maxLength: 35,
              decoration: FontStyle.setLable(
                  "Email Address",
                  Icon(
                    Icons.mail,
                    size: 22,
                    color: FontStyle.secondaryColor,
                  ),
                  context),
              keyboardType: TextInputType.emailAddress,
              cursorColor: FontStyle.secondaryColor,
              style: FontStyle.textFieldStyle(),
            ),
            Spacer(
              flex: 1,
            ),
            TextFormField(
              validator: (val) {
                return val.length > 6 ? null : "Password too short";
              },
              controller: loginPasswordController,
              maxLength: 25,
              keyboardType: TextInputType.text,
              decoration: FontStyle.setLable(
                  "Password",
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          _isLoginObscurePressed = !_isLoginObscurePressed;
                        });
                      },
                      child: Icon(
                        _isLoginObscurePressed
                            ? Icons.visibility_off
                            : Icons.visibility,
                        size: 22,
                        color: FontStyle.secondaryColor,
                      )),
                  context),
              cursorColor: FontStyle.secondaryColor,
              obscureText: _isLoginObscurePressed,
              style: FontStyle.textFieldStyle(),
            ),
            Spacer(
              flex: 4,
            ),
            _buttonWidget(context, "LOG IN"),
            Spacer(
              flex: 1,
            ),
            Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                    onTap: () {},
                    child: Text(
                      "Forgot Password?",
                      style: FontStyle.productsansSemiBoldUnderline(
                          FontStyle.secondaryColorWithOpacity, 14),
                    ))),
            Spacer(
              flex: 8,
            ),
          ],
        ),
      ),
    );
  }

  Widget signUp() {
    return Container(
        padding: EdgeInsets.only(
            top: 35.0.h, bottom: 10.0.h, left: 10.0.w, right: 10.0.w),
        child: Form(
          key: _signUpFormKey,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    child: Container(
                      width: 150.0.w,
                      child: TextFormField(
                        validator: (val) {
                          return val.length > 2 ? null : "First Name too short";
                        },
                        controller: signUpFirstNameController,
                        maxLength: 20,
                        decoration:
                            FontStyle.setLable("First Name", null, context),
                        keyboardType: TextInputType.text,
                        cursorColor: FontStyle.secondaryColor,
                        style: FontStyle.textFieldStyle(),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      width: 150.0.w,
                      child: TextFormField(
                        validator: (val) {
                          return val.length > 2 ? null : "Last Name too short";
                        },
                        controller: signUpLastNameController,
                        maxLength: 20,
                        decoration:
                            FontStyle.setLable("Last Name", null, context),
                        keyboardType: TextInputType.text,
                        cursorColor: FontStyle.secondaryColor,
                        style: FontStyle.textFieldStyle(),
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(
                flex: 2,
              ),
              TextFormField(
                validator: (val) {
                  return EmailValidator.validate(val) &&
                          RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(val)
                      ? null
                      : "Please enter a valid email";
                },
                controller: loginEmailController,
                maxLength: 35,
                decoration: FontStyle.setLable(
                    "Email Address",
                    Icon(
                      Icons.mail,
                      size: 22,
                      color: FontStyle.secondaryColor,
                    ),
                    context),
                keyboardType: TextInputType.emailAddress,
                cursorColor: FontStyle.secondaryColor,
                style: FontStyle.textFieldStyle(),
              ),
              Spacer(
                flex: 2,
              ),
              TextFormField(
                validator: (val) {
                  return val.length > 6 ? null : "Password too short";
                },
                controller: signUpPasswordController,
                maxLength: 25,
                keyboardType: TextInputType.text,
                decoration: FontStyle.setLable(
                    "Password",
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            _isSignUpObscurePwdPressed =
                                !_isSignUpObscurePwdPressed;
                          });
                        },
                        child: Icon(
                          _isSignUpObscurePwdPressed
                              ? Icons.visibility_off
                              : Icons.visibility,
                          size: 22,
                          color: FontStyle.secondaryColor,
                        )),
                    context),
                cursorColor: FontStyle.secondaryColor,
                obscureText: _isSignUpObscurePwdPressed,
                style: FontStyle.textFieldStyle(),
              ),
              Spacer(
                flex: 2,
              ),
              TextFormField(
                validator: (val) {
                  return val.length > 6
                      ? ((signUpPasswordController.text == val)
                          ? null
                          : "Password and Confirm Password do not match")
                      : "Confirm Password too short";
                },
                controller: signUpCnfPasswordController,
                maxLength: 25,
                keyboardType: TextInputType.text,
                decoration: FontStyle.setLable(
                    "Confirm Password",
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            _isSignUpObscureCnfPwdPressed =
                                !_isSignUpObscureCnfPwdPressed;
                          });
                        },
                        child: Icon(
                          _isSignUpObscureCnfPwdPressed
                              ? Icons.visibility_off
                              : Icons.visibility,
                          size: 22,
                          color: FontStyle.secondaryColor,
                        )),
                    context),
                cursorColor: FontStyle.secondaryColor,
                obscureText: _isSignUpObscureCnfPwdPressed,
                style: FontStyle.textFieldStyle(),
              ),
              Spacer(
                flex: 3,
              ),
              _buttonWidget(context, "SIGN UP"),
              Spacer(
                flex: 4,
              ),
            ],
          ),
        ));
  }

  Widget _buttonWidget(BuildContext context, String btnTitle) {
    return Container(
      child: InkWell(
        onTap: () {
          if (btnTitle == "LOG IN") {
            if (loginFormKey.currentState.validate()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BottomNav(
                          currentIndex: 1,
                        )),
              );
            }
          } else {
            if (_signUpFormKey.currentState.validate()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BottomNav(
                          currentIndex: 1,
                        )),
              );
            }
          }
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: FontStyle.secondaryColor,
              borderRadius: BorderRadius.circular(10)),
          height: 48.h,
          child: Center(
            child: Text(btnTitle,
                style: FontStyle.productsansBold(FontStyle.primaryColor, 19)),
          ),
        ),
      ),
    );
  }
}
