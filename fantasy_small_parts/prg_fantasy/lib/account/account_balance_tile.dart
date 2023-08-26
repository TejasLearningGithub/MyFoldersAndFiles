import 'package:flutter/material.dart';

class AccountBalance extends StatefulWidget {
  const AccountBalance({super.key});

  @override
  State<AccountBalance> createState() => _AccountBalanceState();
}

class _AccountBalanceState extends State<AccountBalance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Account Balance'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 59,
                width: 297,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.black), // Optional border styling
                  borderRadius:
                      BorderRadius.circular(25.0), // Optional border radius
                ),
                child: const Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text(
                            'Amount',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        Icon(Icons.info_outline),
                      ],
                    ),
                    SizedBox(height: 7),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text(
                            '₹',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Text(
                          'Cash',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
