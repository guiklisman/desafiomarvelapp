import 'package:desafio_marvel/api/conectar.dart';
import 'package:desafio_marvel/screens/descricao.dart';
import 'package:desafio_marvel/screens/search_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Inicial extends StatefulWidget {
  @override
  _InicialState createState() => _InicialState();
}

class _InicialState extends State<Inicial> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Conectar>(builder: (_, listaherois, __) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFed1d24),
          elevation: 0,
          title: Consumer<Conectar>(builder: (_, conectar, __) {
            if (conectar.pesquisar.isEmpty) {
              return Image.asset(
                'image/logo_marvel.png',
                fit: BoxFit.fill,
                height: 50,
              );
            } else {
              return GestureDetector(
                onTap: () async {
                  final search = await showDialog<String>(
                      context: context,
                      builder: (_) => SearchDialog(conectar.pesquisar));
                  if (search != null) {
                    conectar.pesquisar = search;
                  }
                },
                child: Container(
                    child: Text(
                  conectar.pesquisar,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                )),
              );
            }
          }),
          centerTitle: true,
          actions: <Widget>[
            Consumer<Conectar>(
              builder: (_, conectar, __) {
                if (conectar.pesquisar.isEmpty) {
                  return IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () async {
                      final search = await showDialog<String>(
                          context: context,
                          builder: (_) => SearchDialog(conectar.pesquisar));
                      if (search != null) {
                        conectar.pesquisar = search;
                      }
                    },
                  );
                } else {
                  return IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () async {
                      conectar.pesquisar = '';
                    },
                  );
                }
              },
            ),
          ],
        ),
        body: Container(
          color: Colors.white,
          child: listaherois.loading
              ? Center(
                  child: CircularProgressIndicator(
                    color: Colors.red,
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: listaherois.listaHeroiPesquisa.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(children: [
                      Card(
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        elevation: 3,
                        color: Colors.white,
                        child: Container(
                          height: 128,
                          width: double.infinity,
                          child: Row(children: [
                            Column(
                              children: [
                                Expanded(
                                  flex: 0,
                                  child: Container(
                                    height: 128,
                                    width: 150,
                                    child: Image.network(
                                      listaherois.listaHeroiPesquisa[index]
                                              .thumbnail!.path! +
                                          '.' +
                                          listaherois.listaHeroiPesquisa[index]
                                              .thumbnail!.extension! +
                                          ('?ts=13071011601&apikey=4d0fefd824b8a691db3fc70006fcbe48&hash='
                                              '3340de1676c454b9feca3e989daf4a6b'),
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Center(
                                    child: Text(
                                      listaherois
                                          .listaHeroiPesquisa[index].name!,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: 'Bebas',
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(
                                        listaherois.listaHeroiPesquisa[index]
                                            .description!,
                                        style: TextStyle(
                                            fontFamily: 'Bebas',
                                            fontSize: 12,
                                            color: Colors.grey),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 3,
                                        softWrap: false,
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Descricao(
                                                  heroiModel: listaherois
                                                          .listaHeroiPesquisa[
                                                      index],
                                                )),
                                      );
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 0, 0, 0),
                                          child: Text(
                                            'Ver Sobre',
                                            style: TextStyle(
                                                fontFamily: 'Bebas',
                                                fontSize: 11),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          color: Colors.red,
                                          size: 18,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                ],
                              ),
                            ),
                          ]),
                        ),
                      ),
                    ]);
                  },
                ),
        ),
      );
    });
  }
}
