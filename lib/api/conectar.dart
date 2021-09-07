import 'package:desafio_marvel/model/heroi_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';


class Conectar extends ChangeNotifier {
  Conectar() {
    getConectar();
  }

  Dio dio = Dio();
  List<HeroiModel> listaherois = [];

  bool _loading = false;
  bool get loading => _loading;
  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  String _pesquisar = '';
  String get pesquisar => _pesquisar;
  set pesquisar(String value){
    _pesquisar = value;
    notifyListeners();
  }

  List<HeroiModel> get listaHeroiPesquisa {
    final List<HeroiModel> filtroHeroi = [];
    filtroHeroi.addAll(
      listaherois.where(
              (p) => p.name!.toLowerCase().contains(pesquisar)
      ),
    );
    return filtroHeroi;
  }

  Future<void> getConectar() async {
    loading = true;
    listaherois.clear();

    try {
      final response = await dio.get(
          'http://gateway.marvel.com//v1/public/characters?ts=13071011601&apikey'
          '=4d0fefd824b8a691db3fc70006fcbe48&hash=3340de1676c454b9feca3e989daf4a6b');

      if (response.statusCode == 200) {
        for (Map<String, dynamic> item in response.data['data']["results"]) {
          HeroiModel heroiModel = HeroiModel.fromJson(item);
          listaherois.add(heroiModel);
          print(item);
          }
      }
    } catch (erro) {
      print(erro);
    }
    loading = false;
  }
}
