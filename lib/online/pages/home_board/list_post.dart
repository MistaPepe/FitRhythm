import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitrhythm/info_var.dart';
import 'package:flutter/material.dart';

class list_post extends StatefulWidget {
  const list_post({Key? key}) : super(key: key);

  @override
  State<list_post> createState() => _list_postState();
}

class _list_postState extends State<list_post> {
  final user = FirebaseAuth.instance.currentUser!;
  List<String> docIDs = [];
  final CollectionReference deProduct =
      FirebaseFirestore.instance.collection('post');

  Future getDocID() async {
    await FirebaseFirestore.instance
        .collection('post')
        .get()
        .then((snapshot) => snapshot.docs.forEach((document) {
              docIDs.add(document.reference.id);
            }));
  }

  Future removeDoc(String doc) async {
    String docc = doc;
    var email = false;
    final docRef = FirebaseFirestore.instance.collection("post").doc(doc);
    docRef.get().then(
          (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        if(email == false){
        if(data.containsValue(user.email!)){
          email = true;
          if(email == true){deProduct.doc(docc).delete();print('gumana');}
          print(email);
        }}
      },
      onError: (e) => print("Error getting document: $e"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => addPost()),
                  );
                },
                child: Text('Register a post')),
          ),
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
                              trailing: GestureDetector(
                                  onTap: () {
                                    removeDoc(docIDs[index]);
                                  },
                                  child: Icon(
                                    Icons.remove_circle_outline,
                                    color: Colors.red,
                                  )),
                              title: Row(
                                children: [
                                  get_desc(documentId: docIDs[index]),
                                  Expanded(
                                      child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                    child: get_time(documentId: docIDs[index]),
                                  )),
                                ],
                              ),
                              subtitle: Row(
                                children: [
                                  get_name(documentId: docIDs[index]),
                                  Expanded(
                                      child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                    child: get_role(documentId: docIDs[index]),
                                  )),
                                ],
                              ),
                              textColor: Colors.white,
                              tileColor: Colors.white10,
                            ),
                          );
                        });
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
    CollectionReference users = FirebaseFirestore.instance.collection('post');

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
    CollectionReference users = FirebaseFirestore.instance.collection('post');

    return FutureBuilder<DocumentSnapshot>(
        future: users.doc(documentId).get(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Text('Channel: ${data['room']}');
          }
          return Text('Pwease wait...');
        }));
  }
}

class get_desc extends StatelessWidget {
  final String documentId;

  get_desc({required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('post');

    return FutureBuilder<DocumentSnapshot>(
        future: users.doc(documentId).get(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Text('Title: ${data['description']}');
          }
          return Text('Pwease wait...');
        }));
  }
}

class get_time extends StatelessWidget {
  final String documentId;

  get_time({required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('post');

    return FutureBuilder<DocumentSnapshot>(
        future: users.doc(documentId).get(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Text('Date: ${data['date']}');
          }
          return Text('Pwease wait...');
        }));
  }
}

const List<String> list = <String>[
  'Room 1',
  'Room 2',
  'Room 3',
  'Room 4',
  'Room 5',
  'Room 6'
];

class addPost extends StatefulWidget {
  const addPost({Key? key}) : super(key: key);

  @override
  State<addPost> createState() => _addPostState();
}

class _addPostState extends State<addPost> {
  final user = FirebaseAuth.instance.currentUser!;
  final date = TextEditingController();
  final desc = TextEditingController();
  String room = '';
  String dropdownValue = list.first;

  @override
  void dispose() {
    date.dispose();
    desc.dispose();
    super.dispose();
  }

  Future signUp() async {
    addUserDetails(desc.text.trim(), date.text.trim(),
        user.email!, Personal_info.Fullname, room.trim());
  }

  Future addUserDetails(String desc, String date, String email,
      String name, String room) async {
    await FirebaseFirestore.instance.collection('post').add({
      'description': desc,
      'name': name,
      'date': date,
      'room': room,
      'email': email,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Register a post for a video conference',
                  style: TextStyle(
                    fontFamily: 'normFont',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Input your desired date and room channel.\n'
                  'Let others know what is in your mind in the description',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 13,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  'Date: DD-MM-YY : 00:00 AM/PM',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 13,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 0, 25, 25),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: TextField(
                        controller: date,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Date: DD-MM-YY : 00:00 AM/PM',
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                //password
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 0, 25, 25),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: TextField(
                        controller: desc,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Description/Title',
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DropdownButton<String>(
                      value: dropdownValue,
                      elevation: 16,
                      style: const TextStyle(
                          color: Colors.purpleAccent, fontSize: 15),
                      underline: Container(
                        height: 2,
                        color: Colors.white,
                      ),
                      onChanged: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          dropdownValue = value!;
                          room = dropdownValue;
                        });
                      },
                      items: list.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    GestureDetector(
                      onTap: () async {
                        addUserDetails(
                            desc.text.trim(),
                            date.text.trim(),
                            user.email!,
                            Personal_info.Fullname,
                            room.trim());
                        Navigator.pop(context);
                      },
                      child: Container(
                        child: Center(
                          child: Text('~ Post ~',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.yellowAccent,
                                fontSize: 20,
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 100,
                ),
                GestureDetector(
                  onTap: () async {
                    Navigator.pop(context);
                  },
                  child: Container(
                    child: Center(
                      child: Text('Go back',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20,
                          )),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
