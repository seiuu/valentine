<template>
  <div class="main-view-container">
    <div class="text-wrapper">
      <h1 v-safe-html="formatText(mainMessage)"></h1>
      <h4 v-safe-html="formatText(description)"></h4>
    </div>
    <div class="button-wrapper">
      <button v-on:click="$emit('viewClosed')">
        <span>LETS GOO!</span>
        <div class="liquid"></div>
      </button>
    </div>
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
    formatText(value) {
      if (!value) return "";

      let newString = value;

      const startingSymbol = "{";
      const endingSymbol = "}";
      const lineBreakSymbol = "|";
      const lineBreakTag = "<br>";
      const startingTag = "<span>";
      const endingTag = "</span>";

      if (value.includes(startingSymbol) && value.includes(endingSymbol)) {
        newString = value
          .replace(startingSymbol, startingTag)
          .replace(endingSymbol, endingTag)
          .replace(lineBreakSymbol, lineBreakTag);
      }
      return newString;
    },
  },
};
</script>

<style lang="scss">
.main-view-container {
  display: flex;
  flex-direction: column;
  flex-grow: 1;
  padding-bottom: 3rem;
  padding-left: 19vw;
  padding-right: 12vw;
}

.button-wrapper {
  margin-top: auto;

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

h1 {
  font-size: 9.188rem;
  transform: rotate(-3deg);
  line-height: 121%;
  margin-bottom: 4.5rem;
}

h4 {
  font-size: 3.75rem;
  transform: rotate(-3deg);
  letter-spacing: 0.01em;
  padding-left: 6.563rem;
  padding-right: 6.563rem;
}

button {
  color: #111111;
}
</style>
