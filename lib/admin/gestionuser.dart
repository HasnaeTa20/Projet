import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:projet_pfe/admin/Modifieruser.dart';
import 'package:projet_pfe/controller/utilisateurController.dart';
import 'package:projet_pfe/models/utilisateur.dart';

import 'package:projet_pfe/user/Connexion.dart';
import 'package:shared_preferences/shared_preferences.dart';



class GestionUser extends StatefulWidget {
  const GestionUser({super.key});

  @override
  State<GestionUser> createState() => _GestionUserState();
}

class _GestionUserState extends State<GestionUser> {
  String role = "Admin";
  final contr = Get.put(UtilisateurControllerI());
  TextEditingController controller = TextEditingController();
  var filteredList = <UtilisateurI>[];
  var sortAscending = true;
  var sortColumnIndex = 0;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void updateFilteredList(String query) {
    setState(() {
      if (query.isNotEmpty) {
        filteredList = contr.utilisateurs
            .where((user) =>
                user.nom.toLowerCase().contains(query.toLowerCase()) ||
                user.prenom.toLowerCase().contains(query.toLowerCase()))
            .toList();
      } else {
        filteredList = contr.utilisateurs;
      }
    });
  }

  void sortData(int columnIndex) {
    if (columnIndex == sortColumnIndex) {
      setState(() {
        sortAscending = !sortAscending;
        contr.utilisateurs.value.sort((a, b) => a.nom.compareTo(b.nom));
        if (!sortAscending) {
          contr.utilisateurs.value = contr.utilisateurs.value.reversed.toList();
        }
      });
    } else {
      setState(() {
        sortColumnIndex = columnIndex;
        sortAscending = true;
        contr.utilisateurs.sort((a, b) => a.nom.compareTo(b.nom));
      });
    }
  }

  Future getRole() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      role = preferences.getString('role')!;
    });
  }

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
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.remove('role');
      {
        Get.off(const Connexion());
      }
    }
    Fluttertoast.showToast(
        msg: "Deconnexion avec succès",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.amber,
        textColor: Colors.white,
        fontSize: 16.0);
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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
            fit: BoxFit.cover,
          ),
        ),
        actions: [
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(70, 0, 7, 50),
                child: userInfo(Icons.person, role),
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

        //lien de navigation Home_Corpus_Alimentation
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
        ),
      ),
      body: Stack(children: <Widget>[


        SizedBox(height: 30,),
      
          
       
        Expanded(
          child: Obx(() {
            final user =
                controller.text.isNotEmpty ? filteredList : contr.utilisateurs;

            return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(50, 50, 50, 100),
                      child: DataTable(
                        columnSpacing: 150,
                        sortAscending: sortAscending,
                        sortColumnIndex: sortColumnIndex,
                        border: const TableBorder(
                          top: BorderSide(
                              width: 2,
                              color: Color.fromARGB(255, 128, 165, 210)),
                          bottom: BorderSide(
                              width: 2,
                              color: Color.fromARGB(255, 128, 165, 210)),
                          verticalInside: BorderSide(
                              width: 2,
                              color: Color.fromARGB(255, 128, 165, 210)),
                          right: BorderSide(
                              width: 2,
                              color: Color.fromARGB(255, 128, 165, 210)),
                          left: BorderSide(
                              width: 2,
                              color: Color.fromARGB(255, 128, 165, 210)),
                        ),
                        columns: [
                          DataColumn(
                            label: const Text(
                              "Nom",
                              style: TextStyle(
                                color: Color.fromARGB(255, 10, 41, 96),
                                fontSize: 20,
                                fontFamily: 'Andalus',
                              ),
                              textAlign: TextAlign.center,
                            ),
                            onSort: (columnIndex, _) {
                              sortData(columnIndex);
                            },
                          ),
                          const DataColumn(
                            label: Text(
                              "Prenom",
                              style: TextStyle(
                                color: Color.fromARGB(255, 10, 41, 96),
                                fontSize: 20,
                                fontFamily: 'Andalus',
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const DataColumn(
                            label: Text(
                              "Username",
                              style: TextStyle(
                                color: Color.fromARGB(255, 10, 41, 96),
                                fontSize: 20,
                                fontFamily: 'Andalus',
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const DataColumn(
                            label: Text(
                              "Email",
                              style: TextStyle(
                                color: Color.fromARGB(255, 10, 41, 96),
                                fontSize: 20,
                                fontFamily: 'Andalus',
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const DataColumn(
                            label: Text(
                              "Password",
                              style: TextStyle(
                                color: Color.fromARGB(255, 10, 41, 96),
                                fontSize: 20,
                                fontFamily: 'Andalus',
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const DataColumn(
                            label: Text(
                              "Role",
                              style: TextStyle(
                                color: Color.fromARGB(255, 10, 41, 96),
                                fontSize: 20,
                                fontFamily: 'Andalus',
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const DataColumn(
                            label: Text(
                              '',
                            ),
                          ),
                          const DataColumn(
                            label: Text(''),
                          ),
                        ],
                        rows: user
                            .map(
                              (users) => DataRow(cells: [
                                DataCell(
                                  Text(users.nom),
                                ),
                                DataCell(
                                  Text(users.prenom),
                                ),
                                DataCell(
                                  Text(users.username),
                                ),
                                DataCell(
                                  Text(users.email),
                                ),
                                DataCell(
                                  Text(users.password),
                                ),
                                DataCell(
                                  Text(users.role),
                                ),
                                DataCell(
                                  CircleAvatar(
                                    radius: 20,
                                    backgroundColor: const Color.fromARGB(
                                        255, 160, 248, 149),
                                    child: IconButton(
                                      icon: const Icon(Icons.edit,
                                          color: Colors.green),
                                      onPressed: () async {
                                        showDialog(
                                            context: context,
                                            builder: (context) => Dialog(
                                                  child: ModifierUseer(
                                                    user: users,
                                                  ),
                                                ));

                                        contr.nom.text = users.nom;
                                        contr.prenom.text = users.prenom;
                                        contr.username.text = users.username;
                                        contr.email.text = users.email;
                                        contr.password.text = users.password;
                                        contr.editroletext.text = users.role;

                                        contr.update();
                                      },
                                    ),
                                  ),
                                ),
                                DataCell(
                                  CircleAvatar(
                                    radius: 20,
                                    backgroundColor: const Color.fromARGB(
                                        255, 233, 163, 158),
                                    child: IconButton(
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                      onPressed: () async {
                                        contr.deleteUser(
                                            users.iduser.toString());
                                        contr.update();
                                      },
                                    ),
                                  ),
                                ),
                              ]),
                            )
                            .toList(),
                      ),
                    )));
          }),
          
        ),
        Container(
                        width: width/6,
                        height: 50,
                        color: const Color.fromRGBO(255, 255, 255, 1),   
                        child:
        TextFormField(
            controller:controller ,
            onChanged: updateFilteredList,
            cursorColor: Colors.white,
            style: const TextStyle(
                color: Color.fromARGB(255, 18, 31, 61),
                fontWeight: FontWeight.w300),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(top: 3, left: 9),
              prefixIcon: const Icon(
                Icons.search,
              ),
              hintText: "Rechercher Simple",
              hintStyle:
                  const TextStyle(color: Color.fromRGBO(191, 191, 192, 1)),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                      color: Color.fromRGBO(196, 216, 241, 1), width: 1)),
            ),
          ),
    )]),
    );
  }
}
