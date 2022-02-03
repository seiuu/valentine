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
      </transition>
    </div>
  </div>
</template>

<script>
import MainView from "./components/MainView.vue";
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
    };
  },
  components: {
    MainView,
  },
  mounted() {
    this.setMainView();
  },
  methods: {
    changeView() {
      this.isOpened = true;
    },
    setMainView() {
      let day = this.getDay();

      // const dayNumber = 0;
      let title = "";
      let description = "";

      let titles = [
        [
          `<span class="big">Have a nice week <br /><span class="bold"> Baby Boo!</span></span>`,
          `<span class="big bold">Have a nice week!! </span>`,
          `<span class="big">Enjoy your week!</span>`,
          `<span class="big">Happy monday woo!! <span class="small">😭</span></span>`,
          `<span class="big">Fumk mondays <span class="small">😭😭</span></span>`,
        ],
        [
          `<span class="big">Oh tuesdays... <span class="small">😭</span></span>`,
          `<span class="big bold">2nd day of the week!!</span>`,
          `<span class="big">3 more days to go.. <span class="small">😭</span></span>`,
          `<span class="big">TWOOSDAY <br> LES GOO</span>`,
          `<span class="big">hi i love u a lot</span>`,
        ],
        [
          `<span class="big">Oh wednesdays.... <span class="small">😭</span></span>`,
          `<span class="big bold">3d day of the week!!</span>`,
          `<span class="medium">MINI FRIDAY WOO, <br> now get back to work</span>`,
          `<span class="big">wednesdays.. hate it..</span>`,
          `<span class="big bold">hi i love u a lot <span class="small">🥺</span></span>`,
        ],
        [
          `<span class="big">Oh thursdays....</span>`,
          `<span class="big bold">ALMOST FRIDAY!!</span>`,
          `<span class="medium">FRIDAY BEFORE FRIDAY WOO </span>`,
          `<span class="big">thirstdays.. wimk wimk <span class="small">😏</span></span>`,
          `<span class="big bold">hi i love u a lot  <span class="small"> 💞</span></span>`,
        ],
        [
          `<span class="big">FRIDAY LESSS GOO</span>`,
          `<span class="big bold">FRIDAY!!</span>`,
          `<span class="medium">FRIDAY WOO </span>`,
          `<span class="medium">is it hot in here <br> or is it just u?? <span class="small"> 😩</span> </span>`,
          `<span class="big bold">hi i love u a lot <span class="small"> 💞</span></span>`,
          '<span class="big bold"> v=U6n2NcJ7rLc </span>',
        ],
        [
          `<span class="medium">enjoy saturday <br> go away from computer.. </span>`,
          `<span class="big bold">hi i love u a lot <span class="small"> 💞</span></span>`,
        ],
        [
          `<span class="big">I hope you had a nice week!</span>`,
          `<span class="big">How was your week?</span>`,
          `<span class="big">hi i love u a lot 💞</span>`,
          `<span class="medium">I hope you are feeling omkay!!</span>`,
        ],
      ];

      let descriptions = [
        `<span class="small">u lookin like a <span class="bold"> snacc </span></span>`,
        `<span class="small bold"> i love u a lot rly! </span>`,
        `<span class="small">u r lookin like a cutie</span>`,
        `<span class="small">damn u cute asf tho?? <span class="small">😭😭😭</span></span>`,
        `<span class="small">I love you so so so much, have a nice day </span>`,
        `<span class="small">FREE NUDE TICKET SEND PIC OF THIS IN CHAT </span>`,
        `<span class="small">FREE COMPLIMENT TICKET SEND PIC OF THIS IN CHAT </span>`,
        `<span class="small">FREE FACE PIC TICKET SEND PIC OF THIS IN CHAT </span>`,
        `<span class="small">You are so pretty really</span>`,
        `<span class="small">You mean so much to me</span>`,
        `<span class="small">I hope nothing bothers you today!</span>`,
        `<span class="small">I love u to the moon n back!</span>`,
        `<span class="small">Is it summer or r u that hot!</span>`,
        `<span class="small">Is it hot in here??</span>`,
        `<span class="small">kiss me mwah</span>`,
        `<span class="small">u wanna go on a date tho???</span>`,
        `<span class="small">write to me, tu esi kartupelis</span>`,
        `<span class="small">write to me, tu esi zabaks</span>`,
        `<span class="small">LIKE HOW CUTE R U THO?? <span class="small">😭😭😭</span> </span>`,
        `<span class="small">LIKE HOW CUTE R U THO???? <span class="small">😭😭😭</span></span>`,
        `<span class="small">You are gorgeous <span class="small">😭😭😭</span> </span>`,
        `<span class="small">I love to be with you</span>`,
        `<span class="small">You are charming and fantastic</span>`,
        `<span class="small">I love your nose</span>`,
        `<span class="small">u have nice tits</span>`,
        `<span class="small">u got a pretty face rly..</span>`,
      ];

      title = titles[2][3];
      description = descriptions[3];

      if (day == "birthday") {
        title = `<span class="big">Happy Birthday <br> baby Boo!!</span>`;
        description = `<span class="small">I love You so so much, i hope you have a wonderful day!</span>`;
      } else if (day == "valentine") {
        title = `<span class="big">Happy Valentine's Day!</span>`;
        description = `<span class="small">I love You so so much, come back here everyday <br> for something new!</span>`;
      }

      this.mainView = {
        title,
        description,
      };
    },
    getOpenViewInfo() {},
    getDay() {
      let currDay = new Date();
      let birthday = new Date("06/08/2022");
      let valentine = new Date("02/14/2022");

      if (this.isToday(birthday)) {
        return "birthday";
      } else if (this.isToday(valentine)) {
        return "valentine";
      } else {
        return currDay;
      }
    },
    isToday(dateParameter) {
      var today = new Date();
      return (
        dateParameter.getDate() === today.getDate() &&
        dateParameter.getMonth() === today.getMonth()
      );
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

html,
body {
  height: 100%;
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

#app {
  min-height: 100%;
  display: flex;
  flex-direction: column;
  justify-content: center;
  margin: 0 auto;
  max-width: 80vmax;
  padding-left: 8vw;
  padding-right: 6vw;
}

body {
  margin: 0;
  background: #111111;
  background: radial-gradient(
      100% 100% at 50% 0%,
      rgba(0, 0, 0, 0.2) 0%,
      rgba(191, 69, 69, 0.2) 100%
    ),
    url("./assets/background.png") fixed;
  color: #ffc9c9;

  background-size: cover;
  background-repeat: no-repeat;

  ::-webkit-scrollbar {
    display: none;
  }
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
    right: 6vw;
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
    right: 4vw;
    bottom: 5rem;
  }

  &.bottom {
    bottom: 2.87rem;
    left: 14vw;
  }
}

.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.5s;
}
.fade-enter, .fade-leave-to /* .fade-leave-active below version 2.1.8 */ {
  opacity: 0;
}
</style>
