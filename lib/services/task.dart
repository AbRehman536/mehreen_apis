import 'package:http/http.dart' as http;
import 'package:mehreen_apis/models/taskListing.dart';

class TaskService{
  String baseURL = "https://todo-nu-plum-19.vercel.app/";
  ///Create Task
  ///Update Task
  ///Delete Task
  ///Get All Task
  ///Get Completed Task
  ///Get InCompleted Task
  ///Mark Task
  ///Filter Task
  Future<TaskListingModel> filterTask({
    required String token,
    required String startDate,
    required String endDate,
  })async{
    try{
      http.Response response =
      await http.get(
          Uri.parse("$baseURL/todos/filter?startDate=$startDate&endDate=$endDate&="),
          headers: {'Authorization' : token},
      );
      if(response.statusCode == 200 || response.statusCode == 201){
        return taskListingModelFromJson(response.body);
      }else{
        throw Exception("Something went wrong");
      }
    }catch(e){
      throw Exception(e.toString());
    }
  }
  ///Search Task
  Future<TaskListingModel> searchTask({
    required String token,
    required String searchTask,
  })async{
    try{
      http.Response response =
      await http.get(
        Uri.parse("$baseURL/todos/search?keywords=$searchTask"),
        headers: {'Authorization' : token},
      );
      if(response.statusCode == 200 || response.statusCode == 201){
        return taskListingModelFromJson(response.body);
      }else{
        throw Exception("Something went wrong");
      }
    }catch(e){
      throw Exception(e.toString());
    }
  }
}