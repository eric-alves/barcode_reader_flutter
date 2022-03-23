// import 'package:flutter/material.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';
// import 'package:qrcode_barcode_flutter/app/code-reader/pagamento_controller.dart';

// class CodeReaderView extends StatefulWidget {
//   const CodeReaderView({Key? key}) : super(key: key);

//   @override
//   State<CodeReaderView> createState() => _CodeReaderState();
// }

// class _CodeReaderState extends State<CodeReaderView> {
//   String? tiket;
//   CodeReaderController codeReaderController = CodeReaderController();

//   readQRcode() async {
//     String code = await FlutterBarcodeScanner.scanBarcode(
//         "#ffffff", "Cancelar", false, ScanMode.QR);

//     setState(() {
//       tiket = code != -1 ? code : "Não validado";
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: MediaQuery.of(context).size.width,
//         child: Observer(
//           builder: (_) {
//             return Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text(codeReaderController.pagamento.linhaDigitavelValida()
//                     ? "${codeReaderController.pagamento.linhaDigitavel}"
//                     : "Vazio"),
//                 ElevatedButton.icon(
//                   onPressed: codeReaderController.readBarcode,
//                   icon: Icon(Icons.qr_code),
//                   label: Text("Abrir leitor"),
//                 )
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
