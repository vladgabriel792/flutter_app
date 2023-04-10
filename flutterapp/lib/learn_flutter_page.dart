import 'package:flutter/material.dart';

class LearnFlutterPage extends StatefulWidget {
  const LearnFlutterPage({super.key});

  @override
  State<LearnFlutterPage> createState() => _LearnFlutterPageState();
}

class _LearnFlutterPageState extends State<LearnFlutterPage> {
  bool isSwitch = false;
  bool? isCheck = false;
  String checkAlertMessage = "Unchecked";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Controls Page'),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        actions: [
          IconButton(
            onPressed: () {
              debugPrint('Actions');
            },
            icon: const Icon(
              Icons.info_outline,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Visibility(
              visible: isCheck ?? false,
              child: Image.asset('images/myImage.jpg'),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              color: Colors.black,
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              margin: const EdgeInsets.all(10.0),
              width: double.infinity,
              color: Colors.blueGrey,
              child: const Center(
                child: Text(
                  'Dublaj!',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                debugPrint('Speciala');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: isSwitch ? Colors.blue : Colors.amber,
              ),
              child: isSwitch ? const Text('Incercam maine') : const Text('Incearca frate'),
            ),
            OutlinedButton(
              onPressed: () {
                debugPrint('Teapa');
              },
              child: const Text('Incearca altceva'),
            ),
            TextButton(
              onPressed: () {
                debugPrint('Nu te lasi...');
              },
              child: const Text('Book of Ra'),
            ),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                debugPrint('Ai apasat, este?');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Icon(
                    Icons.local_fire_department,
                    color: Colors.blue,
                  ),
                  Text("Ruleta"),
                  Icon(
                    Icons.local_fire_department,
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
            Switch(
                value: isSwitch,
                onChanged: (bool newBool) {
                  setState(() {
                    isSwitch = newBool;
                  });
                }),
            CheckboxListTile(
              title: const Text('Show Slots'),
              value: isCheck,
              onChanged: (bool? newBool) {
                checkAlertMessage = (isCheck == true) ? 'Unchecked' : 'Checked';
                setState(() {
                  isCheck = newBool;
                });
                 ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(checkAlertMessage),
                    duration: const Duration(milliseconds: 500),
                  ),
                );
              },
             
            ),
            Image.network(
                'https://plus.unsplash.com/premium_photo-1673254850680-969be808b314?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80')
          ],
        ),
      ),
    );
  }
}
