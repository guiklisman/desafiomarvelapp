import 'package:desafio_marvel/model/heroi_model.dart';
import 'package:flutter/material.dart';

class Descricao extends StatefulWidget {
  final HeroiModel heroiModel;

  const Descricao({required this.heroiModel});

  @override
  _DescricaoState createState() => _DescricaoState();
}

class _DescricaoState extends State<Descricao> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFed1d24),
        elevation: 0,
        title: Image.asset(
          'image/logo_marvel.png',
          fit: BoxFit.fill,
          height: 50,
        ),
        centerTitle: true,
      ),
      body: ListView(children: [
        Center(
          child: Column(
            children: [
              Image.network(
                  widget.heroiModel.thumbnail!.path! +
                      '.' +
                      widget.heroiModel.thumbnail!.extension! +
                      '?ts=13071011601&apikey=4d0fefd824b8a691db3fc70006fcbe48&hash='
                          '3340de1676c454b9feca3e989daf4a6b',
                  fit: BoxFit.fill),
              SizedBox(height: 8),
              Text(
                "name: " + widget.heroiModel.name!,
                style: TextStyle(
                    color: Colors.black, fontFamily: 'Bebas', fontSize: 25),
              ),
              if (widget.heroiModel.description!.isNotEmpty)
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        widget.heroiModel.description!,
                        style: TextStyle(
                            color: Colors.black54,
                            fontFamily: 'Bebas',
                            fontSize: 15),
                      ),
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                  ],
                ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Quadrinhos",
                  style: TextStyle(
                      color: Colors.black, fontFamily: 'Bebas', fontSize: 25),
                ),
              ),
              SizedBox(
                height: 5,
              )
            ],
          ),
        ),
        ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: widget.heroiModel.comics!.items!.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Text(
                    widget.heroiModel.comics!.items![index].name!,
                    style: TextStyle(
                        color: Colors.black54,
                        fontFamily: 'Bebas',
                        fontSize: 15),
                  ),
                ),
              );
            }),
      ]),
    );
  }
}
