import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:projet_pfe/user/Connexion.dart';
import 'package:projet_pfe/user/currentuser.dart';
import 'package:projet_pfe/user/userpreferences.dart';
import 'package:projet_pfe/widget/listingcorpus.dart';

import 'ajoutercorpus.dart';
import 'home_appercu.dart';

class ListingCorpus extends StatefulWidget {
  const ListingCorpus({super.key});

  @override
  State<ListingCorpus> createState() => _ListingCorpusState();
}

class _ListingCorpusState extends State<ListingCorpus> {
  final CurrentUser currentUser = Get.put(CurrentUser());
  CurrentUser remmebereCurrentUser = Get.put(CurrentUser());
  bool val = false;
  int val1 = -1;

  var valueChoose;
  List listItem = [
    'Categorie Corpus',
    'Genre',
    'Type',
    'Ariste',
    'Catgorie Artiste',
    'Rapporteur',
    'Contractant',
    'Langue',
    'Variante',
  ];
  SignOutUser() async {
    var res = await Get.dialog(AlertDialog(
      backgroundColor: Color.fromARGB(255, 199, 219, 232),
      title: Text(
        "Deconnexion",
        style: TextStyle(
            fontSize: 20, fontFamily: 'Andalus', fontWeight: FontWeight.bold),
      ),
      content: Text(
        "Êtes-vous sûr? \n de vouloir vous déconnecter? ",
        style: TextStyle(
          fontFamily: 'Andalus',
          fontSize: 16,
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text(
              "Non",
              style: TextStyle(
                color: Color.fromARGB(255, 3, 54, 106),
                fontFamily: 'Andalus',
                fontSize: 16,
              ),
            )),
        TextButton(
            onPressed: () {
              Get.back(result: "Deconnexion");
            },
            child: Text(
              "Oui",
              style: TextStyle(
                color: Color.fromARGB(255, 3, 54, 106),
                fontFamily: 'Andalus',
                fontSize: 16,
              ),
            )),
      ],
    ));
    if (res == "Deconnexion") {
      //delete-remove the user data from local storage
      RememeberUserPrefs.removeUserInfo().then((value) {
        Get.off(const Connexion());
      });
    }
  }

  Widget userInfo(IconData iconData, String userData) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Row(
        children: [
          Icon(
            iconData,
            size: 20,
            color: Color.fromARGB(255, 20, 60, 92),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            userData,
            style: TextStyle(
              color: Color.fromARGB(255, 30, 80, 121),
              fontWeight: FontWeight.w700,
              fontFamily: 'Andalus',
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 150,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        //banière
        flexibleSpace: const Expanded(
          child: Image(
              image: AssetImage('banner.png'),
              height: 150,
              width: 150,
              fit: BoxFit.cover),
        ),
        actions: [
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(70, 0, 7, 50),
                child: userInfo(Icons.person, currentUser.user.username),
              ),
              const SizedBox(
                width: 2,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 5, 50),
                child: Material(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(8),
                    child: InkWell(
                      onTap: () {
                        SignOutUser();
                      },
                      borderRadius: BorderRadius.circular(10),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                        child: Text(
                          'Deconnexion',
                          style: TextStyle(
                            color: Color.fromARGB(255, 30, 80, 121),
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Andalus',
                            fontSize: 16,
                          ),
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ],
        //lien de navigation Home_Corpus
        title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(150, 200, 150, 100),
            child: TextButton(
              onPressed: () {
                setState(() {
                  Get.to(() => const Corpus());
                });
              },
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) {
                    return const Color.fromARGB(255, 80, 139, 188);
                  }
                  return const Color.fromARGB(255, 11, 55, 91);
                }),
              ),
              child: const Text("Home",
                  style: TextStyle(
                    fontFamily: 'Andalus',
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 200, 0.3, 100),
            child: TextButton(
              onPressed: () {
                setState(() {
                  Get.to(() => const AjoutCorpus());
                });
              },
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) {
                    return const Color.fromARGB(255, 80, 139, 188);
                  }
                  return const Color.fromARGB(255, 11, 55, 91);
                }),
              ),
              child: const Text("Corpus",
                  style: TextStyle(
                    fontFamily: 'Andalus',
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(120, 200, 0, 100),
            child: DropdownButton(
              hint: const Text("Alimentation",
                  style: TextStyle(
                    fontFamily: 'Andalus',
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Color.fromARGB(255, 11, 55, 91),
                  )),
              value: valueChoose,
              onChanged: (newValue) {
                setState(() {
                  valueChoose = newValue;
                });
              },
              icon: Icon(Icons.keyboard_arrow_down),
              items: listItem.map((valueItem) {
                return DropdownMenuItem(
                  value: valueItem,
                  child: Text(valueItem),
                );
              }).toList(),
              onTap: () {},
            ),
          ),
        ]),
      ),
      body: const HomeAppercu(),
    );
  }
}
