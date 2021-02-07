<template>
  <div id="app">
    <img alt="BuzzWord Stack logo" src="@/assets/BuzzWordStackLogo.svg">
    <div id="nav">
      <router-link to="/">Home</router-link> |
      <router-link to="/techstack">Tech Stack</router-link>
    </div>
    <router-view/>
  </div>
</template>

<style>
  @import 'https://cdn.jsdelivr.net/npm/water.css@2/out/dark.css';
</style>
