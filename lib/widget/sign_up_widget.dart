import 'dart:ui';

import 'package:colloq032/provider/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class SignUpWidget extends StatelessWidget {
  const SignUpWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          const FlutterLogo(size: 120),
          const Spacer(),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '¡Hola!\nConéctate con tu cuenta',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                decoration: TextDecoration.none,
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Se necesita para guardar el progreso en la nube.',
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
                decoration: TextDecoration.none,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          const Spacer(),
          ElevatedButton.icon(
            label: const Text('Sign up with Google'),
            icon: const FaIcon(FontAwesomeIcons.google, color: Colors.blue),
            style: ElevatedButton.styleFrom(
              primary: Colors.grey,
              onPrimary: Colors.black,
              minimumSize: const Size(double.infinity, 50),
            ),
            onPressed: (){
              final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.googleLogin();
            },
          ),
          const SizedBox(height: 40),
          RichText(
            text: const TextSpan(
              text: '¿Desea continuar sin darse de alta? ',
              children: [
                TextSpan(
                  text: 'Continuar',
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ],
            ),
          ),
        ],
      )
    );
  }
}
