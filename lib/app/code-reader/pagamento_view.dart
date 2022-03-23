import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class PagamentoView extends StatefulWidget {
  const PagamentoView({Key? key}) : super(key: key);

  @override
  State<PagamentoView> createState() => _PagamentoViewState();
}

class _PagamentoViewState extends State<PagamentoView> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
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
              title: const Text('DADOS BÁSICOS'),
              content: Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Observer(builder: (_) {
                      return TextFormField(
                          // controller: _usernameController,
                          obscureText: false,
                          decoration: InputDecoration(
                            icon: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.qr_code),
                            ),
                            errorText: null,
                            labelText: 'Linha Digitável',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          validator: null);
                    }),
                    SizedBox(
                      height: 5,
                    ),
                    Text("Clique no ícone para ler o código de barras.")
                  ],
                ),
              ),
            ),
            Step(
              isActive: _index >= 1,
              title: Text('COMPROVANTE'),
              content: Text('Content for Step 2'),
            ),
          ],
        ),
      ),
    );
  }
}
