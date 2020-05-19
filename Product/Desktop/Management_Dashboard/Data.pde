
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
      if (path.toLowerCase().endsWith("list.json")) {
        json = loadJSONObject(path);
        if (json != null) {
          println("found file");
          db.listofUsers = json;
        }
      } 
    }
  }
  
  
public class List {

    //API CALL 1
    void saveListtoDB(JSONObject list) {
        if (list == null) {
            return;
        }else{
            saveJSONObject(list, "list.json");
        }
    }

    //API CALL 2
    JSONObject[] getListOfUsers(JSONObject obj) {
        //JSONObject obj = loadJSONObject("test.json");
        JSONArray values = obj.getJSONArray("users"); 
        JSONObject[] returnJSONArray = new JSONObject[0];
        for (int i = 0; i < values.size(); i++) {
                JSONObject username = values.getJSONObject(i);            
                if(username != null) {                      
                        returnJSONArray = (JSONObject []) append(returnJSONArray, username);
                }
          }
        return returnJSONArray;
    }    


}  


public class User {
    //API CALL 1
    void saveInfotoDB(JSONObject user) {
        if (user == null) {
            return;
        }else {
            saveJSONObject(user, "user.json");
            println("saved userinfo to DB");
        }
    }


    //API CALL 2
    JSONObject getUserinfo1(String user_id) {
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

    //API CALL 3
    void getUserInfo(JSONObject user) {
        JSONObject userinfo = new JSONObject();
        JSONArray pets = new JSONArray();

        //extracting infomation form JSONObject
        userinfo.setInt("userId", user.getInt("userId"));
        userinfo.setString("email", user.getString("email"));
        userinfo.setString("firstName", user.getString("firstName"));
        userinfo.setString("lastName", user.getString("lastName"));
        userinfo.setString("imageUrl", user.getString("imageUrl"));
        userinfo.setString("deviceNo", user.getString("deviceNo"));

        pets = user.getJSONArray("pets");

        if(pets != null) {
            println("JSONARRAY NOT NULL");
            for(int i = 0; i < pets.size(); i++) {
                JSONObject pet = pets.getJSONObject(i);
                if(pet != null && pet.getBoolean("active")) {
                    userinfo.setString("petName", pet.getString("name"));
                    userinfo.setInt("petLevel", pet.getInt("level"));
                }
            }
        }
        saveInfotoDB(userinfo);
    }
   
}
