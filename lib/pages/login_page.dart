import 'package:flutter/material.dart';
import 'package:flutter_touchscreen/models/user.dart';
import 'package:flutter_touchscreen/pages/page_wrapper.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void _authorizeUser() {
    // TODO: IMPLEMENT DATABASE CALL

    User.loginUser(User(1, "monitorRaspPi", "123", "R"));

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PageWrapper()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Image.asset(
            "assets/images/banner.png",
            fit: BoxFit.cover,
          ),
        ),
        Center(
          child: GlassContainer(
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Anmelden",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 26,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                      child: Divider(),
                    ),
                    TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text(
                          "Benutzername",
                        ),
                      ),
                      controller: _usernameController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text(
                          "Passwort",
                        ),
                      ),
                      controller: _passwordController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey[800],
                        foregroundColor: Colors.white,
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "Anmelden",
                            style: TextStyle(
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ),
                      onPressed: () => _authorizeUser(),
                    ),
                    TextButton(
                      child: Text(
                        "Passwort vergessen?",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
