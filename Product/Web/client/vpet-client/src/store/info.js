import Vue from 'vue';
import Vuex from 'vuex';

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    userId: 0,
    userEmail: "test@test.com",
    userName: "majyo",
    userImg: "",
    userPassword: "12345",
    devicesNumber: "0",
    currentSteps: 50,
    level: 5,
    stepsToNextLevel: 100,
    petId: 1,
    petName: "Neko",
    petType: "Cactus",
    skinId: 1,
    skinName: "None",
    friends: [
      {
        friendId: 1,
        friendName: "Dave",
        friendSteps: 100
      },
      {
        friendId: 2,
        friendName: "Sophie",
        friendSteps: 78
      },
      {
        friendId: 3,
        friendName: "Alice",
        friendSteps: 55
      },
      {
        friendId: 4,
        friendName: "Niko",
        friendSteps: 17
      }
    ],
      newFriend: {
        friendId: 0,
        friendName: "Default",
        friendSteps: 0
      }
  },
  mutations: {
    setUser(state, data) {
      state.userId = data.userId;
      state.userName = data.firstName + data.lastName;
      state.userImg = data.imageUrl;
    },
    setUserData(state, data) {
      state.userName = data.firstName + data.lastName;
      state.userImg = data.imageUrl;
      state.devicesNumber = data.deviceNo;
      state.currentSteps = data.totalStepCount;
    },
    setPetData(state, data) {
      state.petId = data.petId;
      state.petName = data.name;
      state.level = data.level;
      state.petType = data.type;
      state.skinId = data.skinId;
      state.skinName = data.skinName;
      state.currentSteps = data.stepCount;
      state.stepsToNextLevel = data.stepsToNextLevel;
    }
  }
})
