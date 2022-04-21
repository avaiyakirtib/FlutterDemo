import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:practicaltest/services/service_url.dart';
import 'package:practicaltest/view/updateProfileScreeen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Addcontact.dart';

class Contactlist extends StatefulWidget {
  const Contactlist({Key? key}) : super(key: key);

  @override
  _ContactlistState createState() => _ContactlistState();
}

class _ContactlistState extends State<Contactlist> {
  var email;
  @override
  void initState() {
    // TODO: implement initState
    getInitialData();
    super.initState();
  }

  getInitialData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      email = prefs.getString("email");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text("Contactlist"),
          actions: [
            Container(
              width: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Addcontact()));
                    },
                    child: Container(
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: const Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Icon(
                            Icons.add,
                            color: Colors.black,
                          ),
                        )),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Homescreen()));
                    },
                    child: Container(
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: const Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Icon(
                            Icons.person,
                            color: Colors.black,
                          ),
                        )),
                  )
                ],
              ),
            )
          ],
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('user')
                .doc(email)
                .collection("usercontact")
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              var docs = snapshot.data?.docs;
              return docs != null && docs.length != 0
                  ? ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: docs?.length,
                      itemBuilder: (context, index) {
                        return Card(
                            child: ListTile(
                          title: Text(docs![index]["name"]),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(docs[index]["mobilenumber"]),
                              Text(docs[index]["emailid"]),
                            ],
                          ),
                          leading: IconButton(
                              icon: const Icon(
                                Icons.person,
                                // using the index of listViewBuilder
                              ),
                              tooltip: 'Add to Favorite',
                              onPressed: () {
                                setState(() {});
                              }),
                          trailing: InkWell(
                              onTap:(){
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text("Practical Test"),
                                        content: const Text("Are you sure to delete this contact?"),
                                        actions: <Widget>[
                                          FlatButton(
                                            child: const Text("Yes"),
                                            onPressed: () {
                                              FirebaseFirestore.instance
                                                  .collection('user')
                                                  .doc(email)
                                                  .collection("usercontact")
                                                  .where("emailid", isEqualTo : docs[index]["emailid"])
                                                  .get().then((value){
                                                value.docs.forEach((element) {
                                                  FirebaseFirestore.instance
                                                      .collection('user')
                                                      .doc(email)
                                                      .collection("usercontact").doc(element.id).delete().then((value){
                                                    AppURLs.showSnackBar("Success!",context,Colors.red);
                                                  });
                                                });
                                              });
                                              Navigator.pop(context);
                                            },
                                          ),
                                          FlatButton(
                                            child:const Text("No"),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          )
                                        ],
                                      );
                                    }
                                );
                                },child: const Icon(Icons.delete)),
                          //same over here
                        ));
                      },
                    )
                  : const Center(child: Text("No Contacts Found!"),);
            }));
  }
}
