import 'package:flutter/material.dart';

class form extends StatefulWidget {
  const form({super.key});

  @override
  State<form> createState() => _formState();
}

class _formState extends State<form> {
  final _formkey = GlobalKey<FormState>();
  bool nilaichekbox = false;
  //list string agama
  List<String> agama = ['Islam', 'Kristen', 'Hindu', 'Budha', 'Konghucu'];
  //inisialisasi variabel agama
  String? _agama;
  //String jenis kelamin
  String jk = "";
  //controller
  TextEditingController nama = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController nohp = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tokoku'),
        backgroundColor: Colors.purple,
      ),
      body: Form(
        key: _formkey,
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            //padding
            children: [
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Tokoku Form',
                    style: TextStyle(
                        color: Colors.purple,
                        fontWeight: FontWeight.w500,
                        fontSize: 30),
                  )),
              Container(
                padding: const EdgeInsets.all(10),
              ),
              TextFormField(
                controller: nama,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  labelText: 'Nama',
                  hintText: 'Masukkan Nama',
                  icon: Icon(Icons.person),
                ),
                //validator
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Nama tidak boleh kosong';
                  }
                  return null;
                },
              ),
              Container(
                padding: const EdgeInsets.all(10),
              ),
              TextFormField(
                obscureText: true,
                controller: password,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  labelText: 'Password',
                  hintText: 'Masukkan Password',
                  //icon
                  icon: Icon(Icons.lock),
                ),
                //validator
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Password tidak boleh kosong';
                  }
                  return null;
                },
              ),
              Container(
                padding: const EdgeInsets.all(10),
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: email,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  labelText: 'Email',
                  hintText: 'Masukkan Email',
                  //icon
                  icon: Icon(Icons.email),
                ),
                //validator
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Email tidak boleh kosong';
                  }
                  return null;
                },
              ),
              Container(
                padding: const EdgeInsets.all(10),
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: nohp,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  labelText: 'Phone',
                  hintText: 'Masukkan Phone',
                  //icon
                  icon: Icon(Icons.phone),
                ),
                //validator
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Phone tidak boleh kosong';
                  }
                  return null;
                },
              ),
              Container(
                padding: const EdgeInsets.all(1),
              ),
              //radiolisttile
              RadioListTile(
                title: const Text('Laki-laki'),
                value: 'Laki-laki',
                groupValue: jk,
                onChanged: (value) {
                  setState(() {
                    jk = value.toString();
                  });
                },
                activeColor: Colors.purple,
              ),
              //radio list tile
              RadioListTile(
                title: const Text('Perempuan'),
                value: 'Perempuan',
                groupValue: jk,
                onChanged: (value) {
                  setState(() {
                    jk = value.toString();
                  });
                },
                activeColor: Colors.purple,
              ),
              Container(
                padding: const EdgeInsets.all(1),
              ),
              //new row agama
              Row(
                children: [
                  //padding
                  const Padding(padding: EdgeInsets.all(15)),
                  const Text('Agama'),
                  const SizedBox(
                    width: 20,
                  ),
                  //dropdownbutton
                  DropdownButton(
                    hint: const Text('Pilih Agama'),
                    value: _agama,
                    onChanged: (value) {
                      setState(() {
                        _agama = value.toString();
                      });
                    },
                    items: agama.map((valueItem) {
                      return DropdownMenuItem(
                        value: valueItem,
                        child: Text(valueItem),
                      );
                    }).toList(),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(1),
              ),
              //checkbox
              CheckboxListTile(
                title: Text('Setuju dengan syarat dan ketentuan'),
                value: nilaichekbox,
                activeColor: Colors.deepPurpleAccent,
                onChanged: ((value) {
                  setState(() {
                    nilaichekbox = value!;
                  });
                }),
                controlAffinity: ListTileControlAffinity.leading,
                secondary: nilaichekbox
                    ? null
                    : const Icon(
                        Icons.error,
                        color: Colors.red,
                      ),
              ),
              Container(
                height: 40,
                width: 200,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple,
                    //font size
                    textStyle: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  child: const Text('Submit'),
                  onPressed: () {
                    //validasi form
                    kirimdata();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //void pilih jk
  void pilihjk(String value) {
    setState(() {
      jk = value;
    });
  }

  //void pilih agama
  void pilihagama(String? value) {
    setState(() {
      _agama = value;
    });
  }

  //void kirim data
  void kirimdata() {
    //alert dialog
    AlertDialog alertDialog = AlertDialog(
      content: Container(
        height: 200,
        child: Column(
          children: [
            Text("Nama : ${nama.text}"),
            Text("Email : ${email.text}"),
            Text("Password : ${password.text}"),
            Text("Phone : ${nohp.text}"),
            Text("Jenis Kelamin : $jk"),
            Text("Agama : $_agama"),
            //padding
            const Padding(padding: EdgeInsets.all(10)),
            //button
            ElevatedButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.pop(context);
                Color:
                Colors.purple;
              },
            )
          ],
        ),
      ),
    );
    //show dialog
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }
}
