import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class list_accounts extends StatefulWidget {
  const list_accounts({Key? key}) : super(key: key);

  @override
  State<list_accounts> createState() => _list_accountsState();
}

class _list_accountsState extends State<list_accounts> {
  List<String> docIDs = [];

  Future getDocID() async {
    await FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((snapshot) => snapshot.docs.forEach((document) {
              docIDs.add(document.reference.id);
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: FutureBuilder(
                  future: getDocID(),
                  builder: (context, snapshot) {
                    return ListView.builder(
                        itemCount: docIDs.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              title: get_name(documentId: docIDs[index]),
                              subtitle: get_role(documentId: docIDs[index]),
                              textColor: Colors.white,
                              tileColor: Colors.white10,
                            ),
                          );
                        }
                        );
                  }))
        ],
      ),
    );
  }
}

class get_name extends StatelessWidget {
  final String documentId;

  get_name({required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
        builder: ((context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        Map<String, dynamic> data =
            snapshot.data!.data() as Map<String, dynamic>;
        return Text('Name: ${data['name']}');
      }
      return Text('Pwease wait...');
    }));
  }
}

class get_role extends StatelessWidget {
  final String documentId;

  get_role({required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return FutureBuilder<DocumentSnapshot>(
        future: users.doc(documentId).get(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
            snapshot.data!.data() as Map<String, dynamic>;
            return Text('Role: ${data['role']}');
          }
          return Text('Pwease wait...');
        }));
  }
}
