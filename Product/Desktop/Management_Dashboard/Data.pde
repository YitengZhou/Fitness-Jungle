
static abstract class Response {
    static final String[] LIST = {
        Response.LOGIN,
        Response.GETUSERLIST,
        Response.GETUSERDETAILED,
        Response.GETUSERSTEPSINTERVAL
    };
    static final String LOGIN = "/login";
    static final String GETUSERLIST = "/getUserList";
    static final String GETUSERDETAILED = "/getUserDetailed";
    static final String GETUSERSTEPSINTERVAL = "/getUserStepsInterval";
}


public class Database {
    JSONObject listofUsers = new JSONObject(); 
    JSONObject users = new JSONObject();
    JSONObject pets = new JSONObject();
}

void loadDummyData() {   
    JSONObject json;
    json = loadJSONObject("test.json");
    if(json != null) {
        db.listofUsers = json;
        println("loaded dummy");
        println(db.listofUsers.toString());
    }  
  
}

//copy any JSON object on disk into working memory
void refreshData() {
    String del = "/data";
    String current = dataPath("").replace(del,"");
    File[] files = listFiles(new File(current));
    JSONObject json;
    for (int i = 0; i < files.length; i++) {
      File f = files[i];
      String path = f.getAbsolutePath();
      if (path.toLowerCase().equals("list.json")) {
        json = loadJSONObject(path);
        if (json != null) {
          db.listofUsers = json;
        }
      } 
    }
  }


public class UserInfo {
    //API CALL 1
    void saveInfotoDB(JSONObject user) {
        if (user == null) {
            return;
        }else {
            saveJSONObject(user, "userInfo/" + user.getString("user_id") + ".json");
        }

    }

    //API CALL 2
    void saveListtoDB(JSONObject list) {
        if (list == null) {
            return;
        }else{
            saveJSONObject(list, "list.json");
        }
    }

    //API CALL 3
    JSONObject getUserinfo(String user_id) {
        JSONObject returnObj = new JSONObject();
        JSONArray users = new JSONArray();
        users = db.users.getJSONArray("users");
        if (users != null) {
            for (int i = 0; i < users.size(); i++) {
                JSONObject user = users.getJSONObject(i);
                if (user != null) {
                    if(user_id.equals(user.getString("user_id"))) {
                        returnObj = user;
                    }
                }
            }
        }    
        return returnObj;
    }

    //API CALL 4
    JSONObject[] getListOfUsers(JSONObject obj) {
        //JSONObject obj = loadJSONObject("test.json");
        JSONArray values = obj.getJSONArray("users"); 
        JSONObject[] returnJSONArray = new JSONObject[0];
        for (int i = 0; i < values.size(); i++) {
                JSONObject username = values.getJSONObject(i);            
                if(username != null) {
                        String name = username.getString("firstName");
                        println(name);
                        returnJSONArray = (JSONObject []) append(returnJSONArray, username);
                }
          }
        return returnJSONArray;
    }
   
}
