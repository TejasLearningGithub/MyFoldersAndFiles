import 'package:accessing_kido_apis/provider/country_provider.dart';
import 'package:accessing_kido_apis/repository/country_repo_second.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

// class CountryScreen extends StatefulWidget {
//   const CountryScreen({super.key});

//   @override
//   State<CountryScreen> createState() => _CountryScreenState();
// }

// class _CountryScreenState extends State<CountryScreen> {
//   @override
//   void initState() {
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       Provider.of<CountryProvider>(context, listen: false).getCountryData();
//     });
//     super.initState();
//   }

//   CountryRepoSecond countryRepoSecond = CountryRepoSecond();
//   @override
//   Widget build(BuildContext context) {
//     var cProvider = Provider.of<CountryProvider>(context, listen: false);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Country Screens'),
//       ),
//       body: Container(
//         child: Column(
//           children: [
//             ElevatedButton(
//                 onPressed: () {
//                   cProvider.getCountryData();
//                   print('=================================' +
//                       ' await ${cProvider.getCountryData()}');
//                   //countryRepoSecond.getCountries();
//                 },
//                 child: Text('press')),
//             Consumer<CountryProvider>(
//               builder: (context, value, child) {
//                 return Container(
//                   height: 510,
//                   width: double.maxFinite,
//                   child: ListView.builder(
//                       itemCount: value.myData.length,
//                       itemBuilder: (context, index) {
//                         return Card(
//                             color: Colors.blue,
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text('ABC'),
//                               ],
//                             ));
//                       }),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
