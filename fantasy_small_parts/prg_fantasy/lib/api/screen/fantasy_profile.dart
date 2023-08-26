import 'package:fantasy_cult/app/component/app_button.dart';
import 'package:fantasy_cult/app/models/user_profile_model.dart';
import 'package:fantasy_cult/app/provider/profile_provider.dart';
import 'package:fantasy_cult/app/screens/account/add_cash_screen.dart';
import 'package:fantasy_cult/app/screens/profile/fantasy_edit_profile.dart';
import 'package:fantasy_cult/app/theme/app_assets.dart';
import 'package:fantasy_cult/app/theme/app_theme.dart';
import 'package:fantasy_cult/app/theme/theme_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class FantasyProfile extends StatefulWidget {
  const FantasyProfile({super.key});

  @override
  State<FantasyProfile> createState() => _FantasyProfileState();
}

class _FantasyProfileState extends State<FantasyProfile> {
  late ProfileProvider profileProvider;

  initPrefs() async {
    await profileProvider.profileDetails();
  }

  @override
  void initState() {
    super.initState();
    profileProvider = Provider.of<ProfileProvider>(context, listen: false);
    initPrefs();
    //profileProvider.getData();
    // var providerData =  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //     Provider.of<ProfileProvider>(context, listen: false).profileDetails();
    //   });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    //var profileProvider = Provider.of<ProfileProvider>(context, listen: false);

    return Scaffold(
      body: SingleChildScrollView(
        child: Selector<ProfileProvider, ProfileModel>(
            selector: (p0, p1) => p1.fantasyUser,
            builder: (context, user, child) {
              return Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        height: height * 0.230,
                        width: width,
                        decoration: const BoxDecoration(
                          color: AppColors.fantasyBlack,
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(50),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                            right: width * 0.041,
                            bottom: height * 0.0959,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Padding(
                                  padding: EdgeInsets.only(left: 18.0),
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: AppColors.fantasyWhite,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const AddCashScreen(),
                                    ),
                                  );
                                },
                                child: SizedBox(
                                  // width: 30,
                                  height: 26,
                                  child: SvgPicture.asset(
                                    AppIcons.walletActive,
                                    height: 18,
                                    width: 18,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: height * -0.150,
                        right: width * 0.2401,
                        child: Container(
                          height: height * 0.300,
                          width: width * 0.500,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              fit: BoxFit.contain,
                              image: AssetImage(
                                AppImages.profilePic,
                              ),
                            ),
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 10,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.180),
                  Text(
                    //profileProvider.fantasyUser.data?.name ?? "null",
                    //profileProvider.fantasyUser.name ?? 'no name',
                    user.name ?? 'no name',
                    style: boldBlack.copyWith(fontSize: 23),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    user.email ?? 'no email',
                    style: boldBlack.copyWith(fontSize: 18),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    user.mobile ?? 'no mobile',
                    style: boldBlack.copyWith(fontSize: 18),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    user.address ?? 'no address',
                    textAlign: TextAlign.center,
                    style: normalBlack.copyWith(fontSize: 18),
                  ),
                  const SizedBox(height: 40),
                  AppButton(
                    text: 'Edit Profile',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FantasyEditProfile(),
                        ),
                      );
                    },
                  )
                ],
              );
            }),
      ),
    );
  }
}
