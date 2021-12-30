import 'package:flutter/material.dart';
import './login_screen.dart';
import '../components/background.dart';

class RegisterScreen extends StatelessWidget {

  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Background(
        child: ListView(
          children: [
            SizedBox(height: 65,),
            Form(
              key: _key,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      "REGISTER",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 136, 34),
                          fontSize: 36
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),

                  SizedBox(height: size.height * 0.03),

                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    child: TextFormField(
                      validator: (value) {
                        if(value!.isEmpty){
                          return "Email can not Empty";
                        }else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          labelText: "Email"
                      ),
                    ),
                  ),

                  SizedBox(height: size.height * 0.03),

                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    child: TextFormField(
                      validator: (value) {
                        if(value!.isEmpty){
                          return "Phone Number can not Empty";
                        }else if(value!=10){
                          return "Phone Number must have 10 characters";
                        }else{
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          labelText: "Phone Number"
                      ),
                    ),
                  ),

                  SizedBox(height: size.height * 0.03),

                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    child: TextFormField(
                      validator: (value) {
                        if(value!.isEmpty){
                          return "User name can not Empty";
                        }else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          labelText: "Username"
                      ),
                    ),
                  ),

                  SizedBox(height: size.height * 0.03),

                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    child: TextFormField(
                      validator: (value) {
                        if(value!.isEmpty){
                          return "password is Empty";
                        }else if(value.length<6){
                          return "Password must be more than 6 characters";
                        }
                        else{
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          labelText: "Password"
                      ),
                      obscureText: true,
                    ),
                  ),

                  SizedBox(height: size.height * 0.05),

                  Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                    child: RaisedButton(
                      onPressed: () {
                        if (_key.currentState!.validate()) {

                        }
                      },
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                      textColor: Colors.white,
                      padding: const EdgeInsets.all(0),
                      child: Container(
                        alignment: Alignment.center,
                        height: 50.0,
                        width: size.width * 0.5,
                        decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(80.0),
                            gradient: new LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 255, 136, 34),
                                  Color.fromARGB(255, 255, 177, 41)
                                ]
                            )
                        ),
                        padding: const EdgeInsets.all(0),
                        child: Text(
                          "SIGN UP",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ),

                  Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                    child: GestureDetector(
                      onTap: () => {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()))
                      },
                      child: Text(
                        "Already Have an Account? Sign in",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2661FA)
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}