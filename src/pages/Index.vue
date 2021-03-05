<template>
  <q-page padding>
    <div class="text-right">
      <a href="https://github.com/danielrataj/agileretro.fun" title="GitHub" target="_blank">
        <img src="~/assets/icons/github.svg" width="20" height="20" />
      </a>
    </div>
    <div class="window-height window-width row justify-center items-center text-center">
      <div v-if="item">
        <h1 class="text-h2">{{ item.line }}</h1>
        <q-linear-progress color="grey-1" class="q-mt-sm" :value="progress" reverse size="sm" />
      </div>
      <q-inner-loading :showing="loading">
        <q-spinner-ball size="80px" color="primary" />
      </q-inner-loading>
    </div>
  </q-page>
</template>

<script>
const RETRO_FILE_URL = process.env.RETRO_FILE_URL

export default {
  name: 'PageIndex',
  data () {
    return {
      loading: false,
      items: [],
      backupItems: [],
      interval: null,
      progressInterval: null,
      item: null,
      progress: 0
    }
  },
  created () {
    this.loading = true

    setTimeout(async () => {
      await this.fetch()
    }, 500)
  },
  destroyed () {
    clearInterval(this.interval)
    clearInterval(this.progressInterval)
  },
  methods: {
    async fetch () {
      try {
        this.items = await this.$axios.get(`${RETRO_FILE_URL}/${this.$i18n.locale}/retro.json`).then(result => result.data)
        // randomize array
        this.items.sort(() => 0.5 - Math.random())
        this.backupItems = [...this.items]

        this.selectRandom()

        this.setAllIntervals()
      } catch (error) {
        if (error) {
          console.error(error)
        }

        this.$router.push({
          name: 'error.503'
        })
      } finally {
        this.loading = false
      }
    },
    setAllIntervals () {
      this.interval = setInterval(() => {
        this.selectRandom()
        this.progress = 0
      }, 5000)

      this.progressInterval = setInterval(() => {
        this.progress = this.progress + (5 / 500)
      }, 50)
    },
    selectRandom () {
      if (this.items.length === 0) {
        this.items = [...this.backupItems]
      }

      this.item = this.items.shift()
    }
  }
}
</script>
