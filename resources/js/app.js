import './bootstrap'

import Alpine from 'alpinejs'
import autoAnimate from '@formkit/auto-animate'
import FormsAlpinePlugin from '../../vendor/filament/forms/dist/module.esm'
import NotificationsAlpinePlugin from '../../vendor/filament/notifications/dist/module.esm'
import focus from '@alpinejs/focus'
import collapse from '@alpinejs/collapse'

Alpine.plugin(collapse)
Alpine.plugin(FormsAlpinePlugin)
Alpine.plugin(NotificationsAlpinePlugin)
window.Alpine = Alpine
Alpine.directive('animate', (el) => {
  autoAnimate(el)
})
// Alpine.plugin(focus)

Alpine.start()
