import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:prg_search/provider/pets_provider.dart';
import 'package:provider/provider.dart';

class PetsScreen extends StatefulWidget {
  const PetsScreen({super.key});

  @override
  State<PetsScreen> createState() => _PetsScreenState();
}

class _PetsScreenState extends State<PetsScreen> {
  late PetsProvider petsProvider;

  Future initPrefs() async {
    await petsProvider.getPetsData();
    petsProvider.isLoading = false;
  }

  @override
  void initState() {
    super.initState();
    petsProvider = Provider.of<PetsProvider>(context, listen: false);
    initPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pets Data'),
      ),
      body: getBodyUi(),

      //  getBodyUi()

      //getBodyUi()

      // SinglepChildScrollView(
      //   scrollDirection: Axis.horizontal,
      //   child: Column(
      //     children: [
      //       SizedBox(
      //         height: 550,
      //         width: double.maxFinite,
      //         child: Consumer<PetsProvider>(builder: (context, value, child) {
      //           return Expanded(
      //             child: ListView.builder(
      //                 shrinkWrap: true,
      //                 itemCount: value.myPetsModal.data!.length,
      //                 itemBuilder: (context, index) {
      //                   return Column(
      //                     children: [
      //                       Text('${value.myPetsModal.data![index].petName}'),
      //                       Image.network(
      //                           '${value.myPetsModal.data?[index].petImage}')
      //                     ],
      //                   );
      //                 }),
      //           );
      //         }),
      //       )
      //     ],
      //   ),
      // ),
    );
  }

  Widget getLoadingUI() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          SpinKitFadingCircle(
            color: Colors.blue,
            size: 80,
          ),
          Text(
            'Loading...',
            style: TextStyle(fontSize: 20, color: Colors.blue),
          ),
        ],
      ),
    );
  }

  Widget getErrorUi(String error) {
    return Center(
      child: Text(
        error,
        style: const TextStyle(
          color: Colors.red,
          fontSize: 22,
        ),
      ),
    );
  }

  Widget getBodyUi() {
    //final provider = Provider.of<PetsProvider>(context, listen: false);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: TextField(
            onChanged: (val) {
              petsProvider.search(val);
            },
            decoration: InputDecoration(
                hintText: 'Search',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                suffixIcon: const Icon(Icons.search)),
          ),
        ),
        Expanded(
          child: Consumer<PetsProvider>(
            builder: (context, value, child) {
              return ListView.builder(
                itemCount: value.searchedPets.data?.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          petsProvider.searchedPets.data?[index].petImage ??
                              ''),
                    ),
                    title: Text(
                        petsProvider.searchedPets.data?[index].userName ?? ''),
                    trailing:
                        petsProvider.searchedPets.data?[index].isFriendly ==
                                null
                            ? const SizedBox()
                            : const Icon(
                                Icons.pets,
                                color: Colors.red,
                              ),
                  );
                },
              );
            },
          ),
        )
      ],
    );
  }
}
