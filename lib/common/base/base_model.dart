class BaseModel {

  BaseModel();

  BaseModel.fromJson(Map<String, dynamic> json);

  @override
  Map getParams() {
    return {};
  }

}