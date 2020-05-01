public class UserInfo {
    //API CALL 1
    saveInfotoDB(JSONObject user) {
        if (user == null) {
            return;
        }else {
            saveJSONObject(user, "userInfo/" + user.getString("user_id") + ".json");
        }

    }

    
}