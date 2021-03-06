import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:qrcode_barcode_flutter/app/code-reader/pagamento_controller.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PagamentoView extends StatefulWidget {
  const PagamentoView({Key? key}) : super(key: key);

  @override
  State<PagamentoView> createState() => _PagamentoViewState();
}

class _PagamentoViewState extends State<PagamentoView> {
  int _index = 0;
  // PagamentoController pagamentoController = PagamentoController();
  TextEditingController _linhaDigitavel = TextEditingController();
  MaskTextInputFormatter convenioMask = MaskTextInputFormatter(
      mask: "###########-# ###########-# ###########-# ###########-#",
      filter: {"#": RegExp(r'[0-9]')});
  MaskTextInputFormatter tituloMask = MaskTextInputFormatter(
      mask: "#####.##### #####.###### #####.###### # ##############",
      filter: {"#": RegExp(r'[0-9]')});
  late MaskTextInputFormatter maskAtiva;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    maskAtiva = convenioMask;
  }

  @override
  Widget build(BuildContext context) {
    var pagamentoController = Provider.of<PagamentoController>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Pagamento"),
        centerTitle: true,
      ),
      body: Container(
        // padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: Stepper(
          type: StepperType.horizontal,
          currentStep: _index,
          onStepCancel: () {
            if (_index > 0) {
              setState(() {
                _index -= 1;
              });
            }
          },
          onStepContinue: () {
            if (_index <= 0) {
              setState(() {
                _index += 1;
              });
            }
          },
          onStepTapped: (int index) {
            setState(() {
              _index = index;
            });
          },
          steps: <Step>[
            Step(
              isActive: _index >= 0,
              title: const Text(
                'DADOS B??SICOS',
                style: TextStyle(
                  fontSize: 8,
                ),
              ),
              content: Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Observer(
                      builder: (_) {
                        // _linhaDigitavel.text =
                        //     pagamentoController.pagamento.linhaDigitavel;

                        if (pagamentoController
                                .pagamento.linhaDigitavel.length ==
                            1) {
                          pagamentoController.pagamento.tipo == "convenio"
                              ? maskAtiva = convenioMask
                              : maskAtiva = tituloMask;
                        }

                        return pagamentoController.pagamento.tipo == null ||
                                pagamentoController.pagamento.tipo == ""
                            ? Container()
                            : TextFormField(
                                controller: _linhaDigitavel,
                                inputFormatters: [maskAtiva],
                                obscureText: false,
                                maxLines: 3,
                                minLines: 1,
                                onChanged: (value) {
                                  pagamentoController.pagamento
                                      .setLinhaDigitavel(value);
                                  // pagamentoController.pagamento
                                  //     .validateTipoPagamento();
                                },
                                decoration: InputDecoration(
                                  icon: IconButton(
                                    onPressed: pagamentoController.readBarcode,
                                    icon: Icon(Icons.qr_code),
                                  ),
                                  counter: TextButton(
                                    style: TextButton.styleFrom(
                                      padding: const EdgeInsets.all(0),
                                      primary: Colors.black45,
                                      textStyle: const TextStyle(fontSize: 16),
                                    ),
                                    onPressed:
                                        pagamentoController.colarClipBoard,
                                    child: const Text('Colar c??digo'),
                                  ),
                                  errorText: null,
                                  labelText: 'Linha Digit??vel',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                validator: null,
                              );
                      },
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Observer(builder: (_) {
                      return Text(
                          "${pagamentoController.pagamento.linhaDigitavel} // ${pagamentoController.pagamento.tipo}");
                    })
                  ],
                ),
              ),
            ),
            Step(
              isActive: _index >= 1,
              title: Text(
                'COMPROVANTE',
                style: TextStyle(
                  fontSize: 8,
                ),
              ),
              content: Text('Content for Step 2'),
            ),
          ],
        ),
      ),
    );
  }
}
