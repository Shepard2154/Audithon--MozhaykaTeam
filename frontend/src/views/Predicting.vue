<template>
    <div>
        <v-container style="width: 1500px; margin-bottom: 100px">
      <img id="title"
          height="62px"
          width="62px"
          style="float: left; margin-right: 20px"
          src="../assets/img/gerb.svg"/>
        <h2 style="font-family: Roboto;
          font-style: normal;
          font-weight: normal;
          color: #7B7B7B;"
          >Аналитика государственного долга</h2>
        <h3 style="float: left; margin-right: 20px; color: #C9C9C9; font-family: Roboto;
          font-style: normal;
          font-weight: normal;"
          >Департамент аудита финансовых рынков и государственного долга</h3>

        <div id="top-buttons">
          <a href="#" class="button" style="margin-right: 10px; color: white;">Загрузить новые данные</a>
          <a href="#" class="button" style="margin-right: 10px; color: white;">Рус <img src="../assets/img/vector1.svg"/> </a>
          <a href="#" class="button" width="101px"><img src="../assets/img/glasses.svg"/></a>
        </div>
      </v-container> 

      <v-container fluid ma-0 pa-0>
        <img src="../assets/img/green_background.png" height="551px" width="100%">
        <Navbar/>
                <v-card
          class="debtTable" 
          elevation="0" 
          min-width="1200px"
          min-height="524px" 
          style="padding: 40px;"
          outlined
          rounded
          raised
          >
          <v-row>
            <v-col cols=8>
              <v-text-field
                filled
                background-color="white"
                clearable
                placeholder="Поиск..."
                color="#EDAC48"
                v-model="search"
                solo
                >
              </v-text-field>
              <a href="#" class="button_search">Найти</a>
            </v-col>
            <v-col cols="4">
              <DatePicker v-on:get-date="updateData"/>
            </v-col>
          </v-row>
          
          <v-col cols="8"
          style="
          left: 1px;
          position: absolute;
          top: 100px;"
          >
          <v-card
          outlined
          >
            <v-data-table
              height="300px"
              width="500px"
              :headers="headers"
              :items="tableItems"
              item-key="name"
              class="elevation-1"
              :page.sync="page"
              :items-per-page="5"
              hide-default-footer
              :search="search"
              v-if="loaded"
            >
            </v-data-table>
          </v-card>
          <v-pagination
            color="#EDAC48"
            v-model="page"
            :length="pageCount"
            ></v-pagination>
        </v-col>
        </v-card>
      </v-container>

      <v-container>
        <v-row style="margin-top: 250px">
					<v-col cols="6">
						<BarChart :labels="labels" :domesticRepayment="domesticRepayment" :externalRepayment="externalRepayment" v-if="loaded"/>	
					</v-col>
					<v-col cols="6">
						<PieChart :chartData="chartData" v-if="loaded"/>	
					</v-col>
        </v-row>
      </v-container>
    </div>
</template>

<style scoped>
  .button {
    height: 84px;
    width: 41px;
    background: #EDAC48;
    color: black; 
    padding: 10px; 
    border-radius: 5px; 
    text-decoration: none; 
  }

  #top-buttons {
    float: right;
    display: inline;
  }

    .button_search {
    height: 132;
    background: #EDAC48;
    color: white; 
    padding: 10px; 
    border-radius: 5px; 
    text-decoration: none;
    position: absolute;
		top: 46px;
    left: 636px;
    min-width: 132px;
    text-align: center;
  }

  .debtTable {
     position: absolute;
      width: 900px;
      height: 200px;
      top: 735px;
      left: 610px;
      margin-top: -300px;
      margin-left: -250px;
  }
</style>

<script>
import Navbar from "../components/Navbar.vue"
import BarChart from "../components/BarChart.vue"
import PieChart from "../components/PieChart.vue"
import DatePicker from "../components/DatePicker.vue"

export default {
  name: 'general',
  components: {
    Navbar,
    BarChart,
    PieChart,
    DatePicker
    },

  data() {
			return{
				loaded: false,

				domesticData: [],
				externalData: [],
        labels: [],
				chartData: [],

        search: '',
        page: 1,
        pageCount: 0,
        headers: [
          { text: 'Дата', value: 'date'},
          { text: 'Категория долга', align: 'start', sortable: false, value: 'name'},
          { text: 'Сумма долга, $', value: 'debt'},
          { text: 'Тип долга', value: 'kind'},
        ],
        tableItems: [],
			}
  },

  methods:{
    async drawCharts(){
      await axios.get(`${this.$store.state.backendUrl}/db`
          ).then(response => {
            this.domesticRepayment = Object.values(response.data["domestic_debt"])
            this.externalRepayment = Object.values(response.data["external_debt"])
            this.labels = Object.keys(response.data["domestic_debt"])
          })
			let currentDomesticDebt = this.domesticRepayment[this.domesticRepayment.length - 1]
			let currentExternalDebt = this.externalRepayment[this.externalRepayment.length - 1]
			let sum = currentDomesticDebt + currentExternalDebt
			
			this.chartData = [(currentDomesticDebt/sum)*100, (currentExternalDebt/sum)*100]

			this.loaded = true
    },

    async getTableData(){
			await axios.get(`${this.$store.state.backendUrl}/db`
          ).then(response => {
            this.tableItems = response.data["structure_debt"]
            this.pageCount = Math.ceil(this.tableItems.length / 5)
			})
    }
  },

//   mounted(){
//     this.drawCharts()
//     this.getTableData()
//   },
}
</script>