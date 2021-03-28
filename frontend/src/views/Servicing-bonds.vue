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
          <a href="#" class="button" style="margin-right: 10px; color: white; background-color: #37889A">Рус <img src="../assets/img/vector1.svg"/> </a>
          <a href="#" class="button" width="101px" style="background-color: #37889A"><img src="../assets/img/glasses.svg"/></a>
        </div>
      </v-container> 

      <v-container fluid ma-0 pa-0>
        <img src="../assets/img/dark_blue_background.png" height="552px" width="100%">
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
              @click:row="clicked"
              style = "cursor: pointer;"
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
            <a href="#" class="date_button">Все время</a>
          </v-col>
        </v-row>
        <v-row>
          <a href="#" class="download_button">Выгрузить данные в Excel</a>
        </v-row>
      </v-col>
      </v-card>
      <v-container>
        <v-data-table
              style="margin-top: 300px;cursor: pointer;"
              height="300px"
              width="500px"
              :headers="obligationHeaders"
              :items="obligationTable"
              item-key="name"
              hide-default-footer
              v-if="obligationLoaded"
            >
          </v-data-table>
      </v-container>
      </v-container>
      <v-spacer></v-spacer>
    <v-container class="mb-2">
        <BarChart :chartData="chartData" :labels="labels" v-if="loaded2"/>	
    </v-container>
    <footer>
    <v-spacer></v-spacer>
    <div class="footer-copyright text-center py-3 text" style="background-color: #37889A; color: white"> © 2021 MozhaykaTeam
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
    color: #37889A;
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
    color: #37889A;
  }

  h4 {
    color: #37889A;
  }
</style>

<script>
import Navbar from "../components/Navbar.vue"
import AreaChart from "../components/AreaChart.vue"
import PieChart from "../components/PieChart.vue"
import DatePicker from "../components/DatePicker.vue"
import BarChart from "../components/BarChart.vue"
import Footer from "../components/Footer.vue"

export default {
  name: 'general',
  components: {
    Navbar,
    AreaChart,
		PieChart,
    DatePicker,
    BarChart,
    Footer
    },

  data() {
			return{
				logged: false,
				loaded: false,

        obligationTable: null,
        obligationLoaded: false,
        obligationHeaders: [
          { text: 'Наименование', sortable: false, value: 'Наименование:'},
          { text: 'Состояние выпуска', sortable: false, value: 'Состояние выпуска:'},
          { text: 'Данные госрегистрации', sortable: false, value: 'Данные госрегистрации:'},
          { text: 'Номинал', sortable: false, value: 'Номинал:'},
          { text: 'Текущая стоимость', sortable: false, value: 'Текущая стоимость'},
          { text: 'Объем эмиссии, шт.', sortable: false, value: 'Объем эмиссии, шт.:'},
          { text: 'Объем эмиссии , руб.', sortable: false, value: 'Объем эмиссии:'},
          { text: 'Объем в обращении, шт.', sortable: false, value: 'Объем в обращении, шт:'},
          { text: 'Период обращения, дней', sortable: false, value: 'Период обращения, дней:'},
          { text: 'Дата начала размещения', sortable: false, value: 'Дата начала размещения:'},
          { text: 'Дата окончания размещения', sortable: false, value: 'Дата окончания размещения:'},
          { text: 'Дата погашения', sortable: false, value: 'Дата погашения:'},
          { text: 'Дней до погашения', sortable: false, value: 'Дней до погашения:'},
          { text: 'Периодичность выплат в год', sortable: false, value: 'Периодичность выплат в год:'},
          { text: 'Текущий купон (всего)', sortable: false, value: 'Текущий купон (всего):'},
          { text: 'Дата выплаты купона', sortable: false, value: 'Дата выплаты купона:'},
          { text: 'Размер купона, % годовых', sortable: false, value: 'Размер купона, % годовых:'},
          { text: 'НКД', sortable: false, value: 'НКД:'},
        ],

				domesticData: [],
				externalData: [],
        labels: [],
				chartData: [],

        search: '',
        page: 1,
        pageCount: 0,
        headers: [
          { text: 'Выпуск', value: 'name'},
          { text: 'Полное наименование', value: 'fullname'},
          { text: 'Наименование', sortable:false, value: 'name'},
          { text: 'Категория ЦБ', value: 'kind'},
          { text: 'Номинал погашения', value: 'cost'},
          { text: 'Купонный доход, %', value: 'percent'},
        ],
        tableItems: [],
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

    async drawCharts(){
      await axios.get(`${this.$store.state.backendUrl}/invest/plot/<int:obligation_id>/`
          ).then(response => {
            this.domesticData = Object.values(response.data["domestic_debt_2020"])
            this.externalData = Object.values(response.data["external_debt_2020"])
            this.labels = Object.keys(response.data["domestic_debt_2020"])
          })
    },

    async getTableData(dateBefore="", dateAfter=""){
      let url=`${this.$store.state.backendUrl}/obligations/`
      if (dateBefore!=null && dateAfter!=null) url=`${this.$store.state.backendUrl}/obligations/?date_before=${dateBefore}&date_after=${dateAfter}`
			await axios.get(url
          ).then(response => {
            console.log(response)
            this.tableItems = response.data
            this.pageCount = Math.ceil(this.tableItems.length / 5)
            this.loaded = true
			})
    },

    updateData: function (datesPicker) {
      this.getTableData(datesPicker[1], datesPicker[0])
    },

    clicked: function(item) {
      axios.get(`${this.$store.state.backendUrl}/invest/${item["id"]}/`
        ).then(response => {
          this.obligationTable = {"Текущая стоимость": response.data["c"]}
        }) 
      axios.get(`${this.$store.state.backendUrl}/invest/detail/${item["id"]}/`
          ).then(response => {
            this.obligationTable = [Object.assign(this.obligationTable, response.data)]
            console.log(this.obligationTable)
            this.obligationLoaded = true
			  })
      axios.get(`${this.$store.state.backendUrl}/invest/plot/${item["id"]}/`
          ).then(response => {
            for (let i=0; i<response.data.length; i++){
              this.labels.push(response.data[i]["time"])
              this.chartData.push(response.data[i]["c"])
            }
            console.log(this.chartData)
            console.log(this.labels)
            this.loaded2 = true
          })
    }
  },

  mounted(){
    this.getTableData()
  },
}
</script>