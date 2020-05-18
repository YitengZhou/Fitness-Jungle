public class Database {
    JSONObject listofUsers = new JSONObject(); 
    JSONObject users = new JSONObject();
    JSONObject pets = new JSONObject();
}

//copy any JSON object on disk into working memory
void refreshData() {
    File dir;
    File[] files;
    dir = new File(dataPath(""));
    files = dir.listFiles();
    JSONObject json;
    for (int i = 0; i < files.length; i++) {
        String path = files[i].getAbsolutePath();
        if (path.toLowerCase().equals("users.json")) {
            json = loadJSONObject(path);
            if (json != null) {
                db.users = json;
            }
        }
        if(path.toLowerCase().equals("pets.json")) {
            json = loadJSONObject(path);
            if(json != null) {
                db.pets = json;
            }
        }
    }
}

public class listofUsers {

    void saveListtoDB(JSONObject list) {
        
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

    //API CALL 3
    JSONObject[] getListOfUsers() {
        JSONObject obj = loadJSONObject("test.json");
        JSONArray values = obj.getJSONArray("users"); 
        JSONObject[] returnJSONArray = new JSONObject[0];
        for (int i = 0; i < values.size(); i++) {
                JSONObject username = values.getJSONObject(i);            
                if(username != null) {
                        String name = username.getString("user_name");
                        println(name);
                        returnJSONArray = (JSONObject []) append(returnJSONArray, username);
                }
          }
        return returnJSONArray;
    }
   
}
