import 'package:flutter/material.dart';
import 'package:oneplay/pages/Subscription/ConfirmPayment.dart';

class PayMentMethod extends StatelessWidget {
  const PayMentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 20, 62, 87),
        title: const Text(
          'Payment Method',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
            )),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin:
                Alignment.topCenter, // Adjust as desired (top left by default)
            end: Alignment
                .bottomCenter, // Adjust as desired (bottom right by default)s
            colors: [
              Color.fromARGB(255, 20, 62, 87),
              Color.fromARGB(255, 15, 44, 61),
              Color.fromARGB(255, 13, 37, 52),
              Color.fromARGB(255, 10, 31, 44),
              Color.fromARGB(255, 7, 23, 33),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,

          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 45, 0, 0),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: Text(
                    'Choose your payment method',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.15,
                          width: MediaQuery.of(context).size.width * 0.35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                                color: const Color.fromARGB(255, 158, 158,
                                    158)), // Optional border (adjust as needed)
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: FittedBox(
                              fit: BoxFit.contain, // Adjust fit as needed
                              child: Image.asset('images/tigopesalogo.png'),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Text(
                            'Tigopesa',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.15,
                          width: MediaQuery.of(context).size.width * 0.35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            // border: Border.all(
                            //     color: Colors
                            //         .grey), // Optional border (adjust as needed)
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: FittedBox(
                              fit: BoxFit.cover, // Adjust fit as needed
                              child: Image.asset('images/mpesalogo.png'),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Text(
                            'M-Pesa',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.15,
                          width: MediaQuery.of(context).size.width * 0.35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                                color: Colors
                                    .grey), // Optional border (adjust as needed)
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: FittedBox(
                              fit: BoxFit.contain, // Adjust fit as needed
                              child: Image.asset('images/halopesalogo.png'),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Text(
                            'Halopesa',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.15,
                          width: MediaQuery.of(context).size.width * 0.35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                                color: Colors
                                    .grey), // Optional border (adjust as needed)
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: FittedBox(
                              fit: BoxFit.cover, // Adjust fit as needed
                              child: Image.asset('images/airtelmoneylogo.png'),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Text(
                            'Airtel Money',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
            const Expanded(child: SizedBox()),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                0,
                0,
                0,
                20,
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ConfirmPayment()));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.08,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color.fromARGB(255, 126, 196, 236)),
                  child: const Center(
                    child: Text(
                      'N e x t',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
