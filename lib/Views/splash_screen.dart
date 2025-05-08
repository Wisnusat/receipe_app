import 'package:flutter/material.dart';
import 'package:flutter_complete_app/Views/app_main_screen.dart';
import 'package:flutter_complete_app/Views/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_complete_app/Utils/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isLoading = false;

  Future<void> _checkLoginStatus() async {
    if (!mounted) return;

    setState(() {
      _isLoading = true;
    });

    try {
      // Check for active session in Firestore
      final sessionQuery = await FirebaseFirestore.instance
          .collection('sessions')
          .where('isActive', isEqualTo: true)
          .limit(1)
          .get();

      if (sessionQuery.docs.isNotEmpty) {
        final sessionData = sessionQuery.docs.first.data();
        final userEmail = sessionData['email'] as String;

        // Verify user still exists
        final userQuery = await FirebaseFirestore.instance
            .collection('users')
            .where('email', isEqualTo: userEmail)
            .limit(1)
            .get();

        if (userQuery.docs.isNotEmpty) {
          // User is logged in and exists
          if (mounted) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const AppMainScreen()),
            );
          }
          return;
        } else {
          // User no longer exists, clear the session
          await sessionQuery.docs.first.reference.delete();
        }
      }

      // No active session or user doesn't exist
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      }
    } catch (e) {
      // If there's any error, navigate to login screen
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // App logo
            Image.network(
              'https://ytsotxeekfpfibulsxnd.supabase.co/storage/v1/object/public/server/public/book%201.png',
              width: 200,
              height: 200,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 20),
            // App name
            const Text(
              'CookEase',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: kprimaryColor,
              ),
            ),
            const SizedBox(height: 50),
            // Let's Start button
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: _isLoading ? null : _checkLoginStatus,
                style: ElevatedButton.styleFrom(
                  backgroundColor: kprimaryColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: _isLoading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      )
                    : const Text(
                        "Let's Start",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
} 