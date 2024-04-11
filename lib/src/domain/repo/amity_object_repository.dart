import 'dart:async';

import 'package:amity_sdk/src/core/error/entity_expired_exception.dart';
import 'package:amity_sdk/src/core/error/entity_not_found_exception.dart';
import 'package:amity_sdk/src/core/utils/model_mapper.dart';
import 'package:amity_sdk/src/data/data_source/data_source.dart';

abstract class AmityObjectRepository<Entity extends EkoObject, PublicModel> {
  static const DEFAULT_PAGE_SIZE = 20;

  // Override this method to return true if the object type is a child object
  // which doesn't have direct api to get the up-to-date data
  bool isChildObjectType() {
    return false;
  }

  Future<PublicModel?> fetchAndSave(String objectId);

  Future<Entity?> queryFromCache(String objectId);

  ModelMapper<Entity, PublicModel> mapper();

  StreamController<Entity> observeFromCache(String objectId);

  StreamController<PublicModel> observe(String objectId) {
    final streamController = StreamController<PublicModel>();

    observeFromCache(objectId).stream.listen((event) {
      streamController.add(mapper().map(event));
    });

    return streamController;
  }

  Future<Entity?> getEntity(String objectId) async {
    var object = await queryFromCache(objectId);
    if (object != null) {
      return object;
    } else {
      throw EntityNotFoundException();
    }

    // queryFromCache(objectId).then((value) {
    //   if(value !=null){
    //     return value;
    //   }else{

    //   }

    // }).onError((error, stackTrace){
    //   throw error ?? "";
    // });
  }

  Future<PublicModel?> obtain(String objectId) async {
    try {
      var object = await getEntity(objectId);
      if (object != null) {
        var entity = object as EkoObject;
        bool isNotExpired =
            entity.getExpiresAt()?.isAfter(DateTime.now()) == true;

        // Wouldn't check child object expiration because
        // it doesn't have direct api to get the up-to-date data
        if (isNotExpired || isChildObjectType()) {
          return mapper().map(object);
        } else {
          throw EntityExpiredException();
        }
      }
    } catch (error) {
      var errorStr = error.toString();
      if (errorStr == EntityExpiredException().message || errorStr == EntityNotFoundException().message) {
        fetchAndSave(objectId).then((value) {
          getEntity(objectId)
          .then((object) {
            if (object != null) { 
              return mapper().map(object); 
            }
          });
        }).onError((error, stackTrace) {
          throw error ?? "";
        });
      }
    }

    // getEntity(objectId).then((value) {
    //   var entity = value as EkoObject;
    //   bool isNotExpired = entity.getExpiresAt()?.isAfter(DateTime.now()) == true;
    //   if (isNotExpired) {
    //       return mapper().map(value);
    //   }else{
    //     Future.error(EntityExpiredException());
    //   }
    // },).catchError((error){
    //   if (error == EntityExpiredException || error == EntityNotFoundException) {
    //       fetchAndSave(objectId).then((value){
    //         obtain(objectId);
    //       }).onError((error, stackTrace){
    //         throw error?? "";
    //       });
    //    }else{
    //     throw error;
    //    }
    // })
    // .onError((error, stackTrace) {
    //   if(error!=null){
    //     if (error == EntityExpiredException || error == EntityNotFoundException) {
    //       fetchAndSave(objectId).then((value){
    //         obtain(objectId);
    //       }).onError((error, stackTrace){
    //         throw error?? "";
    //       });
    //    }else{
    //     throw error;
    //    }
    //   }else{
    //     throw "";
    //   }
    // },);
  }
}
