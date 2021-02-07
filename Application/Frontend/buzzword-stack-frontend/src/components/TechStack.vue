<template>
  <div>
    <h1><Count/></h1>
    <h1>Buzzword Tech Stack</h1>
    <ul>
        <li>Cloud Deployment</li>
        <li>Flask</li>
        <li>Vue</li>
        <li>Docker</li>
        <li>NGINX</li>
        <li>Trello</li>
        <li>Axios</li>
        <li>kubernetes</li>
        <li>Postgresql</li>
        <li>SQLalchemy</li>
        <li>DigitalOcean</li>
        <li>Docker-compose</li>
        <li>Terraform</li>
        <li>Flutter</li>
        <li>pytest</li>
        <li>jest</li>
    </ul>
    <h2>Pushing Images to Registry and Kubernetes</h2>
    <img alt="Pushing Images Diagram" src="@/assets/ImagePushProcess.svg">
    <h2>Users accessing our website</h2>
    <img alt="Pushing Images Diagram" src="@/assets/DOInf.svg">
  </div>
</template>

<script>
import Count from '@/components/Count.vue'
export default {
  name: 'TechStack',
  props: {
  },
  components: {
    Count
  },
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
