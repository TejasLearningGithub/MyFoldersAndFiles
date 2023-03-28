import 'package:accessing_kido_apis/kido/follow_up_model.dart';
import 'package:accessing_kido_apis/kido/follow_up_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FollowUpScreen extends StatefulWidget {
  const FollowUpScreen({super.key});

  @override
  State<FollowUpScreen> createState() => _FollowUpScreenState();
}

class _FollowUpScreenState extends State<FollowUpScreen> {
  late FollowUpProvider followUpProvider;
  bool isLoading = true;

  Future initPref() async {
    await followUpProvider.getFollowUp();
  }

  @override
  void initState() {
    super.initState();
    followUpProvider = Provider.of<FollowUpProvider>(context, listen: false);
    initPref().then((value) => {
          setState(() {
            isLoading = false;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kido Apis'),
      ),
      body: noFollowups(false),
    );
  }

  Widget noFollowups(bool permit) {
    // int count =
    //     context.select((FollowUpProvider value) => value.noFollowupCount ?? 0);
    return Selector<FollowUpProvider, List<FollowUpModel>>(
      selector: (context, provider) => provider.noFollowupsList,
      builder: (context, followList, child) {
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                //physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: followList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Text(followList[index].leadId?.parentName ?? 'not load'),
                      Text(followList[index].centerId?.sId ?? 'not load'),
                      Text(followList[index].isEmail.toString()),
                      Text(followList[index].followStatus.toString()),
                      Text(followList[index].followSubStatus.toString()),
                      Text(followList[index].centerId?.schoolDisplayName ?? ''),
                      Text(followList[index].followStatus.toString()),
                    ],
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
