import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:sevr/sevr.dart';

void main() {
  print(mongo());
}

//void mongo1() => print('test');

mongo() async {
  try {
    Db db = Db('mongodb://admin:admin@localhost:27017/test');
    DbCollection coll;
    await db.open();
    coll = db.collection("count");
    final serv = Sevr();

    serv.get('/', [
      (ServRequest req, ServResponse res) async {
        final contacts = await coll.find().toList();
        return res.status(200);
      }
    ]);

    //print(qty);
    await db.close();
  } catch (err) {
    print('Erro no banco de dados: $err');
  }
}
