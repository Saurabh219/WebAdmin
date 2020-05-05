import 'package:flutter/material.dart';
import 'package:webapp/app_config.dart';
import 'package:webapp/component/widgetcomponent.dart';
import 'package:webapp/constent/constent.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:  Center(
          child: Container(
            color: Colors.white,
            width: App(context).appWidth(30),
            height: App(context).appHeight(40),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Store",
                    style: greyStyle,
                  ),
                  Text(
                    "Manager",
                    style: boldStyle,
                  ),

                  SizedBox(
                    height: 30.0,
                  ),


                  TextField(
                    onChanged: (v){

                    },
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.black),
                      hintText: 'Email',
                      enabledBorder: OutlineInputBorder(
                        borderRadius:BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(0),
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(0),
                        ),
                        borderSide: BorderSide(
                          color: Color(0xffFD564F),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(0),
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(0),
                        ),
                        borderSide: BorderSide(
                          color: Color(0xffFD564F),
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Color(0xffFD564F),
                      ),
                    ),
                  ),

                  TextField(
                    onChanged: (v){

                    },
                    obscureText: true,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.black),
                      hintText: 'Password',
                      enabledBorder: OutlineInputBorder(
                        borderRadius:BorderRadius.only(
                          topRight: Radius.circular(0),
                          bottomRight: Radius.circular(0),
                          topLeft: Radius.circular(0),
                          bottomLeft: Radius.circular(0),
                        ),
                        borderSide: BorderSide(
                          color: Color(0xffFD564F),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:BorderRadius.only(
                          topRight: Radius.circular(0),
                          bottomRight: Radius.circular(0),
                          topLeft: Radius.circular(0),
                          bottomLeft: Radius.circular(0),
                        ),
                        borderSide: BorderSide(
                          color: Color(0xffFD564F),
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.vpn_key,
                        color:Color(0xffFD564F),
                      ),
                    ),
                  ),

                  LoginButton(
                    btntext: 'Sign in',
                    click: () async{

                    },
                  ),


                ],
              ),
            ),
          ),
        )
      ),
    );
  }
}


