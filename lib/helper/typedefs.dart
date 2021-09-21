import 'package:cloud_firestore/cloud_firestore.dart';

typedef JSON = Map<String, Object?>;
typedef QueryParams = Map<String, String>;
typedef QueryBuilder = Query<JSON>? Function(Query<JSON> query)?;
typedef SnapshotBuilder<T> = T Function(JSON? data, String documentID);
typedef Sorter<T> = int Function(T lhs, T rhs)?;