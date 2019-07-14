import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:pensamento_formulario/src/app_module.dart';
import 'package:pensamento_formulario/src/sentimento/sentimento_module.dart';
import 'package:pensamento_formulario/src/shared/blocs/shared_bloc.dart';

import '../../sentimento_bloc.dart';

class DescreverBloc extends BlocBase {
  

  addModel() {
    var model = SentimentoModule.to.bloc<SentimentoBloc>().model;
    AppModule.to.bloc<SharedBloc>().addNovoSentimento(model);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
