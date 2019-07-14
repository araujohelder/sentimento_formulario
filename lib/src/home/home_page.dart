import 'package:flutter/material.dart';
import 'package:pensamento_formulario/src/app_module.dart';
import 'package:pensamento_formulario/src/sentimento/sentimento_module.dart';
import 'package:pensamento_formulario/src/shared/blocs/shared_bloc.dart';

import 'package:pensamento_formulario/src/shared/models/sentimento_model.dart';
import 'package:pensamento_formulario/src/shared/widgets/smille.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final blocSentimento = AppModule.to.getBloc<SharedBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pensamentos"),
      ),
      bottomNavigationBar: RaisedButton(
        color: Theme.of(context).primaryColor,
        onPressed: AppModule.to.bloc<SharedBloc>().expurgar,
        child: Text("Expurgar", style: TextStyle(color: Colors.white),),
      ),
      body:StreamBuilder<List<SentimentoModel>>(
        stream: blocSentimento.listOut,
        builder: (context, snapshot){
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final List<SentimentoModel> models = snapshot.data;
          if (models.length == 0 ) {
            return Container(
              color: Colors.grey[300],
              child: Center( child: Text("Não ha nenhum pensamento cadastrado")),
            );
          }

          return ListView.separated(
            
            itemCount: models.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                child: ListTile(
                  leading: Container(
                    height: 100,
                    width: 100,
                    child: Smiley(range: models[index].sentimento),
                  ),
                  title: Text(models[index].title),
                  subtitle: Text(models[index].subtitle),
                ),
              );
            }, 
            separatorBuilder: (BuildContext context, int index) {
              return Divider();
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute( builder: (_) => SentimentoModule() ));
        },
      ),
    );
  }
}
