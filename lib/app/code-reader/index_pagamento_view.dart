import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:qrcode_barcode_flutter/app/code-reader/pagamento_controller.dart';
import 'package:qrcode_barcode_flutter/app/code-reader/pagamento_view.dart';

class IndexPagamentoView extends StatefulWidget {
  const IndexPagamentoView({Key? key}) : super(key: key);

  @override
  State<IndexPagamentoView> createState() => _IndexPagamentoViewState();
}

class _IndexPagamentoViewState extends State<IndexPagamentoView> {
  // PagamentoController pagamentoController = PagamentoController();

  @override
  Widget build(BuildContext context) {
    var pagamentoController = Provider.of<PagamentoController>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Pagamento"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Escolha a categoria do pagamento."),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
              ),
              onPressed: () {
                pagamentoController.pagamento.setTipo("convenio");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PagamentoView()),
                );
              },
              child: Text('Convênio (Água, luz, telefone, ...)'),
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
              ),
              onPressed: () {
                pagamentoController.pagamento.setTipo("titulo");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PagamentoView()),
                );
              },
              child: Text('Título (Boleto bancário)'),
            )
          ],
        ),
      ),
    );
  }
}
