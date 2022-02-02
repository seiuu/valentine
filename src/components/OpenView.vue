<template>
  <div class="open-view-container">
    <div class="card">
      <div class="card-wrapper">
        <div class="close"></div>
        <h2 class="title">Hello, Baby boo!!</h2>
        <p class="message">
          I hope you are having a nice day... and if you aren’t then I hope that
          stuff starts to get better soon, cause you deserve it. I love you a
          lot.
        </p>
        <p class="author">- Albert</p>
      </div>
    </div>
  </div>
</template>

<script>
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
};
</script>

<style lang="scss">
.open-view-container {
  width: 100%;
  display: flex;
  justify-content: center;
}

.card {
  position: relative;
  min-height: 39rem;
  width: 100%;
  max-width: 30.625rem;
  background: linear-gradient(
    133.41deg,
    rgba(9, 9, 9, 0.83) -3.57%,
    rgba(17, 17, 17, 0.9) 90.06%
  );
  border: 1px solid #dd5656;
  box-sizing: border-box;
  box-shadow: 0px 41px 17px -15px rgba(0, 0, 0, 0.76);
  border-radius: 0px;
  .card-wrapper {
    display: flex;
    flex-direction: column;
    height: 100%;
    flex-grow: 1;
    padding: 4rem 13% 2.2rem;

    .close {
      position: absolute;
      right: 15px;
      top: 15px;
      width: 32px;
      height: 32px;
      cursor: pointer;
      transition: 0.35s ease;

      &:hover {
        &::before,
        &::after {
          background-color: #dd5656;
        }
      }

      &:before,
      &:after {
        transition: 0.3s ease;
        position: absolute;
        left: 15px;
        content: " ";
        height: 33px;
        width: 2px;
        background-color: white;
      }

      &:before {
        transform: rotate(45deg);
      }

      &:after {
        transform: rotate(-45deg);
      }
    }

    .title,
    .message,
    .author {
      color: white;
      font-size: 2.5rem;
      margin: 0;
    }

    .title {
      font-size: 2.6rem;
      margin-bottom: 2.7rem;
    }

    .message {
      font-size: 2rem;
    }

    .author {
      font-style: italic;
      font-size: 2.4rem;
      margin-left: auto;
      margin-top: auto;
    }
  }
}
</style>
