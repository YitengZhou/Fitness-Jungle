<template>
  <div class="Profile">
    <p>{{ msg }}</p>
  </div>
</template>

<script>
export default {
  name: 'MapPage',
  props: {
  },
  data: function () {
    return {
      msg: "This is Map page. "
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
