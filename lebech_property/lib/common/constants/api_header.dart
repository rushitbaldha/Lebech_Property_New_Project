
import '../user_details/user_details.dart';

class ApiHeader {

  Map<String, String> headers = <String,String> {
    'Content-Type': 'application/json',
    'Authorization': "Bearer ${UserDetails.userToken}"

  };

}