import 'package:bloot_calc/result.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class Calc extends StatefulWidget {
  const Calc(this.where, {super.key});

  final void Function(int f) where;

  @override
  State<Calc> createState() {
    return _Calc();
  }
}

class _Calc extends State<Calc> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  // final ScrollController _scrollController2 = ScrollController();
  bool canEdit = true;

  int x1 = 0;
  int x2 = 0;
  List<int> team1 = [];
  List<int> team2 = [];
  int? n1;
  int? n2;
  List<String> result = ["", ""];
  void score() {
    if (_controller1.text.isEmpty) {
      if (_controller2.text.isEmpty) return;
      _controller1.text = "0";
    }
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
        // _scrollController2.jumpTo(_scrollController.position.maxScrollExtent);
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

  String formatToArabic(int number) {
    final formatter = NumberFormat('0', 'ar');
    return formatter.format(number);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 1),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 40,
                  width: 97,
                  margin: const EdgeInsets.only(
                    top: 70,
                    left: 15,
                  ),
                  child: TextButton(
                    onPressed: undo,
                    child: Row(
                      children: [
                        Transform.flip(
                          flipX: true,
                          child: Container(
                            margin: const EdgeInsets.only(
                              left: 5,
                            ),
                            child: const Icon(
                              Icons.refresh,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 44,
                          height: 19.6,
                          child: Text(
                            "تراجع",
                            style: GoogleFonts.tajawal(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: const Color.fromRGBO(0, 0, 0, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 40,
                    left: 66,
                  ),
                  child: SvgPicture.asset(
                    "assets/images/tour_icon.svg",
                    width: 83.33,
                    height: 29.1,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 70,
                    left: 36.3,
                  ),
                  child: TextButton(
                    onPressed: reset,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                            top: 3,
                          ),
                          child: Text(
                            "صكة جديدة",
                            style: GoogleFonts.tajawal(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: const Color.fromRGBO(0, 0, 0, 1),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                          margin: const EdgeInsets.only(left: 4),
                          child: const Icon(
                            Icons.add,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: 400,
              height: 264,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(242, 247, 247, 1),
                borderRadius: BorderRadius.circular(14),
              ),
              margin: const EdgeInsets.only(
                top: 32,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 56,
                        height: 55,
                        padding: const EdgeInsets.only(
                          top: 15,
                          right: 9,
                          bottom: 15,
                          left: 9,
                        ),
                        margin: const EdgeInsets.only(
                          top: 8,
                          left: 8,
                        ),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(255, 255, 255, 1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            "لــــــــنا",
                            style: GoogleFonts.tajawal(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: const Color.fromRGBO(0, 0, 0, 1),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 56,
                        height: 55,
                        padding: const EdgeInsets.only(
                          top: 15,
                          right: 9,
                          bottom: 15,
                          left: 9,
                        ),
                        margin: const EdgeInsets.only(
                          top: 8,
                          left: 8,
                        ),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(255, 255, 255, 1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            "$x1",
                            style: GoogleFonts.tajawal(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: const Color.fromRGBO(0, 0, 0, 1),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 56,
                        height: 55,
                        padding: const EdgeInsets.only(
                          top: 15,
                          right: 9,
                          bottom: 15,
                          left: 9,
                        ),
                        margin: const EdgeInsets.only(
                          top: 8,
                          left: 140,
                        ),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(255, 255, 255, 1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            "$x2",
                            style: GoogleFonts.tajawal(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: const Color.fromRGBO(0, 0, 0, 1),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 56,
                        height: 55,
                        padding: const EdgeInsets.only(
                          top: 15,
                          right: 9,
                          bottom: 15,
                          left: 9,
                        ),
                        margin: const EdgeInsets.only(
                          top: 8,
                          left: 10,
                        ),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(255, 255, 255, 1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            "لـهـــم",
                            style: GoogleFonts.tajawal(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: const Color.fromRGBO(0, 0, 0, 1),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  //
                  Row(
                    children: [
                      Container(
                        width: 88,
                        height: 41,
                        margin: const EdgeInsets.only(
                          top: 24,
                          left: 8,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color.fromRGBO(74, 146, 146, 1),
                        ),
                        child: TextButton(
                          onPressed: () {
                            _controller1.text = "16";
                            score();
                          },
                          child: Center(
                            child: Text(
                              "+١٦",
                              style: GoogleFonts.tajawal(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: const Color.fromRGBO(255, 255, 255, 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 88,
                        height: 41,
                        margin: const EdgeInsets.only(
                          top: 24,
                          left: 208,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color.fromRGBO(74, 146, 146, 1),
                        ),
                        child: TextButton(
                          onPressed: () {
                            _controller2.text = "16";
                            score();
                          },
                          child: Center(
                            child: Text(
                              "+١٦",
                              style: GoogleFonts.tajawal(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: const Color.fromRGBO(255, 255, 255, 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 88,
                        height: 41,
                        margin: const EdgeInsets.only(
                          top: 8,
                          left: 8,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color.fromRGBO(74, 146, 146, 1),
                        ),
                        child: TextButton(
                          onPressed: () {
                            _controller1.text = "26";
                            score();
                          },
                          child: Center(
                            child: Text(
                              "+٢٦",
                              style: GoogleFonts.tajawal(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: const Color.fromRGBO(255, 255, 255, 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 88,
                        height: 41,
                        margin: const EdgeInsets.only(
                          top: 8,
                          left: 208,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color.fromRGBO(74, 146, 146, 1),
                        ),
                        child: TextButton(
                          onPressed: () {
                            _controller2.text = "26";
                            score();
                          },
                          child: Center(
                            child: Text(
                              "+٢٦",
                              style: GoogleFonts.tajawal(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: const Color.fromRGBO(255, 255, 255, 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 129,
                        height: 56,
                        margin: const EdgeInsets.only(left: 8, top: 23),
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                            bottomLeft: Radius.circular(8),
                            bottomRight: Radius.circular(16),
                          ),
                        ),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                          controller: _controller1,
                        ),
                      ),
                      Container(
                        width: 129,
                        height: 56,
                        margin: const EdgeInsets.only(left: 124, top: 23),
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                            bottomLeft: Radius.circular(8),
                            bottomRight: Radius.circular(16),
                          ),
                        ),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                          controller: _controller2,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 19,
                left: 63,
                right: 63,
              ),
              child: Center(
                child: TextButton(
                  onPressed: score,
                  style: TextButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(74, 146, 146, 1),
                    minimumSize: const Size(304, 41),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    "قـيـــد",
                    style: GoogleFonts.tajawal(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: const Color.fromRGBO(255, 255, 255, 1),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: 400,
              height: 253,
              margin: const EdgeInsets.only(
                top: 19,
              ),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(247, 247, 247, 1),
                borderRadius: BorderRadius.circular(17),
              ),
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
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
                    Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 60,
                            vertical: 30,
                          ),
                          width: 1,
                          height: 193,
                          color: Colors.black,
                        ),
                      ],
                    ),
                    Column(
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
                  ],
                ),
              ),
            ),
            Container(
              width: 430,
              height: 216,
              margin: const EdgeInsets.only(
                top: 50,
              ),
              child: Row(
                children: [
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                          left: 60,
                          top: 19.5,
                          bottom: 53.5,
                        ),
                        child: SvgPicture.asset(
                          "assets/images/settings_icon.svg",
                          width: 41,
                          height: 43,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                          left: 82,
                          top: 9,
                        ),
                        child: Image.asset(
                          "assets/images/calc.png",
                          width: 62,
                          height: 64,
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                          left: 82,
                          top: 19.5,
                        ),
                        child: SvgPicture.asset(
                          "assets/images/clock_icon.svg",
                          width: 43,
                          height: 43,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
Text(
                            //Team1
                            printer(team1),
                            style: const TextStyle(
                              fontSize: 30,
                            ),
                          ),
 */