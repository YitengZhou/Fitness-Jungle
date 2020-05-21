<script>
import { Bar } from 'vue-chartjs'

export default {
  extends: Bar,
  data: () => ({
    chartdata: {
      labels: ['1st', '5th', '10th', '15th', '20th', '25th'],
      datasets: [
        {
          label: 'Steps',
          backgroundColor: '#87ceeb',
          data: [25, 20, 17, 29, 22, 21]
        }
      ]
    },
    options: {
      responsive: true,
      maintainAspectRatio: false
    }
  }),

  mounted () {
    this.renderChart(this.chartdata, this.options)
  }
}
</script>

<style>
</style>
