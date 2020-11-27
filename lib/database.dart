import 'package:mongo_dart/mongo_dart.dart';

void main() {
  print(mongo());
}

mongo() async {
  try {
    Db db = Db('mongodb://admin:admin@localhost:27017/test');
    DbCollection coll;
    await db.open();
    coll = db.collection("count");
    //print('conexao realizada com Banco $coll');
    Map<String, dynamic> val = await coll.findOne({'_id': 'total'});
    int qty = await val['qty'].toInt();
    //print(qty);

    print(qty);
    await db.close();
  } catch (err) {
    print('Erro no banco de dados: $err');
  }
}
