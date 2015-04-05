class Common
  defaults:
    contactForm: 'form#kontakt'
    unclickable: '.unclickable'
    fancySelect: '.fancySelect'
    tips: '[data-tip]'
    spinnerIncrease: '.spinner-wrapper .increase'
    spinnerDecrease: '.spinner-wrapper .decrease'

  constructor: (options) ->
    @setOptions options

    @element =
      $contactForm: $(@options.contactForm)
      $unclickable: $(@options.unclickable)
      $fancySelect: $(@options.fancySelect)
      $tips: $(@options.tips)
      $spinnerIncrease: $(@options.spinnerIncrease)
      $spinnerDecrease: $(@options.spinnerDecrease)

    @unclickable()
    @initTip tip for tip in @element.$tips
    # @validate()
    # @datepicker()
    @bxSliderHeader()
    @sliderClients()
    @accordion()
    @parralax()

  parralax: ->
    # console.log("ScrollMagic v%s loaded", ScrollMagic.version)

    controller = new (ScrollMagic.Controller)(globalSceneOptions:
      triggerHook: 'onEnter'
      duration: '200%')

    scene = new (ScrollMagic.Scene)(triggerElement: '#clients').setTween('#clients .bcg',
      y: '50%'
      ease: Linear.easeNone).addTo(controller)

    scene2 = new (ScrollMagic.Scene)(triggerElement: '#contact').setTween('#contact .bcg',
      y: '50%'
      ease: Linear.easeNone).addTo(controller)

  bxSliderHeader: ->
    $('#tagline').bxSlider(
      adaptiveHeight: false
      controls: false
      auto: true
      autoHover: true
      speed: 500
      pause: 2500
      )

  sliderClients: ->
    $('#clients .owl-carousel').owlCarousel(
      autoplay: true
      autoplayTimeout: 2500
      autoplayHoverPause:false
      loop:true
      responsiveClass: true
      responsive:
        0:
          items: 1
        600:
          items: 2
        1000:
          items: 3
      )

  accordion: ->
    $('#accordion').accordion(
      header: "h3"
      heightStyle: "content"
      )

  datepicker: ->
    $('.datepicker').datepicker(
      format: 'DD, dd MM yyyy'
      weekStart: 1
      language: 'pl'
    )

  validate: ->
    $(@element.$contactForm).validate
      invalidHandler: (event, validator) ->
        errors = validator.numberOfInvalids()
        if errors
          message = (if errors is 1 then "W jednym polu pojawił się błąd. Popraw go proszę." else "W " + errors + " polach pojawił się błąd. Popraw je proszę.")
          $("div.error span").html message
          $("div.error").show()
        else
          $("div.error").hide()

      rules:
        email:
          required: true
          email: true
        name:
          required: true

      messages:
        email:
          required: "Potrzebujemy adresu email, aby się skontaktować."
          email: "Twój email ma zły format."
        name: "Do kogo mamy się odezwać?"

  unclickable: ->
    @element.$unclickable.click (event) ->
      event.preventDefault()
    return

  initTip: (tip) ->
    $tip = $(tip)
    id = $tip.data 'tip'

    $tip.tipTip(
      content: $("##{id}")
      maxWidth: 'auto'
      edgeOffset: 5
    )
    return


  setOptions: (options) ->
    @options = @merge {}, @defaults, options
    this

  merge: (target, extensions...) ->
    for extension in extensions
      for own property of extension
        target[property] = extension[property]
    target


$(document).ready -> new Common