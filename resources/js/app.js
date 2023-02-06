import './bootstrap'

import Alpine from 'alpinejs'
import autoAnimate from '@formkit/auto-animate'
import focus from '@alpinejs/focus'
import collapse from '@alpinejs/collapse'

Alpine.plugin(collapse)

window.Alpine = Alpine
Alpine.directive('animate', (el) => {
  autoAnimate(el)
})
// Alpine.plugin(focus)

Alpine.start()
