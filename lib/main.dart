import 'package:flutter/material.dart';
import 'package:flutta/sign_up.dart';
import 'package:flutta/home.dart';
import 'package:flutta/transaksi.dart';

void main() {
  runApp(MaterialApp(
    title: 'Tokoku',
    home: FirstRoute(),
    initialRoute: '/',
    routes: {
      '/home': (context) => home(),
      '/sign_up': (context) => sign_up(),
      '/transaksi': (context) => transaksi(),
    },
  ));
}

class FirstRoute extends StatelessWidget {
  const FirstRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Image.asset('assets/images/login.png'),
              height: 250,
              width: 250,
            ),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Tokoku Sign In',
                  style: TextStyle(
                      color: Colors.purple,
                      fontWeight: FontWeight.w500,
                      fontSize: 25),
                )),
            Container(
                alignment: Alignment.center,
                child: const Text(
                  'Silakan masuk terlebih dahulu',
                  style: TextStyle(fontSize: 15),
                )),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: TextField(
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            Container(
                height: 50,
                width: 400,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                child: ElevatedButton(
                  child: const Text('Login'),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/home');
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.purple),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                  ),
                )),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Belum punya akun?'),
                  TextButton(
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.purple,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/sign_up');
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
