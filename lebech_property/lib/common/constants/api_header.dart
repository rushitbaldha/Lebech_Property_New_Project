
import '../user_details/user_details.dart';

class ApiHeader {

  Map<String, String> headers = <String,String> {
    'Content-Type': 'application/json',
    'Authorization': "Bearer ${UserDetails.userToken}"

  };

  Map<String, String> sellerHeader = <String,String> {
    'Content-Type': 'application/json',
     'Authorization': "Bearer ${UserDetails.userToken}"
    //'Authorization': "Bearer 85|nE54BkonvXUdxxTyZKT8KVXz0rYkaD8EokJjZzKv"
  };

}

// 'Content-Type': 'application/json',