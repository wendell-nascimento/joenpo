import 'dart:math';
import 'package:flutter/material.dart';


class MyApp2 extends StatefulWidget {
  @override
  _MyApp2State createState() => _MyApp2State();
}

class _MyApp2State extends State<MyApp2> {
  var opcoes = ["pedra", "papel", "tesoura"];
  var checkImage = Image.asset(
    "images/padrao.png",
    height: 100,
  );
  var resultado = "Escolha uma opção abaixo";

  String computerPlayer() {
    String computerOption = opcoes[Random().nextInt(opcoes.length)];
    setState(() {
      checkImage = Image.asset(
        "images/$computerOption.png",
        height: 100,
      );
    });

    return computerOption;
  }

  String checkResult(String clicked, String computerOption) {
    String check = "Você perdeu";

    switch (clicked) {
      case "pedra":
        {
          if (computerOption == "pedra") {
            check = "Empatou";
          } else {
            if (computerOption == "tesoura") {
              check = "Ganhou";
            }
          }
        }
        break;
      case "papel":
        {
          if (computerOption == "papel") {
            check = "Empatou";
          } else {
            if (computerOption == "pedra") {
              check = "Ganhou";
            }
          }
        }
        break;
      case "tesoura":
        {
          if (computerOption == "tesoura") {
            check = "Empatou";
          } else {
            if (computerOption == "papel") {
              check = "Ganhou";
            }
          }
        }
        break;
    }
    return check;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JokenPo"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do App: ",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              checkImage,
            ],
          ),
          Text(
            "$resultado",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                  onTap: () {
                    String computerOption = computerPlayer();
                    setState(() {
                      resultado = checkResult("papel", computerOption);
                    });
                  },
                  child: Image.asset(
                    "images/papel.png",
                    height: 100,
                  )),
              GestureDetector(
                  onTap: () {
                    String computerOption = computerPlayer();
                    setState(() {
                      resultado = checkResult("pedra", computerOption);
                    });
                  },
                  child: Image.asset(
                    "images/pedra.png",
                    height: 100,
                  )),
              GestureDetector(
                  onTap: () {
                    String computerOption = computerPlayer();
                    setState(() {
                      resultado = checkResult("tesoura", computerOption);
                    });
                  },
                  child: Image.asset(
                    "images/tesoura.png",
                    height: 100,
                  )),
            ],
          )
        ],
      ),
    );
  }
}
