import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutterapp/utils/MyDataGridSource.dart';
import 'package:http/http.dart' as http;
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

const int itemCount = 20;

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // late Future<List<String>> _futureData;
  late Future<List<Map<String, String>>> _futureData;

  // Future<List<String>> fetchData() async {
  //   final response =
  //       await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
  //   List<dynamic> jsonData = jsonDecode(response.body) as List<dynamic>;
  //   final itemTitles =
  //       jsonData.map((data) => {
  //         'email':data['email'] as String,
  //         'name':data['name'] as String
  //       } as String).toList();

  //   return itemTitles;
  // }

    Future<List<Map<String, String>>> fetchData() async {
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
      List<dynamic> jsonData = jsonDecode(response.body) as List<dynamic>;
      final itemTitles = jsonData.map((data) => {
        'email': data['email'] as String,
        'name': data['name'] as String
      }).toList();

      return itemTitles;
    }

  @override
  void initState() {
    super.initState();
    _futureData = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    final List<GridColumn> _columns = <GridColumn>[
     GridColumn(
        columnName: 'email',
        label: Container(
          padding: const EdgeInsets.all(16.0),
          alignment: Alignment.centerLeft,
          child: const Text(
            'Email',
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
      GridColumn(
        columnName: 'name',
        label: Container(
          padding: const EdgeInsets.all(16.0),
          alignment: Alignment.centerLeft,
          child: const Text(
            'name',
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    ];

    return Scaffold(
      body: FutureBuilder<List<Map<String, String>>>(
        future: _futureData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final dataSource = MyDataGridSource(items: snapshot.data!);
            return SfDataGrid(
              source: dataSource,
              columnWidthMode: ColumnWidthMode.auto,
              columns: _columns,
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}