class FirestorePath{

  /// Path to a collection of conversations of a user.
  static String conversations(String uid) => 'users/$uid/conversations';

  /// Path to a single conversation of a user, represented by a number.
  static String conversation(String uid,String number) => 'users/$uid/conversations/$number';

  /// Path to a collection of groups of a user.
  static String groups(String uid) => 'users/$uid/groups';

  /// Path to a single group of a user, represented by a groupID.
  static String group(String uid, String groupID) => 'users/$uid/groups/$groupID';

  /// Path to a collection of contacts of a user.
  static String contacts(String uid) => 'users/$uid/contacts';

  /// Path to a single contact of a user, represented by a number.
  static String contact(String uid,String number) => 'users/$uid/contacts/$number';

  /// Path to a single user, represented by a number.
  static String user(String uid) => 'users/$uid';
}