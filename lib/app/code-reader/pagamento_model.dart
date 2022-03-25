import 'package:mobx/mobx.dart';

part 'pagamento_model.g.dart';

class PagamentoModel = _PagamentoModel with _$PagamentoModel;

abstract class _PagamentoModel with Store {
  @observable
  String linhaDigitavel = "";

  @observable
  double valorPagar = 0;

  @observable
  double valorDesconto = 0;

  @observable
  String dataVencimento = "";

  @observable
  bool pagarHoje = true;

  @observable
  String observacao = "";

  @observable
  String tipo = "";

  @observable
  String mask = "";

  @observable
  String placeHolder = "";

  @observable
  int? maxLength;

  @action
  setLinhaDigitavel(String value) => linhaDigitavel = value;

  @action
  setValorPagar(value) => valorPagar = value;

  @action
  setValorDesconto(value) => valorDesconto = value;

  @action
  setDataVencimento(value) => dataVencimento = value;

  @action
  setPagarHoje(value) => pagarHoje = value;

  @action
  setObservacao(value) => observacao = value;

  @action
  setTipo(value) => tipo = value;

  @action
  setMask(value) => mask = value;

  @action
  setPlaceHolder(value) => placeHolder = value;

  @action
  setMaxLength(value) => maxLength = value;

  bool linhaDigitavelValida() {
    return linhaDigitavel != null && linhaDigitavel != "";
  }

  // linha digitavel e codigo de barras do convenio é sempre a msm coisa

  @action
  validateTipoPagamento() {
    if (linhaDigitavel != null && linhaDigitavel != "") {
      if (tipo == "convenio") {
        setMaxLength(56);
        setPlaceHolder(
            "___________-_ ___________-_ ___________-_ ___________-_");
        setMask("###########-# ###########-# ###########-# ###########-#");
      } else {
        setMaxLength(55);
        setPlaceHolder(
            "_____._____ _____.______ _____.______ _ ______________");
        setMask("#####.##### #####.###### #####.###### # ##############");
      }
    }
  }
}
