import 'package:flutter/material.dart';

class transaksi extends StatelessWidget {
  const transaksi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tokoku'),
        backgroundColor: Colors.purple,
      ),
      body: Container(
        child: ListView(
          children: [
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Tokoku Transaksi',
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
