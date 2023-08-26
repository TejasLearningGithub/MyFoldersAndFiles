import 'package:ex_search/pets/pets_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PetsScreen extends StatefulWidget {
  const PetsScreen({super.key});

  @override
  State<PetsScreen> createState() => _PetsScreenState();
}

class _PetsScreenState extends State<PetsScreen> {
  late PetsProvider petsProvider;

  Future initPrefs() async {
    await petsProvider.getPetsDataWithJson();
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
        title: Text('Data Of Pets'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextFormField(
              onChanged: (value) {
                petsProvider.search(value);
              },
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              height: 450,
              width: double.infinity,
              child: Consumer<PetsProvider>(builder: (context, value, child) {
                return ListView.builder(
                  itemCount: value.searchedPets.data?.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title:
                          Text(value.searchedPets.data?[index].userName ?? 'A'),
                      subtitle:
                          Text(value.searchedPets.data?[index].petName ?? 'A'),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
