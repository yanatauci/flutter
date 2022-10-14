import 'package:flutter/material.dart';

class transaksi extends StatefulWidget {
  @override
  State<transaksi> createState() => _transaksiState();
}

class _transaksiState extends State<transaksi> {
  //list string
  final List<String> gambar = ["people_1.jpg", "people_2.jpg", "people_3.jpg"];

  //map colors
  static const Map<String, Color> colors = {
    'people_1.jpg': Color.fromARGB(255, 0, 255, 64),
    'people_2.jpg': Color.fromARGB(255, 255, 0, 0),
    'people_3.jpg': Color.fromARGB(255, 238, 255, 0),
  };

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          centerTitle: true,
          title: new Text("People"),
          backgroundColor: Colors.black),
      body: new Container(
        decoration: new BoxDecoration(
            gradient: new LinearGradient(
                begin: FractionalOffset.topLeft,
                end: FractionalOffset.bottomRight,
                colors: [
              Colors.black,
              Color.fromARGB(255, 62, 39, 102),
              Colors.white,
            ])),
        child: new PageView.builder(
          controller: new PageController(viewportFraction: 0.8),
          itemCount: gambar.length,
          itemBuilder: (BuildContext contex, int i) {
            return new Padding(
              padding:
                  new EdgeInsets.symmetric(horizontal: 8.0, vertical: 60.0),
              child: new Material(
                borderRadius: new BorderRadius.circular(20.0),
                elevation: 8.0,
                child: new Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    new Hero(
                        tag: gambar[i],
                        child: new Material(
                          child: new InkWell(
                            onTap: () =>
                                Navigator.of(contex).push(new MaterialPageRoute(
                              builder: (BuildContext context) => new Halamandua(
                                gambar: gambar[i],
                                colors: colors.values.elementAt(i),
                              ),
                            )),
                            child: new Image.asset(
                              "assets/images/${gambar[i]}",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ))
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class Halamandua extends StatefulWidget {
  Halamandua({required this.gambar, required this.colors});

  final String gambar;
  final Color colors;

  @override
  HalamanduaState createState() {
    return new HalamanduaState();
  }
}

class HalamanduaState extends State<Halamandua> {
  Color warna = Colors.white;

  void _pilihannya(Pilihan pilihan) {
    setState(() {
      warna = pilihan.warna;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("People"),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: <Widget>[
          new PopupMenuButton<Pilihan>(
            onSelected: _pilihannya,
            itemBuilder: (BuildContext context) {
              return listPilihan.map((Pilihan x) {
                return new PopupMenuItem<Pilihan>(
                  child: new Text(x.teks),
                  value: x,
                );
              }).toList();
            },
          )
        ],
      ),
      body: new Stack(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
                gradient: new RadialGradient(center: Alignment.center, colors: [
              Colors.white,
              warna,
              Colors.black,
            ])),
          ),
          new Center(
            child: new Hero(
              tag: widget.gambar,
              child: new ClipOval(
                child: new SizedBox(
                  width: 200.0,
                  height: 200.0,
                  child: new Material(
                    child: new InkWell(
                      onTap: () => Navigator.of(context).pop(),
                      child: new Image.asset(
                        "assets/images/${widget.gambar}",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Pilihan {
  const Pilihan({required this.teks, required this.warna});
  final String teks;
  final Color warna;
}

List<Pilihan> listPilihan = const <Pilihan>[
  const Pilihan(teks: "Blue", warna: Color.fromARGB(255, 13, 68, 114)),
  const Pilihan(teks: "Purple", warna: Color.fromARGB(255, 56, 11, 65)),
  const Pilihan(teks: "Orange", warna: Color.fromARGB(255, 139, 71, 12)),
  const Pilihan(teks: "Green", warna: Color.fromARGB(255, 14, 114, 114))
];
