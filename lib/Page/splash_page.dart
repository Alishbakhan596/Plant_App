import 'package:flutter/material.dart';
import 'package:practice/Page/home_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(height: 25),
            const Text(
              'Lets\'s plant wuth us',
              style: TextStyle(
                fontSize: 22,
                letterSpacing: 1.8,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              'Bring nature home',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 26,
                letterSpacing: 1.8,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 450,
              width: 450,
              child: Image.asset("assets/images/Asset1.png"),
            ),
            const SizedBox(height: 25),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (Builder) => const HomePage()));
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 80,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: const Text(
                  'Sign In',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Create an account',
                style: TextStyle(
                  color: Colors.black45,
                  fontSize: 16,
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Foregot Password',
                style: TextStyle(
                  color: Colors.black38,
                  fontSize: 14,
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
