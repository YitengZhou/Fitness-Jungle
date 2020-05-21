<template>
  <div class="Login">
    <!--
    <div class="PostList">
      <div class="loading" v-if="loading">
        Loading...
      </div>
      <div class="posts" v-else>
      <ul>
        <li v-for="post in posts" v-bind:key="post.author_id">
					<router-link :to="{ name: 'user_info', params: { name: post.author.loginname }}" :title="post.author_id">
						<img :src="post.author.avatar_url" :title="post.author.loginname"/>
					</router-link>
					<span>
						{{ post.reply_count }}/{{ post.visit_count }}
					</span>
					<router-link :to="{ name: 'post_content', params: { id: post.id,name:post.author.loginname }}" :title="post.title">
						{{ post.title }}
					</router-link>
					<span class="last_reply">
						{{ post.last_reply_at | formatDate}}
					</span>
				</li>
			</ul>
      </div>
    </div>
    -->
    <el-row type="flex" justify="center">
      <el-col :span="6">
          <el-card>
          <el-form ref="form" :model="form" label-width="80px">
            <el-form-item label="User id">
              <el-input v-model="loginValue.userId"></el-input>
            </el-form-item>
            <el-form-item label="password">
              <el-input v-model="loginValue.password"></el-input>
            </el-form-item>
            <el-form-item>
              <el-button type="primary" v-on:click="loginEvent">Submit</el-button>
              <el-button v-on:click="reset">Reset</el-button>
            </el-form-item>
          </el-form>
          </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<script>
export default {
  name: 'LogInPage',
  props: {
  },
  data: function () {
    return {
      posts: {},
      loading: false,
      loginValue: {
        userId: "",
        password: ""
      }
    }
  },
  methods: {
    loginEvent() {
      this.getUser();
      this.getUserData();
      this.getPetData();
      alert("done");
    },
    reset() {
      this.loginValue.userId = "";
      this.loginValue.password = "";
    },
    getUser() {
      this.$http({
        url: './api/login',
        method: 'post',
        data: {
          email: this.loginValue.userId,
          password: this.loginValue.password
        }
      })
      .then((response) => {
        if (response != null) {
          this.$store.commit('setUser', response);
        }
      })
      .catch(function (error) {
        console.log(error);
      });
    },
    getUserData() {
      this.$http({
        url: './api/getUser',
        method: 'post',
        data: {
          userId: this.$store.state.userId
        }
      })
      .then((response) => {
        if (response != null) {
          this.$store.commit('setUserData', response);
        }
      })
      .catch(function (error) {
        console.log(error);
      });
    },
    getPetData() {
      this.$http({
        url: './api/getUserPets',
        method: 'post',
        data: {
          userId: this.$store.state.userId
        }
      })
      .then((response) => {
        if (response != null) {
          this.$store.commit('setPetData', response.pets[0]);
        }
      })
      .catch(function (error) {
        console.log(error);
      });
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
