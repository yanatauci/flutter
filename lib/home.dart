import 'package:flutter/material.dart';
import 'package:flutta/main.dart';

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tokoku'),
        backgroundColor: Colors.purple,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.purple),
                accountName: Text("Fikri Ahdiar"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/fikri.jpg"),
                ),
                accountEmail: Text("email.fkrid@gmail.com")),
            ListTile(
              title: const Text('Transaksi'),
              onTap: () {
                Navigator.pushNamed(context, '/transaksi');
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      body: Container(
        child: ListView(
          children: [
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Tokoku Homepage',
                  style: TextStyle(
                      color: Colors.purple,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
          ],
        ),
      ),
    );
  }
}
