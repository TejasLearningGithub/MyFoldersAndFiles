import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
//Step 3
  _HomeScreenState() {     
    _filter.addListener(() {
      if (_filter.text.isEmpty) {
        setState(() {
          _searchText = "";
          filteredNames = names;
        });
      } else {
        setState(() {
          _searchText = _filter.text;
        });
      }
    });
  }

//Step 1
  final TextEditingController _filter = TextEditingController();
  final dio = Dio(); // for http requests
  String _searchText = "";
  List names = []; // names we get from API
  List filteredNames = []; // names filtered by search text
  Icon _searchIcon = const Icon(Icons.search);
  Widget _appBarTitle = const Text('Search Example');

  //step 2.1
  void _getNames() async {
    final response =
        await dio.get('https://jsonplaceholder.typicode.com/users');
    print(response.data);
    List tempList = [];
    for (int i = 0; i < response.data.length; i++) {
      tempList.add(response.data[i]);
    }
    setState(() {
      names = tempList;
      filteredNames = names;
    });
  }

//Step 2.2
  void _searchPressed() {
    setState(() {
      if (_searchIcon.icon== Icons.search) {
        _searchIcon = const Icon(Icons.close);
        _appBarTitle = TextField(
          controller: _filter,
          decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search), hintText: 'Search...'),
        );
      } else {
        _searchIcon = const Icon(Icons.search);
        _appBarTitle = const Text('Search Example');
        filteredNames = names;
        _filter.clear();
      }
    });
  }

  //Step 4
  Widget _buildList() {
    if (!(_searchText.isEmpty)) {
      List tempList = [];
      for (int i = 0; i < filteredNames.length; i++) {
        if (filteredNames[i]['name']
            .toLowerCase()
            .contains(_searchText.toLowerCase())) {
          tempList.add(filteredNames[i]);
        }
      }
      filteredNames = tempList;
    }
    return ListView.builder(
      itemCount: names == null ? 0 : filteredNames.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(filteredNames[index]['name']),
          onTap: () => print(filteredNames[index]['name']),
        );
      },
    );
  }

  //STep6
  _buildBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: _appBarTitle,
      leading: IconButton(
        icon: _searchIcon,
        onPressed: _searchPressed,
      ),
    );
  }

  @override
  void initState() {
    _getNames();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildBar(context),
      body: Container(
        child: _buildList(),
      ),
      resizeToAvoidBottomInset: false,
//      floatingActionButton: FloatingActionButton(
//        onPressed: _postName,
//        child: Icon(Icons.add),
//      ),
    );
  }
}




















//
//void _postName() async {
//  var data = {
//    "id": 11,
//    "name": "Romeo Graham",
//    "username": "Bret",
//    "email": "Sincere@april.biz",
//    "address": {
//      "street": "Kulas Light",
//      "suite": "Apt. 556",
//      "city": "Gwenborough",
//      "zipcode": "92998-3874",
//      "geo": {"lat": "-37.3159", "lng": "81.1496"}
//    },
//    "phone": "1-770-736-8031 x56442",
//    "website": "hildegard.org",
//    "company": {
//      "name": "Romaguera-Crona",
//      "catchPhrase": "Multi-layered client-server neural-net",
//      "bs": "harness real-time e-markets"
//    }
//  };
//  final info = await dio
//      .post('https://jsonplaceholder.typicode.com/users', data: data)
//      .then((value) => debugPrint(value.toString()));
//}