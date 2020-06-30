import 'dart:convert';

import 'package:aliexpress/ui/widgets/bezier_container.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegistrationScreen extends StatelessWidget {
  static const String routeName = '/registration_screen';

  //Ekranni yopish tugmasi
  Widget _backButton(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            Text('Back',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

  //Orqa fonga Gradient rang berish
  Widget _background(){
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(215, 117, 255, 1).withOpacity(0.5),
            Color.fromRGBO(255, 188, 117, 1).withOpacity(0.9),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0, 1],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      //Ma'lumot kiritish uchun TextFieldni bosganimizda
      //klaviatura chiqqan paytda Xatolik bermasligi uchun
      //SingleChildScrollView dan foydalanildi
      body: SingleChildScrollView(
        child: Container(
          height: deviceSize.height,
          width: deviceSize.width,
          child: Stack(
            children: <Widget>[
              _background(),
              //Erkanni o'zgaruvchan qismi
              RegistrationWidget(),
              Positioned(top: 40, left: 0, child: _backButton(context)),
              Positioned(
                  top: -MediaQuery.of(context).size.height * .17,
                  right: -MediaQuery.of(context).size.width * .45,
                  child: BezierContainer())
            ],
          ),
        ),
      ),
    );
  }
}


// O'zgaruvchi ekranni holatlari
enum RegistrationMode { Signup, Login }

class RegistrationWidget extends StatefulWidget {
  @override
  _RegistrationWidgetState createState() => _RegistrationWidgetState();
}

class _RegistrationWidgetState extends State<RegistrationWidget> {

  // Form Holatini saqlash uchun unikal kalit
  final GlobalKey<FormState> _formKey = GlobalKey();
  var _isLoading = false;
  final _passwordController = TextEditingController();
  RegistrationMode _registrationMode = RegistrationMode.Login;
  Map<String, String> _registrationData = {
    'email': '',
    'password': '',
  };

  _changeAuthMode()  async {
    if (_registrationMode == RegistrationMode.Login) {
      setState(() {
        _registrationMode = RegistrationMode.Signup;
      });
    } else {
      setState(() {
        _registrationMode = RegistrationMode.Login;
      });
    }
  }

  _submit() async {
    if (!_formKey.currentState.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });


    final pref = await SharedPreferences.getInstance();
    var _userData = json.encode({
      'email': _registrationData['email'],
      'password': _registrationData['password']
    });
    pref.setString('userData', _userData);
    /*
    _registrationData email va parol orqali serverga zaproq yozish
     */
    await Future.delayed(Duration(milliseconds: 500));

    setState(() {
      _isLoading = false;
    });
  }

  Widget _entryField(String title,
      {bool isPassword = false, isSignup = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
              obscureText: isPassword,
              controller: (isPassword && !isSignup) ? _passwordController : null,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true),
            // ignore: missing_return
            validator: (value){
                if(isPassword){
                  if(isSignup){
                    if(value != _passwordController.text){
                      return 'Your password is not match';
                    }
                  }else if (value.length < 5){
                    return 'Your password is weak';
                  }
                }else{
                  if(value.isEmpty || !value.contains('@')){
                    return 'Invalid email';
                  }
                }
            },
            onSaved: (value){
              (isPassword) ? _registrationData['password'] = value : _registrationData['email'] = value;
            },
          )
        ],
      ),
    );
  }

  Widget _submitButton() {
    return InkWell(
      onTap: _submit,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey,
                  offset: Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xfffbb448), Color(0xfff7892b)])),
        child: Text(
          (_registrationMode == RegistrationMode.Login) ? 'Login' : 'SignUp',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'Ali',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.headline4,
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Color(0xffe46b10),
          ),
          children: [
            TextSpan(
              text: 'E',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
            TextSpan(
              text: 'xpress',
              style: TextStyle(color: Color(0xffe46b10), fontSize: 30),
            ),
          ]),
    );
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        _entryField("Email"),
        _entryField("Password", isPassword: true),
        if (_registrationMode == RegistrationMode.Signup)
          _entryField("Confirm Password", isPassword: true, isSignup: true),
      ],
    );
  }

  Widget _changeModeButton() {
    return FlatButton(
      child: Text(
        '${_registrationMode == RegistrationMode.Login ? 'SIGNUP' : 'LOGIN'} INSTEAD', style: TextStyle(fontSize: 14.0 ),),
      onPressed: _changeAuthMode,
      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 4),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      textColor: Theme.of(context).primaryColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 3,
              child: SizedBox(),
            ),
            _title(),
            SizedBox(
              height: 50,
            ),
            _emailPasswordWidget(),
            SizedBox(
              height: 20,
            ),
            (!_isLoading) ? _submitButton() : CircularProgressIndicator(),
            SizedBox(
              height: 10,
            ),
            _changeModeButton(),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
