
import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});
  
  @override  
  Widget build(BuildContext context) {  
    return const Center(  
      child: Text('It is a contact tab, which is responsible for displaying the contacts stored in your mobile',  
          style: TextStyle(fontSize: 32.0),  
        )  
    );  
  }  
}  