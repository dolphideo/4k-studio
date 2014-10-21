class Maps
  constructor: (options) ->
    @setOptions options
    @googleMaps()

  googleMaps: ->
    map = undefined
    position = new google.maps.LatLng(52.21108, 21.01273)

    pinIcon = new google.maps.MarkerImage(
      '../assets/images/dolphin-icon.png'
      null,
      null,
      null,
      new google.maps.Size(40, 40))

    mapOptions =
      center: position
      zoom: 14

    map = new google.maps.Map(document.getElementById("map"), mapOptions)

    marker = new google.maps.Marker
      position: position
      map: map
      title: '4K Studio'
      icon: pinIcon
      animation: google.maps.Animation.DROP

    contentString = '<div id="mapContent"><h1 id="firstHeading">4K Studio Karol Flont</h1><p>Może jakiś opis?</p></div>'

    infowindow = new google.maps.InfoWindow
      content: contentString

    google.maps.event.addListener marker, 'click', ->
      infowindow.open map, marker

  setOptions: (options) ->
    @options = @merge {}, @defaults, options
    this

  merge: (target, extensions...) ->
    for extension in extensions
      for own property of extension
        target[property] = extension[property]
    target

$ -> new Maps if $('#ekipa-i-kontakt').length