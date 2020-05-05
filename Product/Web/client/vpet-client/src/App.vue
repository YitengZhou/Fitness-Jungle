<template>
  <div class="body">
    <el-container>
      <el-header>
        <el-menu :default-active="activeIndex" router="true" class="el-menu-demo" mode="horizontal" @select="handleSelect">
          <el-menu-item index="/">Profile</el-menu-item>
          <el-menu-item index="/pet">Pet</el-menu-item>
          <el-menu-item index="/friends">Friends</el-menu-item>
          <el-menu-item index="/map">Map</el-menu-item>
          <el-menu-item index="/login">Log in</el-menu-item>
          <el-menu-item index="/register">Register</el-menu-item>
        </el-menu>
      </el-header>
      <el-main>
        <router-view/>
      </el-main>
    </el-container>
  </div>
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
}

body {
  margin: 0;
  padding: 0;
  border: none;
}

.footer {
  background-color: dimgray;
  min-height: 100px;
}

</style>
