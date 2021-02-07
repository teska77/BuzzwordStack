<template>
  <div>
    <h1><Count/></h1>
    <h1>Buzzword Tech Stack</h1>
    <p>The greatest counting application you will ever see</p>
    <h2>The Goals</h2>
    <ul>
        <li>Cloud Deployment</li>
        <li>Infrastructure as Code</li>
        <li>Deployment Pipeline on PR merge</li>
        <li>Scaling microservices</li>
        <li>DNS managed by code</li>
        <li>Template for future projects</li>
        <li>Infrastructure Deployment Pipeline on Cloud</li>
    </ul>
    <h2>What we achieved</h2>
    <ul>
        <li>Cloud Deployment</li>
        <li>Infrastructure as Code</li>
        <li>Deployment Pipeline on PR merge</li>
        <li>Scaling microservices</li>
        <li>DNS managed by code</li>
        <li>Template for future projects</li>
    </ul>
    <h2>What we didn't achieve</h2>
    <ul>
        <li>Infrastructure Deployment Pipeline on Cloud</li>
    </ul>
  </div>
</template>

<script>
import Count from '@/components/Count.vue'
export default {
  name: 'Welcome',
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
