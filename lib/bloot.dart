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
          child: Container(
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 198, 194, 194)),
            child: Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                Container(
                  height: 250,
                  decoration: const BoxDecoration(
                      // color: Colors.brown,
                      ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "لنا",
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 80,
                            width: 80,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(1000)),
                            ),
                            child: const Center(
                              child: Text(
                                "11",
                                style: TextStyle(
                                  fontSize: 30,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Container(
                            height: 40,
                            width: 80,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                            ),
                            child: const Center(
                              child: Text(
                                "122",
                                style: TextStyle(
                                  fontSize: 30,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 60),
                                child: Image.asset(
                                  "assets/images/sa.png",
                                  width: 60,
                                  height: 60,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 50),
                                child: TextButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    shape: const CircleBorder(),
                                  ),
                                  child: const Text(
                                    "26",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: const CircleBorder(),
                                ),
                                child: const Text(
                                  "26",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 50),
                                child: TextButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    shape: const CircleBorder(),
                                  ),
                                  child: const Text(
                                    "16",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: const CircleBorder(),
                                ),
                                child: const Text(
                                  "16",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 19,
                          ),
                          OutlinedButton.icon(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.add,
                              color: Colors.black,
                              size: 50,
                            ),
                            label: const Text(
                              "قيد",
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "لهم",
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 80,
                            width: 80,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(1000)),
                            ),
                            child: const Center(
                              child: Text(
                                "112",
                                style: TextStyle(
                                  fontSize: 30,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Container(
                            height: 40,
                            width: 80,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                            ),
                            child: const Center(
                              child: Text(
                                "122",
                                style: TextStyle(
                                  fontSize: 30,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                //Break
                Container(
                  height: 440,
                  decoration: const BoxDecoration(
                      // color: Colors.green,
                      ),
                  child: SingleChildScrollView(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "70\n30\n70\n30\n70\n30\n70\n30\n70\n30",
                              style: TextStyle(
                                fontSize: 30,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 60, vertical: 30),
                              width: 1,
                              height: 380,
                              color: Colors.black,
                            ),
                          ],
                        ),
                        const Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "70\n30\n70\n30\n70\n30\n70\n30\n70\n30",
                              style: TextStyle(
                                fontSize: 30,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                //Break
                Container(
                  height: 72,
                  decoration: const BoxDecoration(
                      // color: Colors.brown,
                      ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.white,
                              minimumSize: const Size(120, 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            child: const Text(
                              "تراجع",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 40),
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/images/sa.png",
                              width: 60,
                              height: 60,
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.white,
                              minimumSize: const Size(120, 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            child: const Text(
                              "صكة جديدة",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
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
