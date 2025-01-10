import 'package:amity_sdk/src/core/utils/amity_hive_type.dart';
import 'package:amity_sdk/src/data/data.dart';
import 'package:hive/hive.dart';

part 'paging_id_hive_entity_29.g.dart';

/// Paging Id Hive entity
@HiveType(typeId: AmityHiveType.pagingId)
class PagingIdHiveEntity extends EkoObject {
  /// id
  @HiveField(0)
  String? id;

  /// Hash
  @HiveField(1)
  int? hash;

  /// Nonce
  @HiveField(2)
  int? nonce;

  /// position
  @HiveField(3)
  int? position;

  PagingIdHiveEntity(
      {this.id,
      this.hash,
      this.nonce,
      this.position,
      });

  PagingIdHiveEntity copyWith({
    String? id,
    int? hash,
    int? nonce,
    int? position,
  }) {
    return PagingIdHiveEntity(
      id: id ?? this.id,
      hash: hash ?? this.hash,
      nonce: nonce ?? this.nonce,
      position: position ?? this.position,
    );
  }
  
  @override
  String? getId() {
    return "${nonce}_${hash}_$id";
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is PagingIdHiveEntity &&
      other.id == id &&
      other.hash == hash &&
      other.nonce == nonce &&
      other.position == position;
  }
}
