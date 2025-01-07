import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:travel_guide_app/features/home/screens/home_screen.dart';
import 'package:travel_guide_app/main.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isCheckboxChecked = false; // Checkbox state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.orangeAccent,
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= 800) {
            // Desktop Layout
            return SingleChildScrollView(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Image.asset(
                      'images/trip.png',
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 16),
                          Text(
                            'Join Us!',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.bold,
                              fontSize: 28.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            'Start exploring the world your way',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Nunito',
                              fontSize: 18.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 48),
                          _buildInputFields(context),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            // Mobile Layout
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset('images/trip.png', width: 200, height: 200),
                    SizedBox(height: 16),
                    Text(
                      'Join Us!',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                      ),
                    ),
                    Text(
                      'Start exploring the world your way',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Nunito',
                        fontSize: 18.0,
                      ),
                    ),
                    SizedBox(height: 32.0),
                    _buildInputFields(context),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildInputFields(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.person_outline,
              color: Colors.orangeAccent,
            ),
            hintText: 'Enter your full name',
            hintStyle: TextStyle(color: Colors.grey),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.orangeAccent,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.email_outlined,
              color: Colors.orangeAccent,
            ),
            hintText: 'Enter your email address',
            hintStyle: TextStyle(color: Colors.grey),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.orangeAccent,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.lock_outline,
              color: Colors.orangeAccent,
            ),
            hintText: 'Create a password',
            hintStyle: TextStyle(color: Colors.grey),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.orangeAccent,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.lock_outline,
              color: Colors.orangeAccent,
            ),
            hintText: 'Confirm your password',
            hintStyle: TextStyle(color: Colors.grey),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.orangeAccent,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        Row(
          children: [
            Checkbox(
              checkColor: Colors.white,
              activeColor: Colors.orangeAccent,
              value: _isCheckboxChecked,
              onChanged: (bool? value) {
                setState(() {
                  _isCheckboxChecked = value!;
                });
              },
            ),
            Expanded(
              child: RichText(
                text: TextSpan(
                  text: 'I agree to the ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                  children: [
                    TextSpan(
                      text: 'Terms of Service',
                      style: TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          log('Terms of Service clicked');
                        },
                    ),
                    TextSpan(
                      text: ' and ',
                    ),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          log('Privacy Policy clicked');
                        },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        ElevatedButton(
          onPressed: _isCheckboxChecked
              ? () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return MainScreen();
                  }));
                }
              : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orangeAccent,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            minimumSize: Size(double.infinity, 48),
          ),
          child: Text(
            'Register',
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(height: 80),
      ],
    );
  }
}
