<template>
  <div class="Profile">
    <p>{{ msg }}</p>
  </div>
</template>

<script>
export default {
  name: 'FriendsPage',
  props: {
  },
  data: function () {
    return {
      msg: "This is Friends page. "
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
