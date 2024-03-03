// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  // Method for Signing Up

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
            
                // Create Account here
                Text(
                  "Create Account", 
                  style: GoogleFonts.poppins(fontSize: 42, fontWeight:FontWeight.bold, color: Color(0xFF191645)
                  ),
                ),
            
                SizedBox(height: 10),
            
                // Nice login message
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Text(
                    "Welcome aboard! Let's get you started", 
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

                // Confirm Password textfield
                Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: TextField(
                        controller: _confirmPasswordController, //Add text editing controller
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
                          hintText: "Confirm Password", 
                          hintStyle: GoogleFonts.poppins(fontSize: 14, color: Colors.grey),
                          fillColor: Color(0xFFDFDFDF),
                          filled: true,
                        ),
                      ),
                    ),
                
                SizedBox(height: 10),
            
                // Sign in button
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
                        child: Text("Sign Up",
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
                      "Already a member?", 
                      style: GoogleFonts.poppins(fontSize: 14, fontWeight:FontWeight.bold, color: Color(0xFF191645)
                      ),
                    ),

                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "  Login here", 
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