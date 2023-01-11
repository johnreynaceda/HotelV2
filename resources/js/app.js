import './bootstrap'

import Alpine from 'alpinejs'
import autoAnimate from '@formkit/auto-animate'
import focus from '@alpinejs/focus'

window.Alpine = Alpine
Alpine.directive('animate', (el) => {
  autoAnimate(el)
})
// Alpine.plugin(focus)

Alpine.start()
