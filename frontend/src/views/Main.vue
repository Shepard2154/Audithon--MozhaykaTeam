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
          <a href="#" class="button" style="margin-right: 10px; color: white; background-color: #55884F">Рус <img src="../assets/img/vector1.svg"/> </a>
          <a href="#" class="button" width="101px" style="background-color: #55884F"><img src="../assets/img/glasses.svg"/></a>
        </div>
    </v-container> 

    <v-container fluid ma-0 pa-0>
      <img src="../assets/img/green_background.png" height="551px" width="100%">
      <Navbar/>
      <v-card
        class="debtTable" 
        elevation="0" 
        min-height="537px"
        min-width="1822px"
        style="padding: 40px; text-align: center;"
        outlined
        rounded
        raised
        >
        <v-row>
          <v-col cols=6>
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
          <v-col cols="3">
            <DatePicker v-on:get-date="updateData"/>
          </v-col>
          
          <v-col cols=3>
            <v-col cols=2>
              <v-row>
                <v-card
                min-width="325px"
                min-height="175px" 
                outlined
                rounded
                raised
                style="padding: 40px; width: 325px; height: 175px">
                  <h4>Ключевая ставка</h4>
                </v-card>
              </v-row>
            </v-col>
            
            <v-col cols=2>
              <v-row>
                <v-card
                min-width="325px"
                min-height="175px" 
                outlined
                rounded
                raised
                style="padding: 40px; width: 325px; height: 175px; margin-top: 41px">
                  <h4>Макроэкономические показатели</h4>
                </v-card>
              </v-row>
            </v-col>

          </v-col>
        </v-row>
        
      <v-col cols="8"
        style="
        left: 1px;
        position: absolute;
        top: 120px;"
        >
        <v-card
        outlined
        style="width: 71%; margin-left: 28px;"
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
            style="cursor: pointer;"
          >
          </v-data-table>
        </v-card>
        <v-row>
          <v-col cols="2" style="padding-top: 21px;">
            <a href="#" class="date_button" style="margin-left: -27px;"><img src="../assets/img/Group 24.svg"/> Год назад</a>
          </v-col>

          <v-col cols=3>
            <v-pagination
            color="#EDAC48"
            v-model="page"
            :length="pageCount"
            ></v-pagination>
          </v-col>
          
          <v-col cols="2" style="padding-top: 21px;">
            <a href="#" class="date_button">Через год <img src="../assets/img/Group 23.svg" style="vertical-align: -webkit-baseline-middle;"/></a>
          </v-col>

          <v-col cols="2" style="padding-top: 21px;">
            <a href="?all_time=true" class="date_button">Все время</a>
          </v-col>
        </v-row>
        <v-row>
          <a href="#" class="download_button">Выгрузить данные в Excel</a>
        </v-row>
      </v-col>
      </v-card>
    </v-container>
       
    <v-spacer></v-spacer>
    <v-container>
      <v-row style="margin-top: 250px">
        <v-col cols="6">
          <AreaChart :domesticLabels="domesticLabels" :domesticData="domesticData" v-if="loaded"/>	
        </v-col>
        <v-col cols="6">
          <AreaChart2 :externalLabels="externalLabels" :externalData="externalData" v-if="loaded"/>		
        </v-col>
      </v-row>
      <v-row>
        <v-col cols="6">
          <AreaChart4 :gar="gar" :labelsGar="labelsGar" v-if="loaded"/>	
        </v-col>
        <v-col cols="6">
          <PieChart :chartData="chartData" v-if="loaded"/>	
        </v-col>
      </v-row>
    </v-container>
      <footer>
      <v-spacer></v-spacer>
      <div class="footer-copyright text-center py-3 text" style="background-color: #55884F; color: white; margin-top: 30px"> © 2021 MozhaykaTeam
      </div>
   </footer>
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

  .button_search {
    height: 132;
    background: #EDAC48;
    color: white; 
    padding: 10px; 
    border-radius: 5px; 
    text-decoration: none;
    position: absolute;
		top: 46px;
    left: 755px;
    min-width: 132px;
    text-align: center;
  }

  .debtTable {
     position: absolute;
      width: 900px;
      height: 200px;
      top: 735px;
      left: 294px;
      margin-top: -300px;
      margin-left: -250px;
  }

  #top-buttons {
    float: right;
    display: inline;
  }

  .date_button {
    margin-top: 9px;
    text-decoration: none;
    color: #FF9B00;
  }

  .date_button:hover {
    color: #55884F;
  }

  .download_button {
    text-decoration: none; 
    color: #55884F; 
    margin-left: 257px
  }

  .download_button:hover {
    color: #FF9B00;
  }

  h4 {
    color: #FF9B00;
  }
</style>

<script>
import Navbar from "../components/Navbar.vue"
import AreaChart from "../components/AreaChart.vue"
import AreaChart2 from "../components/AreaChart2.vue"
import AreaChart4 from "../components/AreaChart4.vue"
import PieChart from "../components/PieChart.vue"
import DatePicker from "../components/DatePicker.vue"

export default {
  name: 'general',
  components: {
    Navbar,
    AreaChart,
    AreaChart2,
    AreaChart4,
		PieChart,
    DatePicker
    },

  data() {
			return{
				logged: false,
				loaded: false,
        loaded2: false,

        domesticLabels: [],
				domesticData: [],

        externalLabels: [],
        externalData: [],

        gar: [],
        labelsGar: [],

        search: '',
        page: 1,
        pageCount: 0,
        headers: [
          { text: '№', align: 'start', sortable: false, value: 'id'},
          { text: 'Дата', value: 'date'},
          { text: 'Наименование', value: 'type'},
          { text: 'Внутренний/внешний', value: 'kind'},
          { text: 'Сумма долга(млрд.Р/млн.$)', value: 'debt'},
        ],
        tableItems: [],

        domesticSum: 0,
        externalSum: 0
        }
  },


  methods:{
    checkLogging(){
      if (this.$store.state.token) {
        this.logged = true 
        console.log("Logged!")
      }
      else {
        console.log("Unauthorized!")
      }
    },

    async drawCharts(dateBefore="", dateAfter="2010-01-01"){
      await axios.get(`${this.$store.state.backendUrl}/debt/plot/?date_before=${dateBefore}&date_after=${dateAfter}&notype=domestic&notype=guarantee`
          ).then(response => {
            for (let i=0; i<response.data.length; i++){
              this.domesticLabels.push(response.data[i]["month"])
              this.domesticData.push(response.data[i]["c"])
              this.domesticSum += response.data[i]["c"]
            }            
          })

      await axios.get(`${this.$store.state.backendUrl}/outer/plot/?date_before=${dateBefore}&date_after=${dateAfter}&name=Государственный%20внешний%20долг`
          ).then(response => {
            for (let i=0; i<response.data.length; i++){
              this.externalLabels.push(response.data[i]["month"])
              this.externalData.push(response.data[i]["c"])
            }
          })

      await axios.get(`${this.$store.state.backendUrl}/debt/?type=guarantee`
          ).then(response => {
            for (let i=0; i<response.data.length; i++){
              this.labelsGar.push(response.data[i]["date"])
              this.gar.push(response.data[i]["debt"])
            }
          })

      this.domesticSum = this.domesticSum
      this.externalSum = this.externalSum*1000000*75
			let sum = this.domesticSum + this.externalSum
			
			this.chartData = [24, 76]
      console.log(this.chartData)
      this.loaded = true
    },

    async getTableData(dateBefore="2021-02-01", dateAfter="2019-12-01"){
      let url=`${this.$store.state.backendUrl}/debt/`
      if (dateBefore!=null && dateAfter!=null) url=`${this.$store.state.backendUrl}/debt/?date_before=${dateBefore}&date_after=${dateAfter}&notype=domestic&notype=guarantee`
			await axios.get(url
          ).then(response => {
            for (let i=0; i<response.data.length; i++){
              let current_object = {
                "id": response.data[i]["id"],
                "date": response.data[i]["date"],
                "type": response.data[i]["type"],
                "debt": response.data[i]["debt"],
                "kind": "Внутренний"
              }
              this.tableItems.push(current_object)
            }
            this.pageCount = Math.ceil(this.tableItems.length / 5)
			})

      await axios.get(`${this.$store.state.backendUrl}/outer/?date_before=${dateBefore}&date_after=${dateAfter}`
          ).then(response => {
            for (let i=0; i<response.data.length; i++){
              let current_object = {
                "id": response.data[i]["id"],
                "date": response.data[i]["date"],
                "type": response.data[i]["name"],
                "debt": response.data[i]["usd"],
                "kind": "Внешний"
              }
              this.tableItems.push(current_object)
            }
            this.pageCount = Math.ceil(this.tableItems.length / 5)
          })
    },

    updateData: function (datesPicker) {
      this.getTableData(datesPicker[1], datesPicker[0])
      this.drawCharts(datesPicker[1], datesPicker[0])
    },
  },

  mounted(){
    this.drawCharts()
    this.getTableData()
  },
}
</script>