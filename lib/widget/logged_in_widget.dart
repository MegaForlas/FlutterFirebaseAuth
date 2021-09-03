import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:colloq032/provider/google_sign_in.dart';

class LoggedInWidget extends StatelessWidget {
  LoggedInWidget({Key? key}) : super(key: key);
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi perfil'),
        centerTitle: true,
        actions: [
          TextButton(
              child: const Text ('Desconectar'),
              onPressed: (){
                final provider =
                  Provider.of<GoogleSignInProvider>(context, listen:false);
                provider.logout();
              },
          )
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.blueGrey.shade900,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /*const Text(
              'Perfil',
              style: TextStyle(fontSize: 24),
            ),*/
            const SizedBox(height: 32),
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(user.photoURL!),
            ),
            const SizedBox(height: 8),
            Text(
              //'Nombre: '+
                  user.displayName!,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              //'Email: '+
              '( '+user.email!+' )',
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),

          ],
        ),
      ),
    );
  }
}
