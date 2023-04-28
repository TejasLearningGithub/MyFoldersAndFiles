import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:kido_drop_down_apis/info_card/info_new_card.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Info Card'),
      ),
      body: Column(
        children: const [
          InfoCard(
            stage: 'ENROLLED',
            leadNumber: '1122334455667788990',
            statusName: 'statusName',
            subStatusName: 'subStatusName',
            childFirstName: 'ABC',
            childGender: 'Male',
            childDoB: '1/1/2011',
            schoolName: 'My School',
            parentName: 'Renu Pathak',
          ),
          InfoCard(
            stage: 'LOST',
            // leadNumber: '112233',
            statusName: 'statusName',
            subStatusName: 'subStatusName',
            childFirstName: 'DEF',
            childGender: 'Male',
            childDoB: '1/1/2011',
            schoolName: 'My School',
            parentName: 'Renu Pathak',
          ),
          InfoCard(
            stage: 'Tour Booked',
            // leadNumber: '112233',
            statusName: 'statusName',
            subStatusName: 'subStatusName',
            childFirstName: 'GHI',
            childGender: 'Male',
            childDoB: '1/1/2011',
            schoolName: 'My School',
            parentName: 'Renu Pathak',
          ),
          InfoCard(
            stage: 'Post Tour',
            // leadNumber: '112233',
            statusName: 'statusName',
            subStatusName: 'subStatusName',
            childFirstName: 'JKL',
            childGender: 'Male',
            childDoB: '1/1/2011',
            schoolName: 'My School',
            parentName: 'Renu Pathak',
          ),
        ],
      ),
    );
  }
}
