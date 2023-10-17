import 'package:flutter/material.dart';
import 'package:modul_1/profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Narnia Best Movie'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool suppriseGift = false;

  void suppriseTrue() {
    setState(() {
      suppriseGift = true;
    });
    print(suppriseGift);
  }

  void suppriseFalse() {
    setState(() {
      suppriseGift = false;
    });
    print(suppriseGift);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Row(
          children: [
            const Icon(Icons.movie),
            const SizedBox(
              width: 20,
            ),
            Text(widget.title),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              suppriseGift ? "Supprise" : 'TEKAN ICON PART KAMU DAPAT HADIAH',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            suppriseGift
                ? Image.asset(
                    "assets/potoiqbal.jpeg",
                    height: 250,
                    width: 250,
                  )
                : const Text(" "),
            const SizedBox(
              height: 20,
            ),
            Text(
              suppriseGift ? "CEBElAPA IMUT CI ACU" : " ",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            suppriseGift
                ? Container()
                : SizedBox(
                    height: 50,
                    width: 200,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (BuildContext context) {
                            return MyProfile();
                          }));
                        },
                        child: const Text("TEKAN LAGI")))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: suppriseGift ? suppriseFalse : suppriseTrue,
        tooltip: 'Increment',
        child: const Icon(Icons.celebration),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
