import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:pensamento_formulario/src/shared/models/sentimento_model.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class SharedBloc extends BlocBase {


   List<SentimentoModel> sentimentoList = [];
   BehaviorSubject<List<SentimentoModel>> _listController;
   

   SharedBloc() {
     _listController = BehaviorSubject.seeded(sentimentoList);
   }
  
  Observable<List<SentimentoModel>> get listOut => _listController.stream;

  expurgar() {
    _listController.sink.add([]);
  }

  addNovoSentimento(SentimentoModel model) {
    sentimentoList.add(model);
    _listController.sink.add(sentimentoList);
  }

  @override
  void dispose() {
    _listController.close();
    super.dispose();
  }
}
