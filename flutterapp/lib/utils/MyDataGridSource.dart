// ignore: file_names
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'dart:convert';

class MyDataGridSource extends DataGridSource {
  MyDataGridSource({required List<Map<String, String>> items}) : _items = items;

    late List<Map<String, String>> _items;

 @override
  List<DataGridRow> get rows => List.generate(
        _items.length,
        (index) => DataGridRow(cells: [
          DataGridCell<String>(
              columnName: 'email', value: _items[index]['email']!),
          DataGridCell<String>(
              columnName: 'name', value: _items[index]['name']!),
        ]),
      );

@override
Object? getValueAt(int rowIndex, String columnName) {
  final itemJson = jsonDecode(_items[rowIndex][columnName]!);
  switch (columnName) {
    case 'email':
      return itemJson['email'];
    case 'name':
      return itemJson['name'];
    default:
       throw Exception('Invalid column name: $columnName');
  }
}

  @override
  int get rowCount => _items.length;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        color: Colors.white24,
        cells: row.getCells().map<Widget>((dataGridCell) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: Colors.grey[300]!,
                ),
                right: BorderSide(
                  width: 1,
                  color: Colors.grey[300]!,
                ),
              ),
            ),
            child: Text(dataGridCell.value.toString()),
          );
        }).toList());
  }
}
