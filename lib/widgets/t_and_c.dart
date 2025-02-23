import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TermsAndCondition extends StatelessWidget {
  const TermsAndCondition({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: 'By continuing you agree to ',
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 12,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
                height: 0.11,
                letterSpacing: 0.40,
              ),
            ),
            TextSpan(
                text: 'T&C’s',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 12,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  height: 0.11,
                  letterSpacing: 0.40,
                ),
                recognizer: TapGestureRecognizer()..onTap = () {}),
            TextSpan(
              text: ' and ',
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 12,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
                height: 0.11,
                letterSpacing: 0.40,
              ),
            ),
            TextSpan(
                text: 'Privacy Policy',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 12,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  height: 0.11,
                  letterSpacing: 0.40,
                ),
                recognizer: TapGestureRecognizer()..onTap = () {}),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
