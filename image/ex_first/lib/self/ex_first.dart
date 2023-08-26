import 'dart:math';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class SfDataridFirst extends StatefulWidget {
  const SfDataridFirst({super.key});

  @override
  State<SfDataridFirst> createState() => _SfDataridFirstState();
}

class _SfDataridFirstState extends State<SfDataridFirst> {
  late _StackedHeaderDataGridSource stackedHeaderDataGridSource;

  final Random random = Random();

  List<Product> productData = [];

  final List<String> product = <String>[
    'Lax',
    'Chocolate',
    'Syrup',
    'Chai',
    'Bags',
    'Meat',
    'Filo',
    'Cashew',
    'Walnuts',
    'Geitost',
    'Cote de',
    'Crab',
    'Chang',
    'Cajun',
    'Gum',
    'Filo',
    'Cashew',
    'Walnuts',
    'Geitost',
    'Bag',
    'Meat',
    'Filo',
    'Cashew',
    'Geitost',
    'Cote de',
    'Crab',
    'Chang',
    'Cajun',
    'Gum',
  ];

  final List<String> cities = <String>[
    'Bruxelles',
    'Rosario',
    'Recife',
    'Graz',
    'Montreal',
    'Tsawassen',
    'Campinas',
    'Resende',
  ];

  final List<int> productId = <int>[
    3524,
    2523,
    1345,
    5243,
    1803,
    4932,
    6532,
    9475,
    2435,
    2123,
    3652,
    4523,
    4263,
    3527,
    3634,
    4932,
    6532,
    9475,
    2435,
    2123,
    6532,
    9475,
    2435,
    2123,
    4523,
    4263,
    3527,
    3634,
    4932,
  ];

  final List<DateTime> orderDate = <DateTime>[
    DateTime.now(),
    DateTime(2002, 8, 27),
    DateTime(2015, 7, 4),
    DateTime(2007, 4, 15),
    DateTime(2010, 12, 23),
    DateTime(2010, 4, 20),
    DateTime(2004, 6, 13),
    DateTime(2008, 11, 11),
    DateTime(2005, 7, 29),
    DateTime(2009, 4, 5),
    DateTime(2003, 3, 20),
    DateTime(2011, 3, 8),
    DateTime(2013, 10, 22),
  ];

  List<String> names = [
    'Kyle',
    'Gina',
    'Irene',
    'Katie',
    'Michael',
    'Oscar',
    'Ralph',
    'Torrey',
    'William',
    'Bill',
    'Daniel',
    'Frank',
    'Brenda',
    'Danielle',
    'Fiona',
    'Howard',
    'Jack',
    'Larry',
    'Holly',
    'Jennifer',
    'Liz',
    'Pete',
    'Steve',
    'Vince',
    'Zeke'
  ];

  StackedHeaderRow? orderRow;

  @override
  void initState() {
    super.initState();
    productData = _generateProductData(20);
    stackedHeaderDataGridSource =
        _StackedHeaderDataGridSource(productData: productData);
  }

  List<Product> _generateProductData(int count) {
    final List<Product> productData = <Product>[];
    for (int i = 0; i < count; i++) {
      productData.add(
        Product(
            i + 1000,
            productId[i < productId.length
                ? i
                : random.nextInt(productId.length - 1)],
            product[
                i < product.length ? i : random.nextInt(product.length - 1)],
            random.nextInt(count),
            70.0 + random.nextInt(100),
            cities[i < cities.length ? i : random.nextInt(cities.length - 1)],
            1700 + random.nextInt(100),
            orderDate[random.nextInt(orderDate.length - 1)],
            names[i < names.length ? i : random.nextInt(names.length - 1)]),
      );
    }
    return productData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Self Stacked Header Demo')),
      body: Column(
        children: [
          Expanded(child: _buildDataGrid()),
        ],
      ),
    );
  }

  StackedHeaderRow stackedHeaderRow = StackedHeaderRow(cells: [
    StackedHeaderCell(
      columnNames: ['customerName', 'city'],
      child: Container(
        color: const Color(0xFFF1F1F1),
        child: const Center(
          child: Text(
            'Customer Details',
          ),
        ),
      ),
    ),
    StackedHeaderCell(
      columnNames: ['productId', 'product'],
      child: Container(
        color: const Color(0xFFF1F1F1),
        child: const Center(
          child: Text(
            'Product Details',
          ),
        ),
      ),
    ),
    StackedHeaderCell(
      columnNames: ['myproductidf', 'myproductids', 'myproductidt'],
      child: Container(
        color: const Color(0xFFF1F1F1),
        child: const Center(
          child: Text(
            'My Details',
          ),
        ),
      ),
    ),
    StackedHeaderCell(
      columnNames: ['newfirst'],
      child: Container(
        color: const Color(0xFFF1F1F1),
        child: const Center(
          child: Text(
            'All Details',
          ),
        ),
      ),
    ),
    StackedHeaderCell(
      columnNames: ['newsecond'],
      child: Container(
        color: const Color(0xFFF1F1F1),
        child: const Center(
          child: Text(
            'All New Details',
          ),
        ),
      ),
    ),
    StackedHeaderCell(
      columnNames: ['a', 'b', 'c', 'd', 'e'],
      child: Container(
        color: const Color(0xFFF1F1F1),
        child: const Center(
          child: Text(
            'All New ABCDE Details',
          ),
        ),
      ),
    ),
    StackedHeaderCell(
      columnNames: ['ab', 'ac'],
      child: Container(
        color: const Color(0xFFF1F1F1),
        child: const Center(
          child: Text(
            'AB',
          ),
        ),
      ),
    ),
  ]);

  _buildDataGrid() {
    return SfDataGrid(
      gridLinesVisibility: GridLinesVisibility.vertical,
      headerGridLinesVisibility: GridLinesVisibility.both,
      source: stackedHeaderDataGridSource,
      
    
      columns: [
        GridColumn(
            columnName: 'customerName',
            width: 140,
            label: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Customer Name',
                overflow: TextOverflow.ellipsis,
              ),
              color: _getHeaderCellBackgroundColor(),
            )),
        GridColumn(
            columnName: 'city',
            width: 100,
            label: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(8.0),
              child: Text(
                'City',
                overflow: TextOverflow.ellipsis,
              ),
              color: _getHeaderCellBackgroundColor(),
            )),
        GridColumn(
            columnName: 'product',
            width: 100,
            label: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Product',
                overflow: TextOverflow.ellipsis,
              ),
              color: _getHeaderCellBackgroundColor(),
            )),
        GridColumn(
            columnName: 'productId',
            width: 100,
            label: Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Product ID',
                overflow: TextOverflow.ellipsis,
              ),
              color: _getHeaderCellBackgroundColor(),
            )),
        GridColumn(
            columnName: 'myproductidf',
            width: 100,
            label: Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Product ID',
                overflow: TextOverflow.ellipsis,
              ),
              color: _getHeaderCellBackgroundColor(),
            )),
        GridColumn(
            columnName: 'myproductids',
            width: 120,
            label: Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Product Alpha',
                overflow: TextOverflow.ellipsis,
              ),
              color: _getHeaderCellBackgroundColor(),
            )),
        GridColumn(
            columnName: 'myproductidt',
            width: 120,
            label: Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Product Name',
                overflow: TextOverflow.ellipsis,
              ),
              color: _getHeaderCellBackgroundColor(),
            )),
        GridColumn(
            columnName: 'newfirst',
            width: 170,
            label: Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.all(8.0),
              child: Text(
                'New Column Name',
                overflow: TextOverflow.ellipsis,
              ),
              color: _getHeaderCellBackgroundColor(),
            )),
        GridColumn(
            columnName: 'newsecond',
            width: 170,
            label: Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.all(8.0),
              child: Text(
                'New Second Name',
                overflow: TextOverflow.ellipsis,
              ),
              color: _getHeaderCellBackgroundColor(),
            )),
        GridColumn(
            columnName: 'a',
            width: 110,
            label: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(8.0),
              child: Text(
                'A',
                overflow: TextOverflow.ellipsis,
              ),
              color: _getHeaderCellBackgroundColor(),
            )),
        GridColumn(
            columnName: 'b',
            width: 110,
            label: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(8.0),
              child: Text(
                'B',
                overflow: TextOverflow.ellipsis,
              ),
              color: _getHeaderCellBackgroundColor(),
            )),
        GridColumn(
            columnName: 'c',
            width: 110,
            label: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(8.0),
              child: Text(
                'C',
                overflow: TextOverflow.ellipsis,
              ),
              color: _getHeaderCellBackgroundColor(),
            )),
        GridColumn(
            columnName: 'd',
            width: 110,
            label: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(8.0),
              child: Text(
                'D',
                overflow: TextOverflow.ellipsis,
              ),
              color: _getHeaderCellBackgroundColor(),
            )),
        GridColumn(
            columnName: 'e',
            width: 110,
            label: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(8.0),
              child: Text(
                'E',
                overflow: TextOverflow.ellipsis,
              ),
              color: _getHeaderCellBackgroundColor(),
            )),
        GridColumn(
            columnName: 'ab',
            width: 110,
            label: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(8.0),
              child: Text(
                'AB',
                overflow: TextOverflow.ellipsis,
              ),
              color: _getHeaderCellBackgroundColor(),
            )),
        GridColumn(
            columnName: 'ac',
            width: 110,
            label: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(8.0),
              child: Text(
                'AC',
                overflow: TextOverflow.ellipsis,
              ),
              color: _getHeaderCellBackgroundColor(),
            )),
      ],
      stackedHeaderRows: _getStackedHeaderRows(),
    );
  }

  Color _getHeaderCellBackgroundColor() {
    return const Color(0xFFF1F1F1);
  }

  List<StackedHeaderRow> _getStackedHeaderRows() {
    final List<StackedHeaderRow> stackedHeaderCollection = [];
    stackedHeaderCollection.add(stackedHeaderRow);
    // if (orderRow != null) {
    //   stackedHeaderCollection.insert(0, orderRow!);
    // }
    return stackedHeaderCollection;
  }
}

class _StackedHeaderDataGridSource extends DataGridSource {
  _StackedHeaderDataGridSource({required List<Product> productData}) {
    _productData = productData.map<DataGridRow>((e) {
      return DataGridRow(cells: [
        DataGridCell(columnName: 'customerName', value: e.customerName),
        DataGridCell(columnName: 'city', value: e.city),
        DataGridCell(columnName: 'product', value: e.product),
        DataGridCell(columnName: 'productId', value: e.productId),

      ]);
    }).toList(growable: false);
  }
  late List<DataGridRow> _productData;

  @override
  List<DataGridRow> get rows => _productData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(cells: [
      Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(8.0),
        child: Text(
          row.getCells()[0].value,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(8.0),
        child: Text(
          row.getCells()[1].value,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.all(8.0),
        child: Text(
          row.getCells()[2].value,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(8.0),
        child: Text(
          row.getCells()[3].value.toString(),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(8.0),
        child: Text(
          row.getCells()[3].value.toString(),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(8.0),
        child: Text(
          row.getCells()[2].value.toString(),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(8.0),
        child: Text(
          row.getCells()[2].value.toString(),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(8.0),
        child: Text(
          row.getCells()[2].value.toString(),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(8.0),
        child: Text(
          row.getCells()[2].value.toString(),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(8.0),
        child: Text(
          row.getCells()[2].value.toString(),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(8.0),
        child: Text(
          row.getCells()[2].value.toString(),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(8.0),
        child: Text(
          row.getCells()[2].value.toString(),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(8.0),
        child: Text(
          row.getCells()[2].value.toString(),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(8.0),
        child: Text(
          row.getCells()[0].value.toString(),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(8.0),
        child: Text(
          row.getCells()[0].value.toString(),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(8.0),
        child: Text(
          row.getCells()[0].value.toString(),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    ]);
  }
}

class Product {
  Product(
      this.orderId,
      this.productId,
      this.product,
      this.quantity,
      this.unitPrice,
      this.city,
      this.customerId,
      this.orderDate,
      this.customerName);
  final int orderId;
  final int productId;
  final String product;
  final int quantity;
  final double unitPrice;
  final String city;
  final int customerId;
  final DateTime orderDate;
  final String customerName;
}
