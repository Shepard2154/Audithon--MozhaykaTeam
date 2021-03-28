<script>
import { Line } from "vue-chartjs";
export default {
  extends: Line,
  props: {
    domesticLabels: Array,
    domesticData: Array,
  },
  data() {
    return {
      gradient: null,
      chartData:{
        labels: [],
        datasets: [
          {
            label: "Внутренний долг Российской Федерации",
            borderColor: "#FC2525",
            pointBackgroundColor: "black",
            borderWidth: 1,
            pointBorderColor: "white",
            backgroundColor: null,
            data: []
          }
        ]
      }
    };
  },
  mounted() {
    this.gradient = this.$refs.canvas
      .getContext("2d")
      .createLinearGradient(0, 0, 0, 450);

    this.gradient.addColorStop(0, "rgba(255, 0,0, 0.5)");
    this.gradient.addColorStop(0.5, "rgba(255, 0, 0, 0.25)");
    this.gradient.addColorStop(1, "rgba(255, 0, 0, 0)");
  
    this.chartData.datasets[0].data = this.domesticData
    this.chartData.labels = this.domesticLabels
    this.chartData.datasets[0].backgroundColor = this.gradient

    this.renderChart(this.chartData, {
      responsive: true,
      maintainAspectRatio: false,
      onClick: function(event, pointsArray) {
        if(pointsArray.length === 1) {
          var firstPointPosition = pointsArray[0]._index
          var secondPointPosition = pointsArray[1]._index
          var firstPointValue = this.tooltip._data.datasets[0].data[firstPointPosition]
          var secondPointValue = this.tooltip._data.datasets[1].data[secondPointPosition]
        } else if(pointsArray.length === 2) {
            var firstPointPosition = pointsArray[0]._index
            var secondPointPosition = pointsArray[1]._index
            var firstPointValue = this.tooltip._data.datasets[0].data[firstPointPosition]
            var secondPointValue = this.tooltip._data.datasets[1].data[secondPointPosition]
        } else {
            console.log("You selected the background!");            
        }  
    }
    });
  }
};
</script>