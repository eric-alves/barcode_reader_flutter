import 'package:flutter/material.dart';
import 'package:qrcode_barcode_flutter/app/code-reader/code_reader_view.dart';
import 'package:qrcode_barcode_flutter/app/code-reader/index_pagamento_view.dart';
import 'package:qrcode_barcode_flutter/app/code-reader/pagamento_controller.dart';
import 'package:qrcode_barcode_flutter/app/code-reader/pagamento_view.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<PagamentoController>(
            create: (context) => PagamentoController())
      ],
      child: MaterialApp(
        title: 'BarCode Flutter',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: const IndexPagamentoView(),
      ),
    );
  }
}
