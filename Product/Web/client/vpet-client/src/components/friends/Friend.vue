<template>
  <el-card shadow="always" class="card">
    <table class="FriendInfo">
      <tr>
        <th class="th2 table-head">Friend Id</th>
        <th class="th1 table-head">Friend Name</th>
        <th class="th3 table-head">Friend Steps</th>
        <th class="th4 table-head">action</th>
      </tr>
      <tr>
        <td>{{ friendInfo.friendId }}</td>
        <td>{{ friendInfo.friendName }}</td>
        <td>{{ friendInfo.friendSteps }}</td>
        <td>
          <el-button type="primary" size="small">Challange</el-button>
          <el-button type="danger" size="small">Delete Friend</el-button>
        </td>
      </tr>
    </table>
  </el-card>
</template>

<script>
export default {
  name: 'Friend',
  props: {
    friendInfo: {
      type: Object,
      required: true
    }
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
