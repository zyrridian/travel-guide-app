import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_guide_app/features/authentication/screens/login_screen.dart';
import 'package:travel_guide_app/features/authentication/screens/register_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= 600) {
            return WelcomeScreenMobile();
          } else if (constraints.maxWidth <= 1024) {
            return WelcomeScreenTablet();
          } else {
            return WelcomeScreenDesktop();
          }
        },
      ),
    );
  }
}

class WelcomeScreenMobile extends StatelessWidget {
  const WelcomeScreenMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 32.0),
              Text(
                'Travel Guide',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28.0,
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 16.0),
              Image.asset(
                'images/trip.png',
                width: double.infinity,
              ),
              SizedBox(height: 16.0),
              _buildAuthButtons(context),
            ],
          ),
        ),
      ),
    );
  }
}

class WelcomeScreenTablet extends StatelessWidget {
  const WelcomeScreenTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
          child: Column(
            children: [
              SizedBox(height: 32.0),
              Text(
                'Travel Guide',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 32.0,
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 16.0),
              Image.asset(
                'images/trip.png',
                height: 500,
              ),
              SizedBox(height: 16.0),
              _buildAuthButtons(context),
            ],
          ),
        ),
      ),
    );
  }
}

class WelcomeScreenDesktop extends StatelessWidget {
  const WelcomeScreenDesktop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Travel Guide',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 36.0,
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      'Plan your adventures with ease!',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 24.0),
                    _buildAuthButtons(context),
                  ],
                ),
              ),
              Expanded(
                child: Image.asset('images/trip.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildAuthButtons(BuildContext context) {
  return Column(
    children: [
      ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ),
          );
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
      SizedBox(height: 16.0),
      OutlinedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return RegisterScreen();
            },
          ));
        },
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            color: Colors.orangeAccent,
            width: 1,
          ),
          foregroundColor: Colors.orangeAccent,
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
      SizedBox(height: 80.0),
    ],
  );
}
