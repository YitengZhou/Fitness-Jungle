import Vue from 'vue';
import Vuex from 'vuex';

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    count: 6,
    jobs: [
      {
        jobId: 1,
        jobName: "test1",
        jobDetail: "test1 details",
        task: "",
        integrator: "",
        emtol: 0,
        nsteps: 0,
        dt: 0,
        nout: 0,
        tcoupl: "",
        taut: 0,
        reft: 0,
        pcoupl: "",
        taup: 0,
        refp: 0
      },
      {
        jobId: 2,
        jobName: "test2",
        jobDetail: "test2 details",
        task: "",
        integrator: "",
        emtol: 0,
        nsteps: 0,
        dt: 0,
        nout: 0,
        tcoupl: "",
        taut: 0,
        reft: 0,
        pcoupl: "",
        taup: 0,
        refp: 0
      },
      {
        jobId: 3,
        jobName: "test3",
        jobDetail: "test3 details",
        task: "",
        integrator: "",
        emtol: 0,
        nsteps: 0,
        dt: 0,
        nout: 0,
        tcoupl: "",
        taut: 0,
        reft: 0,
        pcoupl: "",
        taup: 0,
        refp: 0
      },
      {
        jobId: 4,
        jobName: "test4",
        jobDetail: "test4 details",
        task: "",
        integrator: "",
        emtol: 0,
        nsteps: 0,
        dt: 0,
        nout: 0,
        tcoupl: "",
        taut: 0,
        reft: 0,
        pcoupl: "",
        taup: 0,
        refp: 0
      },
      {
        jobId: 5,
        jobName: "test5",
        jobDetail: "test5 details",
        task: "",
        integrator: "",
        emtol: 0,
        nsteps: 0,
        dt: 0,
        nout: 0,
        tcoupl: "",
        taut: 0,
        reft: 0,
        pcoupl: "",
        taup: 0,
        refp: 0
      }
    ],
    newJob: {
      jobId: 0,
      jobName: "",
      jobDetail: "",
      task: "",
      integrator: "",
      emtol: 0,
      nsteps: 0,
      dt: 0,
      nout: 0,
      tcoupl: "",
      taut: 0,
      reft: 0,
      pcoupl: "",
      taup: 0,
      refp: 0
    }
  },
  mutations: {
    addNewJob (state) {
      state.newJob.jobId = state.count++;
      var jobToAdd = {};
      for(let i in state.newJob) {
        jobToAdd[i] = state.newJob[i];
      }
      state.jobs.push(jobToAdd);
    },
    clearNewJob (state) {
      state.newJob.jobId = 0;
      state.newJob.jobName = "";
      state.newJob.jobDetail = "";
      state.newJob.task = "";
      state.newJob.integrator = "";
      state.newJob.emtol = 0;
      state.newJob.nsteps = 0;
      state.newJob.dt = 0;
      state.newJob.nout = 0;
      state.newJob.tcoupl = "";
      state.newJob.taut = 0;
      state.newJob.reft = 0;
      state.newJob.pcoupl = "";
      state.newJob.taup = 0;
      state.newJob.refp = 0;
    },
    deleteJob (state, id) {
      state.jobs = state.jobs.filter(
        job => {return job.jobId !== id}
      );
    }
  }
})
