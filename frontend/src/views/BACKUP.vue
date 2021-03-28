<script>
import { Line } from "vue-chartjs";

export default {
  extends: Line,
  props: {
    chartData: Object,
  },
  data() {
    return {
      gradient: null
    }
  },

  methods: {
    renderAreaChart: function(){
      this.renderChart(this.data, {
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
  },

  mounted() {
    this.gradient = this.$refs.canvas
      .getContext("2d")
      .createLinearGradient(0, 0, 0, 450);
    // this.gradient2 = this.$refs.canvas
    //   .getContext("2d")
    //   .createLinearGradient(0, 0, 0, 450);

    this.gradient.addColorStop(0, "rgba(255, 0,0, 0.5)");
    this.gradient.addColorStop(0.5, "rgba(255, 0, 0, 0.25)");
    this.gradient.addColorStop(1, "rgba(255, 0, 0, 0)");
    console.log(this.data)

    // this.gradient2.addColorStop(0, "rgba(0, 231, 255, 0.9)");
    // this.gradient2.addColorStop(0.5, "rgba(0, 231, 255, 0.25)");
    // this.gradient2.addColorStop(1, "rgba(0, 231, 255, 0)");

    // this.chartData.datasets[0].data = this.domesticData
    // this.chartData.datasets[1].data = this.externalData
    // this.chartData.labels = this.labels

    this.data.datasets[0].backgroundColor = this.gradient
    // this.chartData.datasets[1].backgroundColor = this.gradient2
    this.renderAreaChart()

  },

  computed: {
    data: function() {
      return this.chartData
    }<script>
import { Line } from "vue-chartjs";

export default {
  extends: Line,
  props: {
    chartData: Object,
  },
  data() {
    return {
      gradient: null
    }
  },

  methods: {
    renderAreaChart: function(){
      this.renderChart(this.data, {
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
  },

  mounted() {
    this.gradient = this.$refs.canvas
      .getContext("2d")
      .createLinearGradient(0, 0, 0, 450);
    // this.gradient2 = this.$refs.canvas
    //   .getContext("2d")
    //   .createLinearGradient(0, 0, 0, 450);

    this.gradient.addColorStop(0, "rgba(255, 0,0, 0.5)");
    this.gradient.addColorStop(0.5, "rgba(255, 0, 0, 0.25)");
    this.gradient.addColorStop(1, "rgba(255, 0, 0, 0)");
    console.log(this.data)

    // this.gradient2.addColorStop(0, "rgba(0, 231, 255, 0.9)");
    // this.gradient2.addColorStop(0.5, "rgba(0, 231, 255, 0.25)");
    // this.gradient2.addColorStop(1, "rgba(0, 231, 255, 0)");

    // this.chartData.datasets[0].data = this.domesticData
    // this.chartData.datasets[1].data = this.externalData
    // this.chartData.labels = this.labels

    this.data.datasets[0].backgroundColor = this.gradient
    // this.chartData.datasets[1].backgroundColor = this.gradient2
    this.renderAreaChart()

  },

  computed: {
    data: function() {
      return this.chartData
    }<script>
import { Line } from "vue-chartjs";

export default {
  extends: Line,
  props: {
    chartData: Object,
  },
  data() {
    return {
      gradient: null
    }
  },

  methods: {
    renderAreaChart: function(){
      this.renderChart(this.data, {
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
  },

  mounted() {
    this.gradient = this.$refs.canvas
      .getContext("2d")
      .createLinearGradient(0, 0, 0, 450);
    // this.gradient2 = this.$refs.canvas
    //   .getContext("2d")
    //   .createLinearGradient(0, 0, 0, 450);

    this.gradient.addColorStop(0, "rgba(255, 0,0, 0.5)");
    this.gradient.addColorStop(0.5, "rgba(255, 0, 0, 0.25)");
    this.gradient.addColorStop(1, "rgba(255, 0, 0, 0)");
    console.log(this.data)

    // this.gradient2.addColorStop(0, "rgba(0, 231, 255, 0.9)");
    // this.gradient2.addColorStop(0.5, "rgba(0, 231, 255, 0.25)");
    // this.gradient2.addColorStop(1, "rgba(0, 231, 255, 0)");

    // this.chartData.datasets[0].data = this.domesticData
    // this.chartData.datasets[1].data = this.externalData
    // this.chartData.labels = this.labels

    this.data.datasets[0].backgroundColor = this.gradient
    // this.chartData.datasets[1].backgroundColor = this.gradient2
    this.renderAreaChart()

  },

  computed: {
    data: function() {
      return this.chartData
    }
  },

  watch: {
    data: function() {
      this._chart.destroy();
      this.renderAreaChart();
    }
  }

  }
</script>

  },

  watch: {
    data: function() {
      this._chart.destroy();
      this.renderAreaChart();
    }
  }

  }
</script>

    data: function() {
      this._chart.destroy();
      this.renderAreaChart();
    }
  }

  }
</script>
