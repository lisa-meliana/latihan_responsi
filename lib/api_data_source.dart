import 'base_network.dart';

class ApiDataSource{
  static ApiDataSource instance = ApiDataSource();

  Future<List<dynamic>> loadCharacters(){
    return BaseNetwork.getList("characters");
  }

  Future<Map<String, dynamic>> loadDetailCharacters({required String name}){
    return BaseNetwork.get("characters/$name");
  }

  Future<List<dynamic>> loadNations(){
    return BaseNetwork.getList("nations");
  }

  Future<Map<String, dynamic>> loadDetailNations({required String name}){
    return BaseNetwork.get("nations/$name");
  }

  Future<List<dynamic>> loadWeapons(){
    return BaseNetwork.getList("weapons");
  }

  Future<Map<String, dynamic>> loadDetailWeapons({required String name}){
    return BaseNetwork.get("weapons/$name");
  }

  Future<List<dynamic>> loadElements(){
    return BaseNetwork.getList("elements");
  }

  Future<Map<String, dynamic>> loadDetailElements({required String name}){
    return BaseNetwork.get("elements/$name");
  }

  }