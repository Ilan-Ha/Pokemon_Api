import 'package:flutter/material.dart';

class PokemonPage extends StatelessWidget {
  const PokemonPage(
      {super.key,
      required this.imagemDoPokemon,
      required this.nomeDoPokemon,
      required this.idDoPokemon,
      required this.typeDoPokemon});
  final String imagemDoPokemon;
  final String nomeDoPokemon;
  final int idDoPokemon;
  final String typeDoPokemon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff3C5AA6),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xff3C5AA6),
        title: const Text(
          'Pokemon Page',
          style: TextStyle(
              color: Color(0xffF2B807),
              fontSize: 30,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.white,
              width: 170,
              height: 170,
              child: Image(
                image: NetworkImage(
                  imagemDoPokemon,
                  scale: 1 / 2,
                ),
              ),
            ),
            SizedBox(
              width: 400,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                textDirection: TextDirection.ltr,
                children: [
                  Text(
                    'Name: $nomeDoPokemon',
                    style: const TextStyle(
                        color: Color(0xffF2B807),
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'ID: $idDoPokemon',
                    style: const TextStyle(
                        color: Color(0xffF2B807),
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Type: $typeDoPokemon',
                    style: const TextStyle(
                        color: Color(0xffF2B807),
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
