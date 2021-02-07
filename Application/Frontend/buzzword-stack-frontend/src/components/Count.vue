<template>
  <div>
    Count: {{ count }}
  </div>
</template>

<script>
export default {
  name: 'Count',
  props: {
  },
  data() {
    return {
      count: 0,
    }
  },
  mounted() {
    this.axios.post("/api/count", {}).then((response) => {
        console.log(response.data)
        this.count = response.data.count
    })
  },
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
