#  Copyright (c) 2012-2017, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

toggleFilterRoles = (event) ->
  target = $(event.target)

  boxes = target.nextUntil('.filter-toggle').find(':checkbox')
  checked = boxes.filter(':checked').length == boxes.length

  boxes.each((el) -> $(this).prop('checked', !checked))
  target.data('checked', !checked)

showAllGroups = (radio) ->
  if radio.checked
    $('.layer, .group').slideDown()

showSameLayerGroups = (radio) ->
  if radio.checked
    $('.layer').hide()
    $('.same-layer').show()
    $('.same-layer .group').slideDown()

showSameGroup = (radio) ->
  if radio.checked
    $('.layer, .group').hide()
    $('.same-layer, .same-group').show()

$(document).on('click', '.filter-toggle', toggleFilterRoles)
$(document).on('change', 'input#kind_deep', (e) -> showAllGroups(e.target))
$(document).on('change', 'input#kind_layer', (e) -> showSameLayerGroups(e.target))
$(document).on('change', 'input#kind_group', (e) -> showSameGroup(e.target))

$(document).on('turbolinks:load', ->
  $('input#kind_deep').each((i, e) -> showAllGroups(e))
  $('input#kind_layer').each((i, e) -> showSameLayerGroups(e))
  $('input#kind_group').each((i, e) -> showSameGroup(e))
)
