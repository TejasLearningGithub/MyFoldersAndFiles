import 'package:flutter/material.dart';
import 'package:kido_drop_down_apis/common/app_theme.dart';
import 'package:kido_drop_down_apis/theme/theme_constant.dart';

class InfoCard extends StatelessWidget {
  final GlobalKey<NavigatorState>? navKey;
  final String? screenRoute;
  final String? leadId;
  final String stage;
  final String? leadNumber;
  final String statusName;
  final String subStatusName;
  final String childFirstName;
  final String childGender;
  final String childDoB;
  final String schoolName;
  final String parentName;
  final bool? permit;
  const InfoCard({
    super.key,
    this.navKey,
    this.screenRoute,
    this.leadId,
    required this.stage,
    this.leadNumber,
    required this.statusName,
    required this.subStatusName,
    required this.childFirstName,
    required this.childGender,
    required this.childDoB,
    required this.schoolName,
    required this.parentName,
    this.permit,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () {
      //   if (permit) {
      //     Navigator.pushNamed(
      //       navKey.currentContext!,
      //       screenRoute,
      //       arguments: {'leadId': leadId},
      //     );
      //   } else {
      //     scaffoldMessage('Permission Denied',context);
      //   }
      // },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 7.5,
        ),
        child: Container(
          width: double.maxFinite,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.white,
            border: Border.all(
              style: BorderStyle.solid,
              color: AppColors.darkBlue,
              width: 1,
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 4,
                offset: Offset(
                  2.0,
                  5.0,
                ),
              ),
            ],
          ),
          child: Stack(
            children: [
              Positioned(
                top: 6,
                bottom: 6,
                child: Container(
                  width: 6,
                  decoration: BoxDecoration(
                    color: stage == 'LOST'
                        ? Colors.red
                        : stage == 'ENROLLED'
                            ? AppColors.oliveGreen
                            : stage == 'Warm' || stage == 'Post Tour'
                                ? AppColors.darkOrange
                                : stage == 'Tour Booked'
                                    ? Colors.blue
                                    : Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.star),
                        Text(
                          parentName,
                          style: montserratBold,
                        ),
                        const SizedBox(width: 36),
                        Container(
                          height: 20,
                          width: 78,
                          decoration: BoxDecoration(
                              //color: Colors.blue,
                              color: stage == 'LOST'
                                  ? Colors.red
                                  : stage == 'ENROLLED'
                                      ? AppColors.oliveGreen
                                      : stage == 'Warm' || stage == 'Post Tour'
                                          ? AppColors.darkOrange
                                          : stage == 'Tour Booked'
                                              ? Colors.blue
                                              : Colors.grey,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15))),
                          child: Center(
                            child: Text(
                              stage,
                              style: montserratBold.copyWith(
                                  fontSize: 10, color: AppColors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                    vs(),
                    IntrinsicHeight(
                      child: Row(
                        children: [
                          Text(
                            'Status : NEW LEAD YTC - NO RESPONSE',
                            style: montserratBold.copyWith(
                                fontSize: 16, color: AppColors.lightGrey),
                          ),
                        ],
                      ),
                    ),
                    vs(),
                    Text(
                      'Source cat: Source category',
                      style: montserratBold.copyWith(
                        fontSize: 12,
                        color: AppColors.lightGrey,
                      ),
                    ),
                    vs(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Last Activity : date/time  due:date/time',
                          style: montserratBold.copyWith(
                              fontSize: 12, color: AppColors.lightGrey),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget vs() {
  return const SizedBox(
    height: 4,
  );
}

Widget hs() {
  return const SizedBox(
    height: 7,
  );
}

void scaffoldMessage(String message, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}
