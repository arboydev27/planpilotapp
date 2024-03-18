// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {

  final VoidCallback showLoginPage;

  const RegisterPage({
    super.key,
    required this.showLoginPage
    });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  // Sign up method
  // Checks if passwordoConfirmed is true before creating a user
  Future signUp() async {
    if (passwordConfirmed()) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: _emailController.text.trim(), 
      password: _passwordController.text.trim()
      );  
    }
  }

// Checks in the Password == ConfrimPassword before creating a new User
  bool passwordConfirmed() {
    if (_passwordController.text.trim() == _confirmPasswordController.text.trim()) {
      return true;
    }
    else{
      return false;
    }
  }

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
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                // Image for the page
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    height: 300,
                    width: 300,
                    child: Image.asset("assets/images/Tasks complete.png" )
                  ),
                ),
            
                SizedBox(height: 10),
            
                // Create Account here
                Text(
                  "Create Account", 
                  style: GoogleFonts.poppins(fontSize: 42, fontWeight:FontWeight.bold),
                ),
            
                SizedBox(height: 10),
            
                // Nice login message
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Text(
                    "Welcome aboard! Let's get you started", 
                    style: GoogleFonts.poppins(fontSize: 20, fontWeight:FontWeight.w600),
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
            
                // Sign Up button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: GestureDetector(
                    onTap: signUp,  //Add onTap method
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
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
                      style: GoogleFonts.poppins(fontSize: 14, fontWeight:FontWeight.bold),
                    ),

                    GestureDetector(
                      onTap: widget.showLoginPage,
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