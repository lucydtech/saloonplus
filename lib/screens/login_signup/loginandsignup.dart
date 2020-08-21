import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';
import 'package:saloonplus/ThemeData/fontstyle.dart';

class LoginSignUp extends StatefulWidget {
  @override
  _LoginSignUpState createState() => _LoginSignUpState();
}

bool _isLoginObscurePressed = true;
bool _isSignUpObscurePwdPressed = true;
bool _isSignUpObscureCnfPwdPressed = true;
bool _isBarber = false;

class _LoginSignUpState extends State<LoginSignUp> with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    _tabController=TabController(length: 2, vsync: this);
    super.initState();
  }

  final loginFormKey = GlobalKey<FormState>();
  TextEditingController loginEmailController = new TextEditingController();
  TextEditingController loginPasswordController = new TextEditingController();

  final signUpFormKey = GlobalKey<FormState>();
  TextEditingController signUpFirstNameController = new TextEditingController();
  TextEditingController signUpLastNameController = new TextEditingController();
  TextEditingController signUpPasswordController = new TextEditingController();
  TextEditingController signUpCnfPasswordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Font_Style.primaryColor,
      body: SafeArea(
        child: KeyboardAvoider(
          autoScroll: true,
          child: Container(
            padding: EdgeInsets.only(left: 20.0.w, right: 20.0.w, top: 10.0.h, bottom: 10.0.h),
            height: MediaQuery.of(context).size.height - 80.0.h,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Spacer(),
                  TabBar(
                    indicatorColor: Font_Style.secondaryColor,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorPadding: EdgeInsets.symmetric(horizontal: 5.w),
                    controller: _tabController,
                    onTap: (int x){
                      _tabController.index = x;
                    },
                    labelPadding: EdgeInsets.only(bottom: 10.5.h,left: 0,right: 0),
                    labelColor: Font_Style.secondaryColor,
                    labelStyle: Font_Style().montserrat_SemiBold(null, 16.0),
                    unselectedLabelStyle:Font_Style().montserrat_Regular(Font_Style.secondaryColor.withOpacity(1), 16.0),
                    tabs: <Widget>[
                      Text("LOG IN"),
                      Text("SIGN UP"),
                    ],
                  ),
                  Container(
                    height: 445.0.h,
                      width: MediaQuery.of(context).size.width,
                      child: TabBarView(controller: _tabController,children: <Widget>[login(), signUp()]
                      )
                  ),
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
      padding: EdgeInsets.only(top: 35.0.h, bottom: 10.0.h, left: 10.0.w, right: 10.0.w),
      child: Form(
        key: loginFormKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              validator: (val){
                return EmailValidator.validate(val) && RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val) ?
                null : "Please enter a valid email";
              },
              controller: loginEmailController,
              maxLength: 35,
              decoration:
              Font_Style().setLable("Email Address", Icon(Icons.check, size: 15, color: Font_Style.secondaryColor,), context),
              keyboardType: TextInputType.emailAddress,
              cursorColor: Font_Style.secondaryColor,
              style:  Font_Style().textfield_style(),
            ),
            Spacer(flex: 1,),
            TextFormField(
              validator: (val){
                return val.length > 6 ? null : "Password too short";
              },
              controller: loginPasswordController,
              maxLength: 25,
              keyboardType: TextInputType.text,
              decoration: Font_Style().setLable(
                  "Password",
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          _isLoginObscurePressed = !_isLoginObscurePressed;
                        });
                      },
                      child: Icon(_isLoginObscurePressed ? Icons.visibility_off : Icons.visibility, size: 18, color: Font_Style.secondaryColor,)),context),
              cursorColor: Font_Style.secondaryColor,
              obscureText: _isLoginObscurePressed,
              style:  Font_Style().textfield_style(),
            ),
            Spacer(flex: 4,),
            _buttonWidget(context, "LOG IN"),
            Spacer(flex: 1,),
            Align(
              alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {

                  },
                    child: Text("Forgot Password?", style: Font_Style().montserrat_SemiBold(Font_Style.secondaryColor, 14),))
            ),
            Spacer(flex: 8,),
          ],
        ),
      ),
    );
  }

  Widget signUp() {
    return Container(
        padding: EdgeInsets.only(top: 35.0.h, bottom: 10.0.h, left: 10.0.w, right: 10.0.w),
      child: Form(
        key: signUpFormKey,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  child: Container(
                    width: 150.0.w,
                    child: TextFormField(
                      validator: (val){
                        return val.length > 2 ?
                        null : "First Name too short";
                      },
                      controller: signUpFirstNameController,
                      maxLength: 20,
                      decoration:
                      Font_Style().setLable("First Name", null, context),
                      keyboardType: TextInputType.text,
                      cursorColor: Font_Style.secondaryColor,
                      style:  Font_Style().textfield_style(),
                    ),
                  ),
                ),
                Flexible(
                  child: Container(
                    width: 150.0.w,
                    child: TextFormField(
                      validator: (val){
                        return val.length > 2 ?
                        null : "Last Name too short";
                      },
                      controller: signUpLastNameController,
                      maxLength: 20,
                      decoration:
                      Font_Style().setLable("Last Name", null, context),
                      keyboardType: TextInputType.text,
                      cursorColor: Font_Style.secondaryColor,
                      style:  Font_Style().textfield_style(),
                    ),
                  ),
                ),
              ],
            ),
            Spacer(flex: 2,),
            TextFormField(
              validator: (val){
                return EmailValidator.validate(val) && RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val) ?
                null : "Please enter a valid email";
              },
              controller: loginEmailController,
              maxLength: 35,
              decoration:
              Font_Style().setLable("Email Address", Icon(Icons.check, size: 15, color: Font_Style.secondaryColor,), context),
              keyboardType: TextInputType.emailAddress,
              cursorColor: Font_Style.secondaryColor,
              style:  Font_Style().textfield_style(),
            ),
            Spacer(flex: 2,),
            TextFormField(
              validator: (val){
                return val.length > 6 ? null : "Password too short";
              },
              controller: signUpPasswordController,
              maxLength: 25,
              keyboardType: TextInputType.text,
              decoration: Font_Style().setLable(
                  "Password",
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          _isSignUpObscurePwdPressed = !_isSignUpObscurePwdPressed;
                        });
                      },
                      child: Icon(_isSignUpObscurePwdPressed ? Icons.visibility_off : Icons.visibility, size: 18, color: Font_Style.secondaryColor,)),context),
              cursorColor: Font_Style.secondaryColor,
              obscureText: _isSignUpObscurePwdPressed,
              style:  Font_Style().textfield_style(),
            ),
            Spacer(flex: 2,),
            TextFormField(
              validator: (val){
                return val.length > 6 ? ((signUpPasswordController.text == val) ? null : "Password and Confirm Password do not match") : "Confirm Password too short";
              },
              controller: signUpCnfPasswordController,
              maxLength: 25,
              keyboardType: TextInputType.text,
              decoration: Font_Style().setLable(
                  "Confirm Password",
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          _isSignUpObscureCnfPwdPressed = !_isSignUpObscureCnfPwdPressed;
                        });
                      },
                      child: Icon(_isSignUpObscureCnfPwdPressed ? Icons.visibility_off : Icons.visibility, size: 18, color: Font_Style.secondaryColor,)),context),
              cursorColor: Font_Style.secondaryColor,
              obscureText: _isSignUpObscureCnfPwdPressed,
              style:  Font_Style().textfield_style(),
            ),
            Spacer(flex: 3,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Are you a Barber?", style: Font_Style().montserrat_SemiBold(Colors.white, 14),),
                Spacer(flex: 2,),
                InkWell(
                  onTap: () {
                    if(_isBarber) {
                      setState(() {
                        _isBarber = !_isBarber;
                      });
                    }
                  },
                  child: Container(
                    height: 22.0.h,
                    width: 55.0.w,
                    padding: EdgeInsets.all(2.0.h),
                    decoration: !_isBarber ? BoxDecoration(
                        color: Font_Style.secondaryColor, borderRadius: BorderRadius.circular(30)) : null,
                    child: Center(child: Text("NO", style: Font_Style().montserrat_Bold(!_isBarber ? Font_Style.primaryColor : Colors.white, 14),)),
                  ),
                ),
                Spacer(flex: 1,),
                InkWell(
                  onTap: () {
                    if(!_isBarber) {
                      setState(() {
                        _isBarber = !_isBarber;
                      });
                    }
                  },
                  child: Container(
                    height: 22.0.h,
                    width: 55.0.w,
                    padding: EdgeInsets.all(2.0.h),
                    decoration: _isBarber ? BoxDecoration(
                        color: Font_Style.secondaryColor, borderRadius: BorderRadius.circular(30)) : null,
                    child: Center(child: Text("YES", style: Font_Style().montserrat_Bold(_isBarber ? Font_Style.primaryColor : Colors.white, 14),)),
                  ),
                ),
                Spacer(flex: 6,),
              ],
            ),
            Spacer(flex: 4,),
            _buttonWidget(context, "SIGN UP"),
            Spacer(flex: 4,),
          ],
        ),
      )
    );
  }

  Widget _buttonWidget(BuildContext context, String btnTitle) {
    return Container(
      child: InkWell(
        onTap: (){
          if(btnTitle == "LOG IN") {
            if(loginFormKey.currentState.validate()) {
              Navigator.pushNamed(context, "/bottom_nav");
            }
          }
          else {
            if(signUpFormKey.currentState.validate()) {

            }
          }
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Font_Style.secondaryColor, borderRadius: BorderRadius.circular(10)),
          height: 48.h,
          child: Center(
            child: Text(
                btnTitle,
                style: Font_Style().montserrat_Bold(Font_Style.primaryColor, 19)
            ),
          ),
        ),
      ),
    );
  }
}
