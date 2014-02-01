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
#    @fancySelect()
#    @numberSpinner()
    @initTip tip for tip in @element.$tips
    @validate()
    @datepicker()


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

#  fancySelect: ->
#    @element.$fancySelect.fancySelect() if @element.$fancySelect.length
#    return

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

#  numberSpinner: ->
#    @element.$spinnerIncrease.click @onIncreaseClick
#    @element.$spinnerDecrease.click @onDecreaseClick
#
#  onIncreaseClick: (event) ->
#    event.preventDefault()
#    box = $(event.target).parent().parent().find('input[type="number"]')
#    value = box.val()
#    if box.attr('data-top-limit')
#      if value < parseInt(box.attr('data-top-limit'))
#        value++
#    else
#      value++
#    box.val value
#
#  onDecreaseClick: (event) ->
#    event.preventDefault()
#    box = $(event.target).parent().parent().find('input[type="number"]')
#    value = box.val()
#    if value > 1
#      value--
#    box.val value

$(document).ready -> new Common