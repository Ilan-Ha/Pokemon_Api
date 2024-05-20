import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_hands_on/pages/pokemon_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String nomeDoPokemon = '';
  String imagemDoPokemon = '';
  int idDoPokemon = 0;
  String typeDoPokemon = '';
  var controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff3C5AA6),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xff3C5AA6),
        title: const Text(
          'Home Page',
          style: TextStyle(
            color: Color(0xffF2B807),
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 64),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(24)),
                  border: Border.all(color: const Color(0xffF2B807), width: 5),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8),
                width: 400,
                child: TextField(
                  textAlignVertical: TextAlignVertical.center,
                  decoration: const InputDecoration(
                    hintText: "Digite o nome do Pokemon:",
                    hintStyle: TextStyle(color: Colors.black, fontSize: 30),
                  ),
                  controller: controller,
                ),
              ),
            ),
            SizedBox(
              width: 300,
              height: 60,
              child: ElevatedButton(
                style: const ButtonStyle(
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(22)))),
                    backgroundColor:
                        MaterialStatePropertyAll(Color(0xffF2B807))),
                onPressed: () async {
                  Dio dio = Dio();
                  Response retorno = await dio.get(
                      'https://pokeapi.co/api/v2/pokemon/${controller.text.toLowerCase()}');
                  setState(() {
                    nomeDoPokemon = retorno.data['name'];
                    imagemDoPokemon = retorno.data['sprites']['front_default'];
                    idDoPokemon = retorno.data['id'];
                    typeDoPokemon = retorno.data['types'][0]['type']['name'];
                  });
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PokemonPage(
                          imagemDoPokemon: imagemDoPokemon,
                          nomeDoPokemon: nomeDoPokemon,
                          idDoPokemon: idDoPokemon,
                          typeDoPokemon: typeDoPokemon,
                        ),
                      ));
                },
                child: const Text(
                  'Pesquisar',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff3C5AA6),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
