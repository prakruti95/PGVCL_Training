import 'package:flutter/material.dart';
import 'theme.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body:SingleChildScrollView(
      child:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Welcome text
            Text(
              'Welcome Back!',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 30.0),

            // Email text field
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Enter your email',
                prefixIcon: Icon(Icons.email),
              ),
            ),
            SizedBox(height: 20.0),

            // Password text field
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your password',
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            SizedBox(height: 30.0),

            // Login button
            ElevatedButton(
              onPressed: () {
                // Handle login logic
              },
              child: Text('Login'),
            ),
            SizedBox(height: 20.0),

            // Forgot password link
            TextButton(
              onPressed: () {
                // Handle forgot password logic
              },
              child: Text('Forgot Password?'),
            ),
          ],
        ),
      )
      ),
    );
  }
}