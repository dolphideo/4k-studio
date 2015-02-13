#isotope filter portfolio2:
$('.sf-da-isotope').isotope
  itemSelector: '.sf-da-item'
  layoutMode: 'fitRows'
# filter items when filter link is clicked:
$('#da-filters a').click ->
  selector = $(this).attr('data-filter')
  $('.sf-da-isotope').isotope filter: selector
  $('.sf-da-isotope-filters li').removeClass 'active'
  $(this).closest('li').addClass 'active'
  false
$(' #da-thumbs > li ').each ->
  $(this).hoverdir()
  return
#isotope filter options:
$('.sf-isotope').isotope
  itemSelector: '#portfolio .wrapper'
  layoutMode: 'fitRows'
$(window).resize()
$container = $('.sf-isotope')
$container.isotope
  resizable: false
  masonry: columnWidth: $container.width() / 5
# isotope - update columnWidth on window resize
$(window).smartresize ->
  $container.isotope masonry: columnWidth: $container.width() / 5
  return
# isotope - filter items when filter link is clicked:
$('#filters a').click ->
  selector = $(this).attr('data-filter')
  $('.sf-isotope').isotope filter: selector
  $('.sf-isotope-filters li').removeClass 'active'
  $(this).closest('li').addClass 'active'
  false
# portfolio sf item hover:
$('.sf-item').hover (->
  $(this).children().children('.sf-item-overlay').stop(true, true).animate { 'opacity': '1' }, 400
  $(this).children().children('.sf-item-text').stop(true, true).animate { 'color': '#FFFFFF' }, 400
  return
), ->
  $(this).children().children('.sf-item-overlay').stop(true, true).animate { 'opacity': '0' }, 400
  $(this).children().children('.sf-item-text').stop(true, true).animate { 'color': '#222222' }, 400
  return
