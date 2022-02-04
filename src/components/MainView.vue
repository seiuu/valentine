<template>
  <div class="main-view-container">
    <div class="text-wrapper" v-safe-html="formatText()"></div>
    <!-- <div class="text-wrapper">
      <span class="big"
        >Enjoy your week! <br /><span class="small bold">
          Kisses from me mwah!</span
        ></span
      >
      <span class="small">I love you a lot rly, kith for u 💞</span>
    </div> -->
  </div>
</template>

<script>
import Vue from "vue";
import VueSafeHTML from "vue-safe-html";

Vue.use(VueSafeHTML, {
  allowedTags: ["span", "br"],
});

export default {
  name: "MainView",
  data() {
    return {
      title: "",
      desc: "",
      fullMessage: "",
    };
  },
  props: {
    mainMessage: {
      type: String,
      required: false,
      default: "Hello!!",
    },
    description: {
      description: String,
      required: false,
      default: "I hope you enjoy this small gift..",
    },
  },
  methods: {
    formatText() {
      let message = "";

      message = this.mainMessage + " " + this.description;

      let mapObj = {
        love: `<span class="bold">love</span>`,
        You: `<span class="bold">You</span>`,
        you: `<span class="bold">you</span>`,
        your: `<span class="bold">your</span>`,
        Your: `<span class="bold">Your</span>`,
        monday: `<span class="bold">monday</span>`,
        tuesday: `<span class="bold">tuesday</span>`,
        wednesday: `<span class="bold">wednesday</span>`,
        thursday: `<span class="bold">thursday</span>`,
        friday: `<span class="bold">friday</span>`,
        saturday: `<span class="bold">saturday</span>`,
        sunday: `<span class="bold">sunday</span>`,
        snacc: `<span class="bold big">snacc</span>`,
        baby: `<span class="bold big">Baby</span>`,
        boo: `<span class="bold big">Boo</span>`,
        wonderful: `<span class="bold">wonderful</span>`,
        hot: `<span class="bold">hot</span>`,
        charming: `<span class="bold">charming</span>`,
        fantastic: `<span class="bold">fantastic</span>`,
      };

      var re = new RegExp(Object.keys(mapObj).join("|"), "gi");
      message = message.replace(re, function (matched) {
        let result = mapObj[matched.toLowerCase()];
        return matched[0] === matched[0].toLowerCase()
          ? result
          : result[0].toUpperCase() + result.slice(1);
      });

      return message;
    },
  },
};
</script>

<style lang="scss">
.text-wrapper {
  position: relative;
  z-index: 10;

  & > span {
    display: block;
    transform: rotate(-3deg);
  }

  & > span:last-of-type {
    margin-left: 5rem;
  }

  span {
    margin-top: 4rem;
    margin-bottom: 4rem;
  }

  span {
    &.bold {
      color: #dd5656;
      font-weight: bold;
    }

    &.small {
      font-size: 4rem;
    }

    &.medium {
      font-size: 7rem;
    }

    &.big {
      font-size: 9rem;
    }
  }
}

.button-wrapper {
  margin-top: auto;
  margin-bottom: 5rem;

  button {
    cursor: pointer;
    position: relative;
    font-family: "Montserrat", sans-serif;
    display: flex;
    justify-content: center;
    align-items: center;
    margin-left: auto;
    height: 4.813rem;
    border: 0;
    padding: 1.375rem 2.938rem;
    font-size: 2.063rem;
    font-weight: bolder;
    letter-spacing: 0.05em;
    overflow: hidden;
    background: transparent;

    &:hover {
      .liquid {
        &::before {
          background: rgba($color: #dd5656, $alpha: 1);
        }
        &::after {
          background: rgba($color: #5e2323, $alpha: 0.7);
        }
      }
    }
  }

  button span {
    position: relative;
    color: white;
    z-index: 1;
    transition: 0.35s ease;
  }

  button .liquid {
    position: absolute;
    top: -80px;
    left: 0;
    width: 100%;
    height: 200px;
    background: rgba($color: #dd5656, $alpha: 0.2);
    transition: 12s;
  }

  button .liquid::after,
  button .liquid::before {
    content: "";
    width: 200%;
    height: 200%;
    position: absolute;
    top: 0;
    left: 50%;
    transform: translate(-50%, -75%);
  }

  button .liquid::before {
    background: rgba(27, 27, 27, 0.4);
    animation: animate 12s linear infinite;
    transition: 0.7s ease;
  }

  button .liquid::after {
    background: rgba(224, 70, 70, 0.1);
    animation: animate 9s linear infinite;
    transition: 0.7s ease;
  }

  button:hover .liquid {
    top: -120px;
  }

  @keyframes animate {
    0% {
      transform: translate(-50%, -75%) rotate(0deg);
    }

    100% {
      transform: translate(-50%, -75%) rotate(360deg);
    }
  }
}

h1,
h4 {
  margin: 0;
}

button {
  color: #111111;
}
</style>
