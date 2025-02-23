import 'package:eshare/widgets/auth_btn.dart';
import 'package:eshare/auth/services/authenticate.dart';
import 'package:eshare/widgets/textfield.dart';
import 'package:flutter/material.dart';

class Password extends StatefulWidget {
  const Password({super.key, required this.username});

  final String username;

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  final TextEditingController _passController = TextEditingController();
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Password"),
      ),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                "assets/images/password.png",
                height: 300,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customText(title: "Password", size: 30),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Icon(Icons.password,
                          color: Theme.of(context).primaryColor,
                          size: 30), // Icon outside the TextField
                      SizedBox(
                          width: 10), // Space between the icon and TextField
                      Expanded(
                        child: TextField(
                          obscureText: _isObscure,
                          controller: _passController,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              },
                              icon: Icon(_isObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            ),
                            hintText: "Password",
                            labelText: "Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {}, child: Text("Forgot Password?"))),
                  SizedBox(
                    height: 20,
                  ),
                  authButton("Login", () async {
                    var response = await authenticate(
                      widget.username,
                      _passController.text,
                    );
                    // ignore: use_build_context_synchronously
                    authCheck(response, context);
                  }, context),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
