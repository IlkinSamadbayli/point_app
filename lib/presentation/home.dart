import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app_provider.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController nameController;
  late TextEditingController expressionController;

  @override
  void initState() {
    nameController = TextEditingController();
    expressionController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    expressionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<AppProvider>(
              builder: (context, appProvider, child) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'You have pushed the button this many times:',
                  ),
                  const SizedBox(height: 16),
                  Container(
                    // padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: const BoxDecoration(
                        color: Colors.tealAccent, shape: BoxShape.circle),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 32),
                      child: Text(
                        "${appProvider.counter}",
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FloatingActionButton(
                          onPressed: () => appProvider.decreacement,
                          tooltip: 'Decreament',
                          child: const Icon(Icons.remove),
                        ),
                        FloatingActionButton(
                          onPressed: () => appProvider.reset,
                          tooltip: 'Reset',
                          child: const Icon(Icons.restore_outlined),
                        ),
                        FloatingActionButton(
                          onPressed: () {
                            appProvider.increment;
                            if (appProvider.counter == 10) {
                              showDialog(
                                  context: context,
                                  builder: (context) => const AlertDialog(
                                        title: Text(
                                          "Congratulations!",
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.teal,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        content: Text("You have reached 10"),
                                      ));
                            }
                          },
                          tooltip: 'Increment',
                          child: const Icon(Icons.add),
                        ),
                      ]),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
