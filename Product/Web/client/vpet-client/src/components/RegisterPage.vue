<template>
  <div class="Register">
    <el-row type="flex" justify="center">
      <el-col :span="6">
          <el-card>
          <el-form ref="form" :model="form" label-width="80px">
            <el-form-item label="User id">
              <el-input></el-input>
            </el-form-item>
            <el-form-item label="User name">
              <el-input></el-input>
            </el-form-item>
            <el-form-item label="password">
              <el-input></el-input>
            </el-form-item>
            <el-form-item>
              <el-button type="primary">Submit</el-button>
              <el-button>Reset</el-button>
            </el-form-item>
          </el-form>
          </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<script>
export default {
  name: 'RegisterPage',
  props: {
  },
  data: function () {
    return {
      msg: "This is Register page. "
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
