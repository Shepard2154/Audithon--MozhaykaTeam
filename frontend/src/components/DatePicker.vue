<template>
  <div>
    <v-card
    outlined
    raised>
    <v-date-picker
      v-model="datesPicker"
      color="#478A19"
      range
      no-title
      show-current
      locale="RU"
      @input="setDatesToInput"
    ></v-date-picker>
    </v-card>
    <v-card
    outlined
    raised
    style="margin-top: 14px"
    >
    <v-text-field
      @input="setDatesToPicker"
      label="Выбранные даты"
      style="font-family: IBM Plex Sans;
            font-style: normal;
            font-weight: normal;
            padding: 13px"
      color="#EDAC48"
      v-model="datesInput"
    ></v-text-field>
    <img src="../assets/img/pencil.svg"
    style="
    position: absolute;
    left: 315px;
    top: 26px;
    "/>
    </v-card>
  </div>
</template>

<script>
export default{
	name: "DatePicker",

	data(){
		return{
			datesPicker: [],
      datesInput: ""
		}
	},

  methods: {
    setDatesToPicker(){
      this.datesPicker = this.datesInput.split(" ~ ")
      if(this.datesPicker.length == 2){
        this.$emit("get-date", this.datesPicker)
      }
    },

    setDatesToInput(){
      this.datesInput = this.datesPicker.join(" ~ ")
      if(this.datesPicker.length == 2){
        this.$emit("get-date", this.datesPicker)
      }
    }
  }
}
</script>
