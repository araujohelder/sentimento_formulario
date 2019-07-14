import 'package:flutter/material.dart';
import 'package:pensamento_formulario/src/sentimento/sentimento_bloc.dart';
import 'package:pensamento_formulario/src/sentimento/sentimento_module.dart';
import 'package:pensamento_formulario/src/shared/models/sentimento_model.dart';
import 'package:pensamento_formulario/src/shared/widgets/smille.dart';

class StatusPage extends StatefulWidget {
  @override
  _StatusPageState createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {

  double valueRange = 0;

  _getFeeling(value) {
    if (value == 0) {
      return "Feliz";
    } else if ( value > 0 && value < 0.3) {
      return "Normal";
    } else if ( value > 0.3 && value < 0.51) {
      return "Indiferente";
    } else if ( value > 0.51 && value < 0.75) {
      return "Triste";
    } else if ( value > 0.75) {
      return "Raiva";
    } 
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Como está se sentindo agora?"),
          SizedBox(height: 20),
          Container(
            height: 180,
            width: 180,
            child: Smiley(range: valueRange)
            ),
            SizedBox( height: 20),
            Text(_getFeeling(valueRange), style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.lerp(Colors.blue, Colors.red, valueRange)
            )),
          SizedBox(
            height: 20,
          ),
            Slider(
              value: valueRange,
              min: 0,
              max: 1,
              onChanged: (double value) {
                setState(() {
                  valueRange = value;
                });
              } 
            ),
            OutlineButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
              ),
              onPressed: () {
                var model = SentimentoModule.to.bloc<SentimentoBloc>().model;
                model.sentimento = valueRange;
                model.title = _getFeeling(valueRange);
                SentimentoModule.to.bloc<SentimentoBloc>().pageController.jumpToPage(1);
              },
              child: Text("PRÓXIMO", style: TextStyle(color: Theme.of(context).primaryColor)),
            )

        ],
      ),
    );
  }
}
