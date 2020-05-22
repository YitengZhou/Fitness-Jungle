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
    int totalSteps;
    float[] weekly;
    float[] daily = new float[8];
    JSONObject listofUsers = new JSONObject(); 
    JSONObject users = new JSONObject();
    JSONObject steps = new JSONObject();
    JSONObject pets = new JSONObject();    
}

//load dummy data for initial startup
void loadDummyData() {   
    JSONObject listjson = loadJSONObject("Dummy/dummyList.json");
    JSONObject userjson = loadJSONObject("Dummy/dummyUser.json");

    String del = "/data";
    String current = dataPath("").replace(del,"");
    File[] files = listFiles(new File(current));

    for (int i = 0; i < files.length; i++) {
      File f = files[i];
      String path = f.getAbsolutePath();
      if (path.toLowerCase().endsWith("list.json")) {
       f.delete();
      }
      else if (path.toLowerCase().endsWith("user.json")) {
        f.delete();
      } 
    }
    if(listjson != null) {
        db.listofUsers = listjson;
        println("loaded dummy list");
    }
    if(userjson != null) {
        db.users = userjson;
        println("loaded dummy user");
    }
    steps_api.getStepsInterval(loadJSONObject("Dummy/dummyDaily.json"));
    println("loaded dummy daily data");  

    db.weekly = new float[] {500, 378, 200, 250, 300, 350, 800};
    println("loaded dummy weekly data");
  
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
  
//class that deals with all api call to do with dropdown list
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

    //API CALL 3
    int getUserId(String username) {
        JSONObject obj = db.listofUsers;
        JSONArray users = obj.getJSONArray("users");

        for(int i = 0; i < users.size(); i++) {
            JSONObject user = users.getJSONObject(i);
            if(user != null) {
                if(user.getString("email").equals(username)) {
                    return user.getInt("userId");
                }
            }
        }
        //can't find username    
        return 0;
    }   
}  

//class that deals with all users information
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
    void createUserRequest(int userId) {
        JSONObject obj = new JSONObject();
        JSONObject req = new JSONObject();
        JSONObject body = new JSONObject();

        body.setInt("userId", userId);
        body.setInt("adminId", 1);

        req.setString("header", Response.GETUSERDETAILED);
        req.setJSONObject("body", body);

        obj.setString("from", "desktop_1");
        obj.setString("to", "server");
        obj.setJSONObject("request", req);

        saveJSONObject(obj, "Request/getDetailedUserReq.json");
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

        saveInfotoDB(userinfo);
    }
   
}

//class that deals with getting all the steps data for user
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
    String getActivityLevel(int daily_steps) {
        if(daily_steps >= 10000) {
            return "High";
        }
        else if (daily_steps > 5000 && daily_steps < 10000) {
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
        body.setInt("userId", db.users.getInt("userId"));
        body.setString("intervalFrom", intervalFrom);
        body.setString("intervalTo", intervalTo);

        req.setString("header", Response.GETUSERSTEPSINTERVAL);
        req.setJSONObject("body", body);

        obj.setString("from", "desktop_1");
        obj.setString("to", "server");
        obj.setJSONObject("request", req);

        saveJSONObject(obj, "Request/getStepsIntervalReq.json");
    }

    //API CALL 4
    void getStepsInterval(JSONObject obj) {

        //println(obj.toString());

        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        String todayDate = df.format(new Date());
        JSONArray stepInterval = obj.getJSONArray("steps");
        int totalstep = 0;

        //clear out float array
        for(int i = 0; i < db.daily.length; i++) {
            db.daily[i] = 0;
        }

        for(int i = 0; i < stepInterval.size(); i++) {
            JSONObject data = stepInterval.getJSONObject(i);
            String timestamp = data.getString("timestamp");
            totalstep += data.getInt("count");
            if(timestamp.equals(todayDate + " 00:00:00") || timestamp.equals(todayDate + " 01:00:00") || 
                timestamp.equals(todayDate + " 02:00:00")) {
                    db.daily[0] += data.getInt("count"); 
                }
            else if(timestamp.equals(todayDate + " 03:00:00") || timestamp.equals(todayDate + " 04:00:00") || 
                timestamp.equals(todayDate + " 05:00:00")) {
                    db.daily[1] += data.getInt("count"); 
                }
            else if(timestamp.equals(todayDate + " 06:00:00") || timestamp.equals(todayDate + " 07:00:00") || 
                timestamp.equals(todayDate + " 08:00:00")) {
                    db.daily[2] += data.getInt("count"); 
                }
            else if(timestamp.equals(todayDate + " 09:00:00") || timestamp.equals(todayDate + " 10:00:00") || 
                timestamp.equals(todayDate + " 11:00:00")) {
                    db.daily[3] += data.getInt("count"); 
                }
            else if(timestamp.equals(todayDate + " 12:00:00") || timestamp.equals(todayDate + " 13:00:00") || 
                timestamp.equals(todayDate + " 14:00:00")) {
                    db.daily[4] += data.getInt("count"); 
                }
            else if(timestamp.equals(todayDate + " 15:00:00") || timestamp.equals(todayDate + " 16:00:00") || 
                timestamp.equals(todayDate + " 17:00:00")) {
                    db.daily[5] += data.getInt("count"); 
                }
            else if(timestamp.equals(todayDate + " 18:00:00") || timestamp.equals(todayDate + " 19:00:00") || 
                timestamp.equals(todayDate + " 20:00:00")) {
                    db.daily[6] += data.getInt("count"); 
                }
            else if(timestamp.equals(todayDate + " 21:00:00") || timestamp.equals(todayDate + " 22:00:00") || 
                timestamp.equals(todayDate + " 23:00:00")) {
                    db.daily[7] += data.getInt("count"); 
                }
        }
        db.totalSteps = totalstep;
    }

    //API CALL 5
    int getAvgsteps (int weekly_step) {
        return weekly_step/7;
    }


}
