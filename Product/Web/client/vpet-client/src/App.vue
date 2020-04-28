<template>
<el-container class="bg-white">
  <el-header>
    <el-menu :default-active="activeIndex" router="true" class="el-menu-demo" mode="horizontal" @select="handleSelect">
      <el-menu-item index="/">Profile</el-menu-item>
      <el-menu-item index="/document">Pet</el-menu-item>
      <el-menu-item index="/createJob">Friends</el-menu-item>
      <el-menu-item index="/jobList">Map</el-menu-item>
    </el-menu>
  </el-header>
  <el-main>
    <router-view/>
  </el-main>
  <el-footer></el-footer>
</el-container>
</template>

<script>

export default {
  name: 'App',
  components: {
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
