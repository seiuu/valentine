<template>
  <div class="main-container" id="app">
    <!-- <img alt="Vue logo" src="./assets/logo.png" /> -->
    <img class="heart top-right" src="./assets/heart-big-right.svg" alt="" />
    <img class="heart bottom-left bigger" src="./assets/heart-big.svg" alt="" />
    <img
      class="heart bottom"
      src="./assets/heart-filled-right-light.svg"
      alt=""
    />
    <img class="heart top-left big" src="./assets/heart-red-left.svg" alt="" />
    <img class="heart right big" src="./assets/heart-red-right.svg" alt="" />

    <div class="main-wrapper">
      <transition
        name="fade"
        mode="out-in"
        :duration="{ enter: 720, leave: 810 }"
      >
        <template v-if="!isOpened">
          <MainView
            @viewClosed="changeView"
            :mainMessage="mainView.title"
            :description="mainView.description"
          />
        </template>
        <template v-if="isOpened">
          <OpenView
            :mainMessage="mainView.title"
            :description="mainView.description"
          />
        </template>
      </transition>
    </div>
  </div>
</template>

<script>
import MainView from "./components/MainView.vue";
import OpenView from "./components/OpenView.vue";
var seedrandom = require("seedrandom");
export default {
  name: "App",
  data() {
    return {
      isOpened: false,
      mainView: {
        title: "Happy | {Valentine's} day!",
        description: "I hope you enjoy this small {gift..}",
      },
      OpenView: {
        title: "Happy | {Valentine's} day!",
        description: "I hope you enjoy this small {gift..}",
      },
    };
  },
  components: {
    MainView,
    OpenView,
  },
  mounted() {
    this.setMainView();
  },
  methods: {
    changeView() {
      this.isOpened = true;
    },
    setMainView() {
      const dayNumber = this.getDay();
      let title = "";
      let description = "";

      let titles = [
        ["Happy Monday!!"],
        ["Happy Tuesday!!"],
        ["Happy Wednesday!!"],
        ["Happy Thursday!!"],
        ["Happy Friday!!"],
        ["Happy Saturday!!"],
        ["Happy Sunday!!"],
      ];

      let descriptions = [
        ["I love your hot ass"],
        ["You looking fine today rawrr"],
        ["Smooch for ur cute ass"],
        ["Enjoy your day baby boo"],
        ["Kissy for u mwah"],
        ["WHATS BEHIND U, JK DONT GET STRESSED"],
        ["MWAH, MWAH MWAH"],
      ];

      title = titles[dayNumber][this.getIndex(titles[dayNumber].length)];
      description =
        descriptions[dayNumber][this.getIndex(descriptions[dayNumber].length)];

      this.mainView = {
        title,
        description,
      };
    },
    getOpenViewInfo() {},
    getDay() {
      const date = new Date();
      return date.getDay();
    },
    getIndex(length) {
      const rng = seedrandom(new Date().toLocaleDateString("en-US"));
      return Math.round(rng() * (length - 1));
    },
  },
};
</script>

<style lang="scss">
:root {
  --base-font-size: 16px;
}

#app {
  font-family: "Dancing Script", cursive;
}

.main-container {
  position: relative;
  // padding: 0 14.56vw;
  height: 100%;
  width: auto;
  display: flex;
}

.heart {
  position: absolute;
  width: 5.96vw;
  height: 5.96vw;

  &.big {
    width: 8vw;
    height: 8vw;
  }

  &.bigger {
    width: 11vw;
    height: 11vw;
  }

  &.top-right {
    top: 11rem;
    right: 12vw;
  }

  &.bottom-left {
    left: 4vw;
    bottom: 5rem;
  }

  &.top-left {
    top: 4.875rem;
    left: 5vw;
  }

  &.right {
    right: 8vw;
    bottom: 18.75rem;
  }

  &.bottom {
    bottom: 2.87rem;
    left: 14vw;
  }
}

.main-wrapper {
  display: flex;
  width: 100%;
  flex-direction: column;
  margin-top: 12.5rem;

  span {
    color: #dd5656;
    font-weight: bold;
  }
}

body {
  padding: 0;
  margin: 0;
  height: 1px;
  width: 100%;
  min-height: 100vh;
  background: #111111;
  background-image: radial-gradient(
      100% 100% at 50% 0%,
      rgba(0, 0, 0, 0.2) 0%,
      rgba(191, 69, 69, 0.2) 100%
    ),
    url("./assets/background.png");
  background-repeat: no-repeat;
  background-size: cover;
  color: #ffc9c9;

  ::-webkit-scrollbar {
    display: none;
  }
}

html {
  scrollbar-width: none;
  scroll-behavior: smooth;
}

* {
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  outline: none;
}

.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.5s;
}
.fade-enter, .fade-leave-to /* .fade-leave-active below version 2.1.8 */ {
  opacity: 0;
}
</style>
