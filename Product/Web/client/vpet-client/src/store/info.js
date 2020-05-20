import Vue from 'vue';
import Vuex from 'vuex';

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    userId: "admin",
    userName: "majyo",
    userPassword: "12345",
    currentSteps: 50,
    level: 5,
    stepsToNextLevel: 100,
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
  }
})
