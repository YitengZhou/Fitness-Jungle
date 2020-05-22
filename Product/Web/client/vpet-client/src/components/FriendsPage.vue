<template>
  <div class="Profile">
    <p>test</p>
    <Friend v-for="friend in friendList" v-bind:key="friend.friendId" v-bind:friendInfo="friend"></Friend>
  </div>
</template>

<script>
import Friend from './friends/Friend';

export default {
  name: 'FriendsPage',
  components: {
    Friend
  },
  props: {
  },
  data: function () {
    return {
      msg: "This is Friends page. "
    }
  },
  computed: {
    friendList: function () {
      return this.$store.state.friends;
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
