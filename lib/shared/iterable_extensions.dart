import 'dart:collection';

/// dividir un array en "chunks"
///
extension ListExtension<E> on List<E>{

  List<List<E>> chunk(int chunkSize){
    if(length<=0){
      return [];
    }else if(length <= chunkSize){
      return [this];
    }

    List<List<E>> result = [];
    int cont = 0;
    for(int i = 0; i<length/chunkSize; i++){
      cont = i*chunkSize;
      if((cont+chunkSize) >= length){
        result.add(sublist(cont,length));
      }else{
        result.add(sublist(cont,cont+chunkSize));
      }
    }

    return result;

  } 

}