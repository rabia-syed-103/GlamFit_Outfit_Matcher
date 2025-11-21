import 'package:flutter/material.dart';

void main() {
  runApp(const GlamFitApp());
}

class GlamFitApp extends StatelessWidget {
  const GlamFitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GlamFit Login',
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _remember = false;
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    final Color teal = const Color(0xFF1F6B63);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.9,
              child: Image.asset(
                'assets/image.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 10, left: 24),
              child: Text(
                'GlamFit',
                style: TextStyle(
                  color: Color(0xFF1F6B63),
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ),
          ),

          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Welcome Back!',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                          color: Color.fromARGB(255, 0, 0, 0)
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Please enter your detail',
                      style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold),
                    ),

                    const SizedBox(height: 40),

                    TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white, // ← MAKES TEXT BOX WHITE

                        hintText: 'Username, Email or Phone Number',
                        contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),

                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 2,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    TextField(
                      obscureText: _obscure,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white, // ← ALSO MAKE THIS WHITE

                        hintText: 'Password',
                        contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),

                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscure ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                            color: Colors.black,
                          ),
                          onPressed: () => setState(() => _obscure = !_obscure),
                        ),

                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 2,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => setState(() => _remember = !_remember),
                          child: Row(
                            children: [
                              Checkbox(
                                value: _remember,
                                onChanged: (v) => setState(() => _remember = v ?? false),
                                fillColor: MaterialStateProperty.all(Colors.black),
                                checkColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              const Text('Remember me',
                                  style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        child: const Text(
                          'Log In',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account? "),
                        GestureDetector(
                          onTap: () {},
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
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
        ],
      ),
    );
  }
}