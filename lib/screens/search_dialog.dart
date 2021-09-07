import 'package:desafio_marvel/api/conectar.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class SearchDialog extends StatefulWidget {
  const SearchDialog(this.initialText);

  final String initialText;

  @override
  _SearchDialogState createState() => _SearchDialogState();
}

class _SearchDialogState extends State<SearchDialog> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Conectar>(
      builder: (_, conectar, __) {
        return Stack(
          children: <Widget>[
            Positioned(
              top: 2,
              left: 4,
              right: 4,
              child: Card(
                child: Column(
                  children: [
                    TextFormField(
                      initialValue: widget.initialText,
                      textInputAction: TextInputAction.search,
                      autofocus: true,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 15),
                          prefixIcon: IconButton(
                            icon: Icon(Icons.arrow_back),
                            color: Colors.grey[700],
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          )),
                      onFieldSubmitted: (text) {
                        conectar.pesquisar = text;

                        Navigator.of(context).pop(text);
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
