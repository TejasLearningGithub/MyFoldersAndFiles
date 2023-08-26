import 'package:flutter/material.dart';

class FantasyEditProfile extends StatelessWidget {
  const FantasyEditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 17, 17, 17),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 4,
                width: double.maxFinite,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 193, 3),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(88),
                    bottomRight: Radius.circular(50),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18.0,
                    vertical: 25,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Icon(
                        Icons.arrow_back,
                        size: 35,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: -100,
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 17, 17, 17),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child: Container(
                      height: 175,
                      width: 175,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        image: const DecorationImage(
                          image: AssetImage(
                            "assets/images/pubg.jpg",
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 107,
                bottom: -65,
                child: Icon(
                  Icons.edit_square,
                  color: Colors.red,
                  size: 40,
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 6,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.2,
            child: TextFormField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(5),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide.none),
                filled: true,
                fillColor: Colors.white,
                hintText: 'Enter Invitation code',
              ),
            ),
          )
        ],
      ),
    );
  }
}
