<template>
  <div class="Profile">
    <el-row type="flex" justify="center">
      <el-col :span="12">
        <el-row type="flex" justify="space-between" class="profile-block">
          <el-col :span="10">
            <el-card class="img-card">
              <img src="@/assets/neko.png" class="pet-img">
            </el-card>
          </el-col>
          <el-col :span="10">
            <p class="status">User Name: majyo</p>
            <p class="status">User Id: majyo</p>
            <p class="status">Today Steps: 25</p>
            <p class="status">Total Steps: 456</p>
          </el-col>
        </el-row>
        <el-row type="flex" justify="space-between">
          <el-col :span="24">
            <el-tabs v-model="chartType" type="border-card">
              <el-tab-pane label="Monthly Steps" name="monthly">Insert monthly step chart here</el-tab-pane>
              <el-tab-pane label="Yearly Steps" name="yearly">Insert yearly step chart here</el-tab-pane>
            </el-tabs>
          </el-col>
        </el-row>
      </el-col>
    </el-row>
  </div>
</template>

<script>
export default {
  name: 'ProfilePage',
  props: {
  },
  data: function () {
    return {
      msg: "This is Profile page. ",
      chartType: "monthly"
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.pet-img {
  width: 100%;
  display: block;
}

.status {
  font-size: 30px;
}

.progress {
  margin-bottom: 60px;
}

.card-info {
  text-align: center;
}

.img-block {
  min-height: 120px;
}

.profile-block {
  margin-bottom: 50px;
}
</style>
