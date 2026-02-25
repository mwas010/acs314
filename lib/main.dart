import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          centerTitle: true,
          title: Text(
            'Login Page',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        body: Column(
          // The children list must be INSIDE the Column's parentheses
          children: [
            Image.asset('assets/images/images.jpeg'), // Fixed extra ')' here
            Text('Login Page'),
            Text(
              'Enter your username',
              style: TextStyle(color: Colors.black, fontSize: 27),
            ),
            TextField(),
            SizedBox(height: 20),
            Text(
              'Enter your password',
              style: TextStyle(color: Colors.black, fontSize: 27),
            ),
            TextField(),
            SizedBox(height: 70),
            MaterialButton(
              onPressed: () {},
              child: Text('Login'),
              color: const Color.fromARGB(255, 77, 219, 16),
            ),
          ],
        ),
      ),
    ),
  );
}
