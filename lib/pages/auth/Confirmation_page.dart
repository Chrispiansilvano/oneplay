import 'package:flutter/material.dart';

class ConfirmationPage extends StatefulWidget {
  final username;
  const ConfirmationPage({super.key, this.username});
  @override
  State<ConfirmationPage> createState() => _ConfirmationPageState();
}

class _ConfirmationPageState extends State<ConfirmationPage> {
  final _confirmationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            height: 300,
            width: MediaQuery.of(context).size.width - 30.0,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.7))],
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(
              children: [
                TextFormField(
                  controller: _confirmationController,
                  decoration:
                      const InputDecoration(hintText: 'Confirmation Code'),
                  onChanged: (val) {
                    setState(() {
                      _confirmationController.text = val;
                    });
                  },
                ),
                const SizedBox(
                  height: 10.0,
                ),
                ElevatedButton(
                    onPressed: () {
                     
                    },
                    child: const Text('CONFIRM'))
              ],
            ),
          ),
        ],
      )),
    );
  }
}

