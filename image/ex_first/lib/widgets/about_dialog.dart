import 'package:flutter/material.dart';

class WidetAboutDialog extends StatefulWidget {
  const WidetAboutDialog({super.key});

  @override
  State<WidetAboutDialog> createState() => _WidetAboutDialogState();
}

class _WidetAboutDialogState extends State<WidetAboutDialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Example of AboutDialog')),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => const AboutDialog(
                        applicationIcon: FlutterLogo(),
                        applicationLegalese: 'Legalese',
                        applicationName: 'Flutter App',
                        applicationVersion: 'version 1.1.0',
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 48.0),
                            child: Text('This is text created by flutter app'),
                          )
                        ],
                      ));
            },
            child: const Text('Press')),
      ),
    );
  }
}
