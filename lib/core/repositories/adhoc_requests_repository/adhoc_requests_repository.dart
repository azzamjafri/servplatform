import 'package:servplatform/core/models/adhoc_request/adhoc_request.dart';

abstract class AdhocRequestsRepository {
  Future<List<AdhocRequest>> fetchAdhocRequests();
  Future addAdhocRequest(AdhocRequest data);
  Future updatedhocRequests(AdhocRequest data, String id) ;
  Future removeAdhocRequests(String id);
  Future<AdhocRequest> getAdhocRequestsById(String id);

  
  
}
