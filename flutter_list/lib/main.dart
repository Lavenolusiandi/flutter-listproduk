import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String nama = "";
  String password = "";
  String nama_true = "venn123";
  String password_true = "venn511";

  Future LogIn() async {
    showDialog(
      context: context,
      builder: (context) {
        return Center(child: CircularProgressIndicator());
      },
    );
    await Future.delayed(Duration(seconds: 3));
    Navigator.of(context).pop();
    await Future.delayed(Duration(milliseconds: 250));
    if (nama == nama_true && password == password_true) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ListPage()),
      );
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                title: Text('Flutter App'),
                content: Text('Log In process failed'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('OK'),
                  ),
                ],
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 221, 221, 221),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 70,
                ),
                SizedBox(
                  height: 60,
                ),
                Text(
                  "Welcome back to Flutter App!",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 40,
                ),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      nama = value;
                    });
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    hintText: 'Nama',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  obscureText: true,
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    hintText: 'Password',
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Forgot Password?"),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                GestureDetector(
                  onTap: () {
                    LogIn();
                  },
                  child: Container(
                    width: 1000,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(
                      child: Text(
                        "Log In",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 1000,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  child: Center(
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class StokBelanja {
  String produk;
  double harga;

  StokBelanja({required this.produk, required this.harga});
}

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List stockslist = [
    StokBelanja(produk: 'Minyak Bimoli ', harga: 29000),
    StokBelanja(produk: 'Kecap Bango', harga: 21000),
    StokBelanja(produk: 'Beras Sedap Wangi', harga: 97000),
    StokBelanja(produk: 'Susu Kaleng Frisian Flag', harga: 16000),
    StokBelanja(produk: 'Bon Cabe lv 10', harga: 7000),
    StokBelanja(produk: 'Tepung Terigu Serbaguna', harga: 15000),
    StokBelanja(produk: 'Rokok Saemporna', harga: 23000),
    StokBelanja(produk: 'Mie Sedap', harga: 3000),
    StokBelanja(produk: 'Telur Ayam Kampung', harga: 35000),
    StokBelanja(produk: 'Refina Refined Salt', harga: 6000),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'List Page',
        ),
        backgroundColor: Colors.grey,
      ),
      backgroundColor: Color.fromARGB(255, 221, 221, 221),
      body: SafeArea(
        child: ListView.builder(
            itemCount: stockslist.length,
            itemBuilder: (context, index) {
              int index1 = index + 1;
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Text(
                      '$index1',
                      style: TextStyle(fontSize: 14),
                    ),
                    title: Text(
                      stockslist[index].produk,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text("Rp ${stockslist[index].harga}"),
                    trailing: GestureDetector(
                      onTap: () {
                        stockslist.removeWhere((element) {
                          return element.produk == stockslist[index].produk;
                        });
                        setState(() {});
                      },
                      child: Icon(
                        Icons.delete,
                        color: Colors.purple,
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
