import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:pensamento_formulario/src/shared/models/sentimento_model.dart';

class SentimentoBloc extends BlocBase {

  PageController pageController = new PageController();
  final SentimentoModel model = SentimentoModel();
  
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
