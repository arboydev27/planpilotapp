// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:planpilot/authentication_pages/resetpassword_page.dart';

class LoginPage extends StatefulWidget {

  final VoidCallback showRegisterPage;
  final VoidCallback showResetPasswordPage;

  const LoginPage({
    super.key,
    required this.showRegisterPage,
    required this.showResetPasswordPage
    });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // Method for Signin In
  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(), 
      password: _passwordController.text.trim());
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F0F0),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                // Image for the page
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 85),
                  child: Image.asset("assets/images/Tasks complete.png" ),
                ),
            
                SizedBox(height: 10),
            
                // Login here
                Text(
                  "Login here", 
                  style: GoogleFonts.poppins(fontSize: 42, fontWeight:FontWeight.bold, color: Color(0xFF191645)
                  ),
                ),
            
                SizedBox(height: 10),
            
                // Nice login message
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Text(
                    "Hello again! We're glad you're back", 
                    style: GoogleFonts.poppins(fontSize: 20, fontWeight:FontWeight.w600, color: Color(0xFF191645)
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
            
                SizedBox(height: 32),
            
                // Email textfield
                Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: TextField(
                        controller: _emailController, //Add text editing controller
                        style: GoogleFonts.poppins(),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF43C6AC)),
                            borderRadius: BorderRadius.circular(12)
                          ),
                          hintText: "Email",
                          hintStyle: GoogleFonts.poppins(fontSize: 14, color: Colors.grey),
                          fillColor: Color(0xFFDFDFDF),
                          filled: true,
                        ),
                      ),
                    ),
            
                SizedBox(height: 10),
            
                // Password textfield
                Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: TextField(
                        controller: _passwordController, //Add text editing controller
                        obscureText: true,
                        autocorrect: false,
                        style: GoogleFonts.poppins(),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF43C6AC)),
                            borderRadius: BorderRadius.circular(12)
                          ),
                          hintText: "Password", 
                          hintStyle: GoogleFonts.poppins(fontSize: 14, color: Colors.grey),
                          fillColor: Color(0xFFDFDFDF),
                          filled: true,
                        ),
                      ),
                    ),
                
                SizedBox(height: 10),

                // Row for Forgot passwords
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        /*
                        onTap: () {
                          Navigator.push(
                            context, 
                            MaterialPageRoute(
                              builder: (context) {
                                return ResetPasswordPage(showRegisterPage: widget.showRegisterPage,);
                              })
                          );
                        },
                        */
                        onTap: widget.showResetPasswordPage,
                        child: Text(
                          "Forgot Password?", 
                          style: GoogleFonts.poppins(fontSize: 14, fontWeight:FontWeight.w600, color: Color(0xFF43C6AC)
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 10),
            
                // Sign in button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: GestureDetector(
                    onTap: signIn,  //Add onTap method
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Color(0xFF191645),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text("Sign In",
                        style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                        )
                        ),
                    ),
                  ),
                ),

                SizedBox(height: 10),
            
                // Link to create an account
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text(
                      "Not a member yet?", 
                      style: GoogleFonts.poppins(fontSize: 14, fontWeight:FontWeight.bold, color: Color(0xFF191645)
                      ),
                    ),

                    GestureDetector(
                      onTap: widget.showRegisterPage,
                      child: Text(
                        "  Create an account", 
                        style: GoogleFonts.poppins(fontSize: 14, fontWeight:FontWeight.bold, color: Color(0xFF43C6AC)
                        ),
                      ),
                    ),
                 ],
               ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}