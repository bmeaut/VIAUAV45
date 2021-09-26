import 'package:flutter/material.dart';
import 'package:flutter_l10n/domain/model/santa.dart';
import 'package:flutter_l10n/presentation/page/home/widgets/current_language.dart';
import 'package:flutter_l10n/presentation/page/home/widgets/santa_card.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Semantics(
          child: Text('HomePage'),
          label: "This is the HomePage.",
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CurrentLanguage(),
            const SizedBox(height: 32),
            Text(
              'Your santa',
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(height: 8),
            SantaCard(
              santa: Santa(
                  name: "Santa Claus",
                  avatar: "assets/icon/santa.png",
                  outfit: ["Hat", "Tie"],
                  description: "Jingle bells jingle bells\nJingle all the way\nOh what fun it is to ride\nIn a one horse open sleigh\nJingle bells jingle bells\nJingle all the way\nOh what fun it is to ride\nIn a one horse open sleigh\n\nDashing through the snow\nIn a one horse open sleigh\nOver the fields we go\nLaughing all the way\nBells on bob tail ring\nMaking spirits bright\nOh What fun it is to ride \nA sleighing song tonight\n\nOh, oh jingle bells jingle bells\nJingle all the way\nOh what fun it is to ride\nIn a one horse open sleigh\n\nYou better not pout\nYou better not cry\nYou better not shout\nI'm telling you why\nSanta Claus is coming to town\n\nHe's making a list\nHe's checking it twice\nGonna find out\nWho's naughty or nice\nSanta Claus is coming to town\n\nHe sees you when you're sleeping\nHe knows if you're awake\nHe knows if you've been bad or good\nSo be good for goodness sake\n\nI am dreaming of a white Christmas\nJust like the ones I used to know\nWhere the tree tops glisten\nAnd children listen\nTo hear sleighbells in the snow\nI am dreaming of a white Christmas\nWith every Christmas card I write\nMay your days be merry and bright\nAnd may all your Christmases be\n\nOh, the weather outside is frightful\nBut the fire is so delightful\nAnd since we've got no place to go\nLet it snow, let it snow, let it snow\n\nOh, it doesn't show signs of stopping\nAnd I've brought some corn for popping\nThe lights are turned way down low\nLet it snow, let it snow, let it snow\n\nWhen we finally kiss goodnight\nHow I'll hate going out in the storm\nBut, if you really hold me tight\nAll the way home I'll be warm\n\nThe fire is slowly dying\nAnd my dear, we're still good by ing\nBut, as long as you love me so\nLet it snow, let it snow, let it snow\n\nHere comes Santa Claus\nHere comes Santa Claus\nRight down Santa Claus Lane\nVixen and Blitzen and all his reindeer\nPullin' on the reins\nBells are ringin', children singin'\nAll is merry and bright\nHang your stockings and say your prayers\nSanta Claus comes tonight\n\nHere comes Santa Claus\nHere comes Santa Claus\nRight down Santa Claus Lane\nHe's got a bag that's filled with toys\nFor boys and girls again\nHear those sleigh bells jingle jangle\nOh what a beautiful sight\nJump in bed, and cover your head\nSanta Claus comes tonight\nSanta Claus comes tonight"),
            ),
          ],
        ),
      ),
    );
  }
}
