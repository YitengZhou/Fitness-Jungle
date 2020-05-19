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
    JSONObject listjson = loadJSONObject("Dummy/dummyList.json");
    JSONObject userjson = loadJSONObject("Dummy/dummyUser.json");
    if(listjson != null) {
        db.listofUsers = listjson;
        println("loaded dummy list");
    }
    if(userjson != null) {
        db.users = userjson;
        println("loaded dummy user");
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
          println("found list file");
          db.listofUsers = json;
        }
      }
      else if (path.toLowerCase().endsWith("user.json")) {
        json = loadJSONObject(path);
        if (json != null) {
          println("found user file");
          db.users = json;
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
        }
    }

    //API CALL 2
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
        userinfo.setInt("totalStepCount", user.getInt("totalStepCount"));

        pets = user.getJSONArray("pets");

        if(pets != null) {
            for(int i = 0; i < pets.size(); i++) {
                JSONObject pet = pets.getJSONObject(i);
                if(pet != null && pet.getBoolean("active")) {
                    userinfo.setString("petName", pet.getString("name"));
                    userinfo.setInt("petLevel", pet.getInt("level"));
                    userinfo.setString("petSkin", pet.getString("skin"));
                }
            }
        }

        println(userinfo.toString());

        saveInfotoDB(userinfo);
    }
   
}

public class Steps {
    //API CALL 1
    void saveStepstoDB(JSONObject steps) {
        if (steps == null) {
            return;
        }else {
            saveJSONObject(steps, "steps.json");
        }
    }

    //API CALL 2
    String getActivityLevel(int weekly_steps) {
        if(weekly_steps >= 70000) {
            return "High";
        }
        else if (weekly_steps > 35000 && weekly_steps < 70000) {
            return "Medium";
        }
        else{
            return "Low";
        }
    }
    
    //API CALL 3
    void createStepRequest() {
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        String todayDate = df.format(new Date());
        String intervalFrom = todayDate + " 00:00:00";
        String intervalTo = todayDate + " 23:59:59";

        JSONObject obj = new JSONObject();
        JSONObject req = new JSONObject();
        JSONObject body = new JSONObject();

        body.setInt("adminId", 1);
        body.setInt("userId", 1);
        body.setString("intervalFrom", intervalFrom);
        body.setString("intervalTo", intervalTo);

        req.setString("header", Response.GETUSERSTEPSINTERVAL);
        req.setJSONObject("body", body);

        obj.setString("from", "desktop_1");
        obj.setString("to", "server");
        obj.setJSONObject("request", req);

        saveJSONObject(obj, "Request/getStepsIntervalReq.json");

    }

}
