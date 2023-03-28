import 'package:accessing_kido_apis/mock_api_self/model/mock_api_model.dart';
import 'package:accessing_kido_apis/mock_api_self/provider/mock_api_provider.dart';
import 'package:accessing_kido_apis/mock_apis/provider/mock_apis_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class MyMockScreen extends StatefulWidget {
  const MyMockScreen({super.key});

  @override
  State<MyMockScreen> createState() => _MyMockScreenState();
}

class _MyMockScreenState extends State<MyMockScreen> {
  List<MockPerson> modelList = [];
  // getMyList() async {
  //   var models =
  //       await Provider.of<GetProvider>(context, listen: false).getData();
  //   modelList = <Person>[];
  //   models.forEach((mymodel) {
  //     setState(() {
  //       var _m = Person();
  //       _m.id = mymodel['id'];
  //       _m.firstName = mymodel['first_name'];
  //       _m.lastName = mymodel['last_name'];
  //       _m.message = mymodel['message'];
  //       modelList.add(_m);
  //     });
  //   });
  // }

  @override
  void initState() {
    // TODO: implement initState

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<MockApiProvider>(context, listen: false).fetchData();
    });
    super.initState();
    //getMyList();
  }

  @override
  Widget build(BuildContext context) {
    var res;
    var myGetProvider = Provider.of<MockProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Available'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Consumer<MockApiProvider>(
              builder: (context, value, child) {
                return Container(
                  height: 510,
                  width: double.maxFinite,
                  child: ListView.builder(
                      itemCount: value.myPerson.length,
                      itemBuilder: (context, index) {
                        return Card(
                            color: Colors.blue,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(value.myPerson[index].firstName ?? 'not'),
                                //Text(value.personData?.firstName ?? ''),
                                //Text(value.personData?.lastName ?? ''),
                                //Text(value.personData?.message ?? ''),
                                // Row(
                                //   mainAxisAlignment:
                                //       MainAxisAlignment.spaceAround,
                                //   children: [
                                //     IconButton(
                                //         onPressed: () {
                                //           Navigator.push(
                                //             context,
                                //             MaterialPageRoute(
                                //               builder: (context) => UpdateData(
                                //                 id: value.myData[index].id,
                                //                 firstName: value
                                //                     .myData[index].firstName,
                                //                 lastName: value
                                //                     .myData[index].lastName,
                                //                 message:
                                //                     value.myData[index].message,
                                //               ),
                                //             ),
                                //           );

                                //           // .then((value) => {
                                //           //       if (value != null)
                                //           //         {
                                //           //           // Provider.of<GetProvider>(
                                //           //           //         context,
                                //           //           //         listen: false)
                                //           //           //     .getData(),
                                //           //           ScaffoldMessenger.of(
                                //           //                   context)
                                //           //               .showSnackBar(
                                //           //             SnackBar(
                                //           //               content: Text(
                                //           //                 'Data Has been deleted',
                                //           //               ),
                                //           //             ),
                                //           //           ),
                                //           //         },
                                //           //     });
                                //         },
                                //         icon: Icon(Icons.edit)),

                                //   ],
                                // )
                              ],
                            ));
                      }),
                );
              },
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.push(
      //         context,
      //         MaterialPageRoute(
      //           builder: (context) => CreateData(),
      //         )).then((value) => {
      //           if (value != null)
      //             {
      //               Provider.of<GetProvider>(context, listen: false).getData(),
      //             }
      //         });
      //   },
      //   child: Icon(Icons.add),
      // ),
    );
  }
}
