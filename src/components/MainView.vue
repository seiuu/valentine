<template>
  <div>
    <h1>{{ title }}</h1>
    <h4></h4>
  </div>
</template>

<script>
export default {
  name: "HelloWorld",
  data() {
    return {
      title: "Happy Valentine’s Day!",
    };
  },
};
</script>

<style lang="scss">
h1 {
  font-family: "Dancing Script", cursive;
  font-size: 9.188rem;
}
</style>
