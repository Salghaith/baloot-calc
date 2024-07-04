import 'package:flutter/material.dart';

class Bloot extends StatefulWidget {
  const Bloot({super.key});

  @override
  State<Bloot> createState() {
    return _Bloot();
  }
}

class _Bloot extends State<Bloot> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  int x1 = 0;
  int x2 = 0;
  void score() {
    if (_controller1.text.isEmpty) _controller1.text = "0";
    if (_controller2.text.isEmpty) _controller2.text = "0";
    int? n1 = int.tryParse(_controller1.text);
    int? n2 = int.tryParse(_controller2.text);

    setState(() {
      x1 += n1!;
      x2 += n2!;
      _controller1.text = "";
      _controller2.text = "";
    });
  }

  void reset() {
    setState(() {
      x1 = x2 = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (x1 >= 152 || x2 >= 152) {
      return MaterialApp(
        home: Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [Colors.white, Colors.white]),
            ),
            child: const Center(
              child: Text(
                "Game over!",
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
            ),
          ),
        ),
      );
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Color.fromARGB(255, 8, 76, 155), Colors.white]),
          ),
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 70,
                ),
                const Text(
                  "حاسبة بلوت رخيصة",
                  style: TextStyle(color: Colors.black, fontSize: 40),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 30,
                    ),
                    SizedBox(
                      width: 150,
                      child: TextField(
                        controller: _controller1,
                        decoration: const InputDecoration(
                          labelText: "1st team score!",
                          labelStyle: TextStyle(
                              color: Color.fromARGB(90, 0, 0, 0), fontSize: 30),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 60,
                    ),
                    SizedBox(
                      width: 150,
                      child: TextField(
                        controller: _controller2,
                        decoration: const InputDecoration(
                          labelText: "2nd team score!",
                          labelStyle: TextStyle(
                              color: Color.fromARGB(90, 0, 0, 0), fontSize: 30),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 60,
                ),
                SizedBox(
                  height: 300,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 150,
                        // height: 300,

                        child: Text(
                          "50\n5\n5\n5\n5\n5\n5\n5\n5",
                          style: const TextStyle(
                              color: Colors.black, fontSize: 40),
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: TextButton(
                          onPressed: score,
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.grey,
                          ),
                          child: const Text(
                            "قيد",
                            style: TextStyle(fontSize: 40, color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  "1st:$x1 - 2nd:$x2",
                  style: const TextStyle(color: Colors.black, fontSize: 40),
                ),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: 100,
                  height: 100,
                  child: TextButton(
                    onPressed: reset,
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.grey,
                    ),
                    child: const Text(
                      "reset",
                      style: TextStyle(fontSize: 25, color: Colors.black),
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
