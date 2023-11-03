import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_posts_app/src/view/screens/sidebar.dart';
import 'package:flutter_posts_app/src/view/screens/posts_screen.dart';
import 'package:flutter_posts_app/src/view/screens/register_screen.dart';
// import 'package:flutter_posts_app/src/view/widgets/form_field_widget.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/post_controller.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  bool visiablePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: sidebar(),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Login Screen",
          style: GoogleFonts.acme(
            fontSize: 26,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FormBuilder(
              key: _formKey,
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: <Widget>[
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      prefixIcon: Icon(
                        Icons.mail
                      ),
                      labelText: "Enter your mail",
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: visiablePassword,
                    decoration: InputDecoration(
                      labelText: "Enter your password",
                      prefixIcon: Icon(
                        Icons.lock,
                      ),
                      suffixIcon: IconButton(
                        onPressed: (){
                          setState(() {
                            visiablePassword = !visiablePassword;
                          });
                        },
                        icon: Icon(
                          visiablePassword? Icons.visibility : Icons.visibility_off,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                      ) ,
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.black),
                      ),
                      child: Text(
                          'Login',
                        style: GoogleFonts.acme(
                          fontSize: 18,
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.saveAndValidate()) {
                          Get.to(PostsScreen());
                          Get.lazyPut(()=>PostController());
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.blue)
                      ),
                      child: Text(
                          'Register',
                        style: GoogleFonts.acme(
                          fontSize: 18,
                        ),
                      ),
                      onPressed: () {
                        Get.to(RegisterScreen());
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
