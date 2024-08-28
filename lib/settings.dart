import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings(this.where, {super.key});
  final void Function(int f) where;

  @override
  State<Settings> createState() {
    return _SettingsState();
  }
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          const BoxDecoration(color: Color.fromARGB(255, 229, 225, 225)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Image.asset(
                    "assets/images/sbet.png",
                    width: 300,
                  ),
                  const SizedBox(height: 60),
                  const Icon(Icons.nat),
                  const SizedBox(height: 30),
                  OutlinedButton(
                    onPressed: () {
                      widget.where(0);
                    },
                    child: const Text(
                      "start quiz",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      widget.where(0);
                    },
                    child: const Text(
                      "start quiz",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 72,
                child: Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.pink, // Background color
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: IconButton(
                            onPressed: () {
                              // widget.where(0);
                            },
                            icon: const Icon(Icons.settings),
                            color: Colors.black, // Icon color
                            iconSize: 40.0,
                            padding: const EdgeInsets.only(bottom: 0.0),
                          ),
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
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: IconButton(
                            onPressed: () {
                              widget.where(1);
                            },
                            icon: const Icon(Icons.home),
                            color: Colors.black, // Icon color
                            iconSize: 40.0,
                            padding: const EdgeInsets.only(bottom: 0.0),
                          ),
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
                            widget.where(0);
                          },
                          icon: const Icon(Icons.games_outlined),
                          color: Colors.black, // Icon color
                          iconSize: 40.0,
                          padding: const EdgeInsets.only(bottom: 0.0),
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
        ],
      ),
    );
  }
}
