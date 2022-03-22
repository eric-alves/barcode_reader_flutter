import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class CodeReader extends StatefulWidget {
  const CodeReader({Key? key}) : super(key: key);

  @override
  State<CodeReader> createState() => _CodeReaderState();
}

class _CodeReaderState extends State<CodeReader> {
  String? tiket;

  readQRcode() async {
    String code = await FlutterBarcodeScanner.scanBarcode(
        "#ffffff", "Cancelar", false, ScanMode.QR);

    setState(() {
      tiket = code != -1 ? code : "Não validado";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            tiket != null ? Text("$tiket") : Text(""),
            ElevatedButton.icon(
              onPressed: () {
                readQRcode();
              },
              icon: Icon(Icons.qr_code),
              label: Text("Abrir leitor"),
            )
          ],
        ),
      ),
    );
  }
}
