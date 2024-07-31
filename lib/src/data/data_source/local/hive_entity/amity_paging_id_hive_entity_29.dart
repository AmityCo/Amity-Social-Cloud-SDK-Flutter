import 'package:amity_sdk/src/data/data.dart';
import 'package:hive/hive.dart';

part 'amity_paging_id_hive_entity_29.g.dart';

/// Amity Paging Id Hive entity
@HiveType(typeId: 29)
class AmityPagingIdHiveEntity extends EkoObject {
  /// id
  String? id;

  /// Hash
  int? hash;

  /// Nonce
  int? nonce;

  /// position
  int? position;

  AmityPagingIdHiveEntity(
      {this.id,
      this.hash,
      this.nonce,
      this.position,
      });

  AmityPagingIdHiveEntity copyWith({
    String? id,
    int? hash,
    int? nonce,
    int? position,
  }) {
    return AmityPagingIdHiveEntity(
      id: id ?? this.id,
      hash: hash ?? this.hash,
      nonce: nonce ?? this.nonce,
      position: position ?? this.position,
    );
  }
  
  @override
  String? getId() {
    return id;
  }
}
