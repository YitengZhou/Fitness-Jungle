<template>
  <div class="pet">
    <el-row type="flex" justify="center">
      <el-col :span="12">
        <el-row type="flex" justify="space-between">
          <el-col :span="10">
            <el-card class="img-card">
              <img src="@/assets/neko.png" class="pet-img">
            </el-card>
          </el-col>
          <el-col :span="10">
            <p class="status">Pet Name: neko</p>
            <p class="status">Owner: arisu</p>
            <p class="status">Level: 5</p>
            <p class="status">Skin: cat</p>
          </el-col>
        </el-row>
        <el-row type="flex" justify="start">
          <el-col :span="24">
            <p class="status">EXP: 500 / 1000</p>
          </el-col>
        </el-row>
        <el-row class="progress" type="flex" justify="center">
          <el-col :span="24">
            <el-progress :stroke-width="24" :text-inside="true" :percentage="50"></el-progress>
          </el-col>
        </el-row>
        <el-row type="flex" justify="space-between">
          <el-col :span="4">
            <el-card>
              <div class="img-block"><img src="@/assets/neko.png" class="pet-img"></div>
              <p class="card-info">cat</p>
            </el-card>
          </el-col>
          <el-col :span="4">
            <el-card>
              <div class="img-block"><img src="@/assets/lock.png" class="pet-img"></div>
              <p class="card-info">Lv 10</p>
            </el-card>
          </el-col>
          <el-col :span="4">
            <el-card>
              <div class="img-block"><img src="@/assets/lock.png" class="pet-img"></div>
              <p class="card-info">Lv 15</p>
            </el-card>
          </el-col>
          <el-col :span="4">
            <el-card>
              <div class="img-block"><img src="@/assets/lock.png" class="pet-img"></div>
              <p class="card-info">Lv 20</p>
            </el-card>
          </el-col>
        </el-row>
      </el-col>
    </el-row>
  </div>
</template>

<script>
export default {
  name: 'PetPage',
  props: {
  },
  data: function () {
    return {
      msg: "This is PetPage page.",
      imgUrl: "@/assets/logo.png",
      imgFit: "fill"
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

</style>
