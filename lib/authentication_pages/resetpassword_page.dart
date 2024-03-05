// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:planpilot/authentication_pages/register_page.dart';

class ResetPasswordPage extends StatefulWidget {

  final VoidCallback showRegisterPage;
  final VoidCallback showLoginPage;

  const ResetPasswordPage({
    super.key,
    required this.showRegisterPage,
    required this.showLoginPage
    });

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {

  final _emailController = TextEditingController();

  // Method for Sending Reset Password Link

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
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
            
                // Reset Password
                Text(
                  "Reset Password", 
                  style: GoogleFonts.poppins(fontSize: 42, fontWeight:FontWeight.bold, color: Color(0xFF191645)
                  ),
                ),
            
                SizedBox(height: 10),
            
                // Nice login message
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Text(
                    "Oops! Looks like you need to reset your password", 
                    style: GoogleFonts.poppins(fontSize: 20, fontWeight:FontWeight.w600, color: Color(0xFF191645)
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
            
                SizedBox(height: 32),

                // Message for user to enter their email
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Please enter your registered email so that we can send you a password reset link", 
                    style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                SizedBox(height: 10),
            
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
            
                // Send link button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: GestureDetector(
                    onTap: (){},  //Add onTap method
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Color(0xFF191645),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text("Send Link",
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