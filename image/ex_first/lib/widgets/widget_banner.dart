import 'package:flutter/material.dart';

class WidetBanner extends StatefulWidget {
  const WidetBanner({super.key});

  @override
  State<WidetBanner> createState() => _WidetBannerState();
}

class _WidetBannerState extends State<WidetBanner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Banner Widget'),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: ClipRRect(
          child: Banner(
            message: '25% off',
            location: BannerLocation.topEnd,
            color: Colors.green,
            textStyle: const TextStyle(
              color: Colors.purple,
              fontSize: 10,
            ),
            child: Container(
              color: Colors.blueGrey,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.network(
                      'https://tinyurl.com/5n8ywvw3',
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Flutter Course (Begineers)',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orangeAccent,
                          ),
                          child: const Text('Get Now'),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
