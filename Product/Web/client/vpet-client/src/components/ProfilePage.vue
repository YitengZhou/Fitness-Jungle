<template>
  <div class="Profile">
    <p>{{ msg }}</p>
  </div>
</template>

<script>
export default {
  name: 'ProfilePage',
  props: {
  },
  data: function () {
    return {
      msg: "This is Profile page. "
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
