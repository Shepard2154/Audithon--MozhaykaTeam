<script>
import { Bar, mixins } from "vue-chartjs";
const { reactiveProp } = mixins

export default {
  extends: Bar,
  mixins: [reactiveProp],
  props: {
    labels: Array,
    chartData: Array,
  },

  mounted() {
    this.renderChart(
      {
        labels: this.labels,
        datasets: [
          {
            label: "Динамика изменения цены",
            backgroundColor: "#f87979",
            data: this.chartData
          }
        ]
      },
      { responsive: true, maintainAspectRatio: false }
    );
  }
};
</script>
