import './bootstrap'

import Alpine from 'alpinejs'
import autoAnimate from '@formkit/auto-animate'
import focus from '@alpinejs/focus'

Alpine.directive('animate', (el) => {
  autoAnimate(el)
})
window.Alpine = Alpine

Alpine.plugin(focus)

Alpine.start()
