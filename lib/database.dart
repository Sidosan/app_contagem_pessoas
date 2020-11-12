import 'package:mongo_dart/mongo_dart.dart';

mongo(List<String> arguments) async {
  Db db = Db('mongodb://admin:admin@localhost:27017/test');

  DbCollection coll;

  await db.open();
  coll = db.collection("count");
  print('conexao realizada com Banco $coll');
  var val = await coll.findOne({'_id': 'total'});

  int qty = val['qty'].toInt();

  await db.close();

  return qty;
}
