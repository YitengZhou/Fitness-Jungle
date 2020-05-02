public class Database { 
    JSONObject users = new JSONObject();
    JSONObject pets = new JSONObject();
}

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
        
        return returnObj;
    }


}
