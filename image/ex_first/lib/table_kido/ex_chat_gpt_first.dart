import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';



class CustomerDetails {
  final String customerId;
  final String customerName;

  CustomerDetails(this.customerId, this.customerName);
}

class ProductDetails {
  final String productId;
  final String productName;

  ProductDetails(this.productId, this.productName);
}

class Data {
  final DateTime date;
  final List<CustomerDetails> customerDetails;
  final List<ProductDetails> productDetails;

  Data(this.date, this.customerDetails, this.productDetails);
}

class MyDataGridWidget extends StatelessWidget {
  final List<Data> _dataList = [
    Data(
      DateTime(2023, 8, 17),
      [
        CustomerDetails('C1', 'John Doe'),
        CustomerDetails('C2', 'Jane Smith'),
      ],
      [
        ProductDetails('P1', 'Product A'),
        ProductDetails('P2', 'Product B'),
      ],
    ),
    // Add more Data instances as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Syncfusion DataGrid Example')),
      body: SfDataGrid(
        source: MyDataGridSource(_dataList),
        columns: [
          GridColumn(columnName: 'date', label: Text('Date')),
          GridColumn(
            columnName: 'customerDetails', label: Text('Customer Deail')
            // child: (BuildContext context, dynamic rowData, _) {
            //   final List<CustomerDetails> customers = rowData;
            //   return Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: customers
            //         .map((customer) =>
            //             Text('${customer.customerId}: ${customer.customerName}'))
            //         .toList(),
            //   );
            // },
          ),
          GridColumn(
            columnName: 'productDetails',
            label: Text('Product Details'),
            // child: (BuildContext context, dynamic rowData, _) {
            //   final List<ProductDetails> products = rowData;
            //   return Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: products
            //         .map(
            //             (product) => Text('${product.productId}: ${product.productName}'))
            //         .toList(),
            //   );
            // },
          ),
        ],
      ),
    );
  }
}

class MyDataGridSource extends DataGridSource {
  final List<Data> dataList;

  MyDataGridSource(this.dataList);

  @override
  List<Object?> get dataSource => dataList;

  @override
  Object? getCellValue(int rowIndex, String columnName) {
    final data = dataList[rowIndex];
    switch (columnName) {
      case 'date':
        return data.date;
      case 'customerDetails':
        return data.customerDetails;
      case 'productDetails':
        return data.productDetails;
      default:
        return null;
    }
  }

  @override
  int get rowCount => dataList.length;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((cell) {
        return Container(
          padding: EdgeInsets.all(8.0),
          alignment: Alignment.centerLeft,
          // child: cell.columnName == 'date'
          //     ? Text(
          //         '${(cell.value as DateTime).toLocal()}',
          //         style: TextStyle(fontWeight: FontWeight.bold),
          //       )
          //     : cell.getCellValue(row),
        );
      }).toList(),
    );
  }
}
