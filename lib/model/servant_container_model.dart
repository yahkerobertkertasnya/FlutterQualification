import 'package:flutter/material.dart';
import 'package:post_training_qualif/model/comment_model.dart';
import 'package:post_training_qualif/model/servant_model.dart';

class ServantContainer extends ChangeNotifier {
  final List<Servant> _servantList = [
    Servant(
      name: 'Artoria Pendragon',
      className: "Saber", 
      gender: "Female",
      description: "Artoria Pendragon (アルトリア・ペンドラゴン, Arutoria Pendoragon?, also romanized as Arturia and Altria), Class Name Saber (セイバー, Seibā?), is one of the main characters of Fate/Zero and one of the three main heroines of Fate/stay night.", 
      rarity: "SSR", 
      type: "Buster", 
      image: "https://gamepress.gg/grandorder/sites/grandorder/files/styles/servant_image/public/2017-07/Artoria4.png?itok=OmKQEsrL"
    ),
    Servant(
      name: 'EMIYA',
      className: "Archer", 
      gender: "Male",
      description: "EMIYA (エミヤ?), Class Name Archer (アーチャー, Āchā?), is the Archer-class Servant of Rin Tohsaka during the Fifth Holy Grail War in Fate/stay night. He is one of the Servants of Ritsuka Fujimaru in Fate/Grand Order to assist them during the Grand Orders.", 
      rarity: "SR", 
      type: "Buster", 
      image: "https://gamepress.gg/grandorder/sites/grandorder/files/styles/servant_image/public/2017-07/011%20EMIYA%204.png?itok=eaFxelEx"
    ),
    Servant(
      name: 'Cú Chulainn',
      className: "Lancer", 
      gender: "Male",
      description: "Cú Chulainn (クー・フーリン, Kū Fūrin?), Class Name Lancer (ランサー, Ransā?), is the Lancer-class Servant of Bazett Fraga McRemitz in the Fifth Holy Grail War of Fate/stay night. He becomes the Servant of Kirei Kotomine after Kirei fatally wounds Bazett, and remains under his command for the duration of the War. Caren Hortensia acts as his Master during the events of Fate/hollow ataraxia.", 
      rarity: "R", 
      type: "Quick", 
      image: "https://gamepress.gg/grandorder/sites/grandorder/files/styles/servant_image/public/2017-07/017%20Cu%20Chulainn%204.png?itok=HPMTwVMp"
    ),
    Servant(
      name: 'Medea',
      className: "Caster", 
      gender: "Female",
      description: "Medea (メデイアWP, Medeia?), Class Name Caster (キャスター, Kyasutā?), is the Caster-class Servant of Atrum Galliasta in the Fifth Holy Grail War of Fate/stay night, who later forms a contract with Souichirou Kuzuki after killing Atrum. She also acts as the Master of another Servant, Sasaki Kojirou. She is also a Masterless Servant in the Subcategory Holy Grail War of Fate/Labyrinth, and one of the Servants summoned by Ritsuka Fujimaru in the Grand Order conflicts of Fate/Grand Order.", 
      rarity: "R", 
      type: "Arts", 
      image: "https://gamepress.gg/grandorder/sites/grandorder/files/styles/servant_image/public/2017-07/031%20Medea%204.png?itok=hiQPb2sG"
    ),
    Servant(
      name: 'Sasaki Kojirou',
      className: "Assassin", 
      gender: "Male",
      description: "Sasaki Kojirou (佐々木 小次郎WP, Sasaki Kojirō?), Class Name Assassin (アサシン, Asashin?), is the Assassin-class Servant of Medea in the Fifth Holy Grail War of Fate/stay night. He is an irregular Servant that shouldn't exist according to the rules of the Holy Grail War, but Medea's unique nature as a Servant summoning a Servant twists the process. The true Servant, one of the Hassan-i-Sabbah, is summoned as True Assassin in the Heaven's Feel route.", 
      rarity: "R", 
      type: "Quick", 
      image: "https://gamepress.gg/grandorder/sites/grandorder/files/styles/servant_image/public/2017-07/039%20Kojiro%20Sasaki%204.png?itok=zhaQKlmJ"
    ),
    Servant(
      name: 'Heracles',
      className: "Berseker", 
      gender: "Male",
      description: "Heracles (ヘラクレスWP, Herakuresu?, HerculesWP), Class Name Berserker (バーサーカー, Bāsākā?), is the Berserker-class Servant of Illyasviel von Einzbern in the Fifth Holy Grail War of Fate/stay night. He is one of the Servants of Ritsuka Fujimaru of the Grand Order conflicts of Fate/Grand Order.", 
      rarity: "SR", 
      type: "Buster", 
      image: "https://gamepress.gg/grandorder/sites/grandorder/files/styles/servant_image/public/2017-07/047%20Heracles%204.png?itok=rMIv6rkz"
    ),
  ];


  List<Servant> getAllServant(){
    return _servantList;
  }

  updateComment(Servant servant, List<Comment> comments){
    _servantList[_servantList.indexOf(servant)].comments = comments;
    notifyListeners();
  }

}
