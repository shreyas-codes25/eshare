import 'package:eshare/widgets/auth_btn.dart';
import 'package:eshare/auth/services/forwarding.dart';
import 'package:eshare/widgets/t_and_c.dart';
import 'package:eshare/widgets/textfield.dart';
import 'package:flutter/material.dart';

class Email extends StatefulWidget {
  const Email({super.key});

  @override
  State<Email> createState() => _EmailState();
}

class _EmailState extends State<Email> {
  final TextEditingController _userController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Email"),
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
              "assets/images/login.png",
              height: 300,
            )),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customText(title: "Sign in", size: 30),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Icon(Icons.alternate_email,
                          color: Theme.of(context).primaryColor,
                          size: 30), // Icon outside the TextField
                      SizedBox(
                          width: 10), // Space between the icon and TextField
                      Expanded(
                        child: TextField(
                          controller: _userController,
                          decoration: InputDecoration(
                            hintText: "Username",
                            labelText: "Username",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  TermsAndCondition(),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  authButton("Next", () {
                    forwarding(_userController.text, context);
                  }, context),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                      child: Text(
                    "Sign Up with Inviatation Code",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  )),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
