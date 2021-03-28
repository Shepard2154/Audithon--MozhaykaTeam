<template>
  <div id="navbar">  
    <v-row>
        <v-col width="30px">
          <router-link :to="{name: 'main'}" class="nav-buttons">Долговые обязательства</router-link>
        </v-col>
        <v-col>
          <router-link :to="{name: 'repayment-schedule'}" class="nav-buttons">График погашений</router-link>
        </v-col>
        <v-col> 
          <router-link :to="{name: 'servicing-bonds'}" class="nav-buttons">Обслуживание ЦБ</router-link>
        </v-col>
        <v-col> 
          <router-link :to="{name: 'predicting'}" class="nav-buttons">Прогнозирование</router-link>
        </v-col>
    </v-row>
    <p style="font-family: Roboto;
      font-style: normal;
      font-weight: normal;
      color: white;
      opacity: 50%;
      text-align: center;
      margin-top: 60px;
      margin-bottom: 30px;"
      >Есть над чем задуматься: тщательные исследования конкурентов призывают нас к новым свершениям, которые, в свою очередь, должны быть в равной степени предоставлены сами себе. Современные технологии достигли такого уровня, что реализация намеченных плановых заданий не оставляет шанса для системы обучения кадров, соответствующей насущным потребностям.</p>
  </div>
</template>

<style scoped>
  #navbar {
    position: absolute;
    width: 1000px;
    height: 200px;
    top: 481px;
    left: 735px;
    margin-top: -300px;
    margin-left: -250px;
  }

  .nav-buttons {
    text-decoration: none;
    color: white; 
    text-align: center;
    padding: 10px;
  }

  .nav-buttons:hover {
    color: #EDAC48
  }

  .active {
    border-bottom: 1px solid;
  }
</style>

<script>
  export default {
    name: 'Navbar',

    data: () => ({
      logged: false
    }),

    created: function(){
      if (this.$store.state.token) {
        this.logged = true 
        console.log("Logged!")
      }
    }
  }
</script>

