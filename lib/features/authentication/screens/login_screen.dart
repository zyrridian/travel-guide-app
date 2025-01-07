import 'package:flutter/material.dart';
import 'package:travel_guide_app/features/authentication/screens/login_phone_screen.dart';
import 'package:travel_guide_app/main.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                            'Welcome, Explorer!',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.bold,
                              fontSize: 28.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            'Ready to discover your next adventure?',
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
                      'Welcome, Explorer!',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                      ),
                    ),
                    Text(
                      'Ready to discover your next adventure?',
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
            hintText: 'Enter your password',
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
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {},
            child: Text(
              'Forgot Password?',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return MainScreen();
            }));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orangeAccent,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            minimumSize: Size(double.infinity, 48),
          ),
          child: Text(
            'Login',
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(height: 24),
        Row(
          children: [
            Expanded(
              child: Divider(
                thickness: 1,
                color: Colors.grey,
                indent: 16,
                endIndent: 10,
              ),
            ),
            Text(
              'Or continue with',
              style: TextStyle(color: Colors.grey),
            ),
            Expanded(
              child: Divider(
                thickness: 1,
                color: Colors.grey,
                indent: 10,
                endIndent: 16,
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildIconButton(Icons.smartphone_outlined, onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return LoginPhoneScreen();
              }));
            }),
            SizedBox(width: 8),
            _buildImageButton('images/google.png'),
            SizedBox(width: 8),
            _buildImageButton('images/apple.png'),
          ],
        ),
        SizedBox(height: 80),
      ],
    );
  }

  Widget _buildIconButton(IconData icon, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.grey,
            width: 1,
          ),
        ),
        child: Center(
          child: Icon(icon, color: Colors.black),
        ),
      ),
    );
  }

  Widget _buildImageButton(String assetPath) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.grey,
            width: 1,
          ),
        ),
        child: Center(
          child: Image.asset(
            assetPath,
            width: 24,
            height: 24,
          ),
        ),
      ),
    );
  }
}
