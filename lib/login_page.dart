import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final String? email;
  final String? password;

  const LoginPage({super.key, this.email, this.password});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordCtroller = TextEditingController();
  bool _obscurePassword = true;

  @override
  void initState() { // Added initState to handle received email and password
    super.initState();
    if (widget.email != null && widget.password != null) {
      _emailController.text = widget.email!;
      _passwordCtroller.text = widget.password!;
    }

    print("Email diterima: ${widget.email}");
    print("Password diterima: ${widget.password}");
  }


  void _login(){
    if (_formKey.currentState!.validate()) {
      // Process data.
      print('Email: ${_emailController.text}');
      print('Password: ${_passwordCtroller.text}');

      Navigator.pushReplacementNamed(context, '/home');  // Navigate to Home Page
    }
  }
  
  // Navigate to Registration Page
  void _navigateToRegister(){
    Navigator.pushReplacementNamed(context, '/register');
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordCtroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Logo
              Image(image: AssetImage('asset/images/arsenal.png'), 
              height: 120,
              fit: BoxFit.contain,
              ),
              const SizedBox(height: 16),
              Text(
                "Welcome Back, Arsenal Fan!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              const SizedBox(height: 8),
              Text( 
                "Login to continue to the Arsenal FC App",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: const Color.fromARGB(255, 0, 0, 0), //untuk bagian subjudul
                ),
              ),
              const SizedBox(
                height: 40),

                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          hintText: 'Enter your email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email cannot be empty';
                          }
                          if (!value.contains('@') || !value.contains('.')) {
                            return 'Format email is invalid';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _passwordCtroller,
                        obscureText: _obscurePassword,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'Enter your password',
                          border: const OutlineInputBorder(), // untuk border kotak
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword ? Icons.visibility : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters long';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 30),

                      ElevatedButton(
                        onPressed: _login,
                        child: const Text('Login'),
                      ),
                      TextButton(
                        onPressed: _navigateToRegister,
                        child: const Text('Don\'t have an account? Register'),
                      ),
                    ],
                  ),
                )
            ]
          ),

        ),
      ),
    );
  }
}
