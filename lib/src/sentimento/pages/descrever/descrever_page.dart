import 'package:flutter/material.dart';
import 'package:pensamento_formulario/src/sentimento/pages/descrever/descrever_bloc.dart';
import 'package:pensamento_formulario/src/sentimento/sentimento_module.dart';

import '../../sentimento_bloc.dart';

class DescreverPage extends StatefulWidget {
  @override
  _DescreverPageState createState() => _DescreverPageState();
}

class _DescreverPageState extends State<DescreverPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Escreva seu pensamento"),
            SizedBox(height: 20),
            TextField( 
              maxLines: 5,
              onChanged: (value) {
                var model = SentimentoModule.to.bloc<SentimentoBloc>().model;
                model.subtitle = value;
              },
            ),
            SizedBox(height: 20),
            OutlineButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
                onPressed: () {
                  SentimentoModule.to.bloc<DescreverBloc>().addModel();
                  Navigator.pop(context);
                },
                child: Text("Salvar", style: TextStyle(color: Theme.of(context).primaryColor)),
              )
          ],
        ),
      ),
    );
  }
}
