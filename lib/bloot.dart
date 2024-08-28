import 'package:flutter/material.dart';

class Bloot extends StatefulWidget {
  const Bloot(this.where, {super.key});

  final void Function(int f) where;

  @override
  State<Bloot> createState() {
    return _Bloot();
  }
}

class _Bloot extends State<Bloot> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final ScrollController _scrollController2 = ScrollController();
  bool canEdit = true;

  int x1 = 0;
  int x2 = 0;
  List<int> team1 = [];
  List<int> team2 = [];
  int? n1;
  int? n2;
  List<String> result = ["", ""];
  void score() {
    if (_controller1.text.isEmpty) _controller1.text = "0";
    if (_controller2.text.isEmpty) _controller2.text = "0";
    if (!canEdit) {
      _controller1.text = "";
      _controller2.text = "";
      return;
    }
    n1 = int.tryParse(_controller1.text);
    n2 = int.tryParse(_controller2.text);
    team1.add(n1!);
    team2.add(n2!);

    setState(() {
      x1 += n1!;
      x2 += n2!;
      _controller1.text = "";
      _controller2.text = "";

      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
        _scrollController2.jumpTo(_scrollController.position.maxScrollExtent);
      });
      if ((x1 >= 152 || x2 >= 152) && x1 != x2) {
        confirmationMessage("مبروووووك الفوز", "صكة جديدة؟", reset);
        canEdit = false;
      }
    });
  }

  void confirmationMessage(String title, String body, Function() todo) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(body),
        actions: [
          TextButton(
            onPressed: () {
              todo();
              Navigator.of(context).pop();
            },
            child: const Text("ايه"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("لا"),
          ),
        ],
      ),
    );
  }

  void reset() {
    setState(() {
      team1 = [];
      team2 = [];
      x1 = x2 = n1 = n2 = 0;
      result[0] = "";
      result[1] = "";
      canEdit = true;
    });
  }

  String printer(List<int> scores) {
    String result = "";
    for (int i = 0; i < scores.length; i++) {
      result += "${scores[i]}\n";
      if (i > 0) {
        int total = 0;
        for (int j = i; j >= 0; j--) {
          total += scores[j];
        }
        result += "---\n$total\n";
      }
    }
    return result;
  }

  void undo() {
    setState(() {
      if (team1.isNotEmpty) {
        if (x1 > 0) x1 -= team1.last;
        if (x2 > 0) x2 -= team2.last;
        team1.removeLast();
        team2.removeLast();
        canEdit = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          const BoxDecoration(color: Color.fromARGB(255, 229, 225, 225)),
      child: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          SizedBox(
            height: 250,
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
                        borderRadius: BorderRadius.all(Radius.circular(1000)),
                      ),
                      child: Center(
                        child: Text(
                          "$x1",
                          style: const TextStyle(
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      height: 40,
                      width: 80,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.lightBlue[50],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 1),
                        ),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                        ),
                        controller: _controller1,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 60),
                          child: Image.asset(
                            "assets/images/sbet.png",
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
                            onPressed: () {
                              _controller1.text = "26";
                              score();
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: const CircleBorder(),
                            ),
                            child: const Text(
                              //T1
                              "26",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            _controller2.text = "26";
                            score();
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: const CircleBorder(),
                          ),
                          child: const Text(
                            //T2
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
                            onPressed: () {
                              _controller1.text = "16";
                              score();
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: const CircleBorder(),
                            ),
                            child: const Text(
                              //T1
                              "16",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            _controller2.text = "16";
                            score();
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: const CircleBorder(),
                          ),
                          child: const Text(
                            //T2
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
                      onPressed: score,
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
                        borderRadius: BorderRadius.all(Radius.circular(1000)),
                      ),
                      child: Center(
                        child: Text(
                          "$x2",
                          style: const TextStyle(
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      height: 40,
                      width: 80,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.lightBlue[50],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 1),
                        ),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                        ),
                        controller: _controller2,
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
          SizedBox(
            height: 440,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 55,
                        child: Text(
                          //Team1
                          printer(team1),
                          style: const TextStyle(
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 60,
                        vertical: 30,
                      ),
                      width: 1,
                      height: 380,
                      color: Colors.black,
                    ),
                  ],
                ),
                SingleChildScrollView(
                  controller: _scrollController2,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 55,
                        child: Text(
                          //Team2
                          printer(team2),
                          style: const TextStyle(
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const Spacer(),
          //Break
          SizedBox(
            height: 72,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 72,
                  child: Row(
                    children: [
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {
                              widget.where(2);
                            },
                            icon: const Icon(Icons.settings),
                            color: Colors.black, // Icon color
                            iconSize: 40.0,
                            padding: const EdgeInsets.only(bottom: 0.0),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {
                              widget.where(1);
                            },
                            icon: const Icon(Icons.home),
                            color: Colors.black, // Icon color
                            iconSize: 40.0,
                            padding: const EdgeInsets.only(bottom: 0.0),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(
                                  255, 255, 114, 161), // Background color
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: IconButton(
                              onPressed: () {
                                // widget.where(0);
                                confirmationMessage("صكة جديدة؟", "", reset);
                              },
                              icon: const Icon(Icons.games_outlined),
                              color: Colors.black, // Icon color
                              iconSize: 40.0,
                              padding: const EdgeInsets.only(bottom: 0.0),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {
                              // widget.where(0);
                            },
                            icon: const Icon(Icons.history),
                            color: Colors.black, // Icon color
                            iconSize: 40.0,
                            padding: const EdgeInsets.only(bottom: 0.0),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


