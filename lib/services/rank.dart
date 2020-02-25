import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

StreamBuilder<QuerySnapshot> getRank() {
  return StreamBuilder<QuerySnapshot>(
    stream: Firestore.instance.collection('BoringApp').orderBy('count', descending: true).snapshots(),
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      if (!snapshot.hasData) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      final int rankCount = snapshot.data.documents.length;
      int i = 0 ;
      if (rankCount > 0) {
        return ListView.separated(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) {
              if (index >= 0) {
                i++;
                return ListTile(
                    leading: Container(
                      width: 200,
                      height: 80,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child:new ClipOval(
                                child: new SizedBox(
                                  width: 30.0,
                                  height: 30.0,
                                  child: new Image.network(
                                    snapshot.data.documents[index].data['photo'],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                                margin: const EdgeInsets.only(left: 20),
                                child: Text(
                                  snapshot.data.documents[index].data['name'],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                )
                            ),
                        ]
                      ),
                    ),
                    title: Text(
                      snapshot.data.documents[index].data['count'].toString(),
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                    ),
                  )
                );;
              }else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
            separatorBuilder: (context, index) => Divider(height: .0, color: Colors.white,)
         );
      } else {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    },
  );
}