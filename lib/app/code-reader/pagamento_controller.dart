import 'package:mobx/mobx.dart';
import 'package:qrcode_barcode_flutter/app/code-reader/pagamento_model.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:clipboard/clipboard.dart';

part 'pagamento_controller.g.dart';

class PagamentoController = _PagamentoController with _$PagamentoController;

abstract class _PagamentoController with Store {
  final pagamento = PagamentoModel();

  @observable
  String teste = '';

  readBarcode() async {
    String code = await FlutterBarcodeScanner.scanBarcode(
        "#ffffff", "Cancelar", false, ScanMode.BARCODE);
    if (code != "-1") {
      pagamento.setLinhaDigitavel(code);
    }
  }

  colarClipBoard() {
    FlutterClipboard.paste().then((value) {
      pagamento.setLinhaDigitavel(value);
    });
  }
}
