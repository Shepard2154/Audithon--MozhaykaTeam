<script>
import { Line } from "vue-chartjs";
export default {
  extends: Line,
  props: {
    externalLabels: Array,
    externalData: Array
  },
  data() {
    return {
      gradient: null,

      chartData:{
        labels: [],
        datasets: [
          {
            label: "Динамика роста суммы долговых обязательств, подлежащих погашению",
            borderColor: "#05CBE1",
            pointBackgroundColor: "black",
            pointBorderColor: "white",
            borderWidth: 1,
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

    this.gradient.addColorStop(0, "rgba(0, 231, 255, 0.9)");
    this.gradient.addColorStop(0.5, "rgba(0, 231, 255, 0.25)");
    this.gradient.addColorStop(1, "rgba(0, 231, 255, 0)");

    this.chartData.datasets[0].data = this.externalData
    this.chartData.labels = this.externalLabels
    this.chartData.datasets[0].backgroundColor = this.gradient
    
    this.renderChart(this.chartData, {
      responsive: true,
      maintainAspectRatio: false,
      onClick: function(event, pointsArray) {
        console.log(pointsArray) 
        if(pointsArray.length === 1) {
          var firstPointPosition = pointsArray[0]._index
          var secondPointPosition = pointsArray[1]._index
          var firstPointValue = this.tooltip._data.datasets[0].data[firstPointPosition]
          var secondPointValue = this.tooltip._data.datasets[1].data[secondPointPosition]
          console.log(firstPointValue, secondPointValue) 
        } else if(pointsArray.length === 2) {
            var firstPointPosition = pointsArray[0]._index
            var secondPointPosition = pointsArray[1]._index
            var firstPointValue = this.tooltip._data.datasets[0].data[firstPointPosition]
            var secondPointValue = this.tooltip._data.datasets[1].data[secondPointPosition]
            console.log(firstPointValue, secondPointValue) 
        } else {
            console.log("You selected the background!");            
        }  
    }
    });
  }
};
</script>