import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mongo_dart/mongo_dart.dart';

void main() {
  print(mongo2());
}

//void mongo1() => print('test');

 mongo(List<String>) async {
  try {
    Db db = Db('mongodb://admin:admin@localhost:27017/test');
    DbCollection coll;
    await db.open();
    coll = db.collection("count");
    //print('conexao realizada com Banco $coll');
    Map<String, dynamic> val = await coll.findOne({'_id': 'total'});
    int qty = await val['qty'].toInt();
    
    //print(qty);
    await db.close();
    return qty;
  } catch (err) {
    print('Erro no banco de dados: $err');
  }
}


