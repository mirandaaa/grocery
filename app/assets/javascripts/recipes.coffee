# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $(document).on 'click', '.remove-fields', (event) ->
    # If there's only one left don't allow
    debugger;
    t = $(this).closest('.new-item-fields')
    t.remove()
    $(t).find("input").attr("id").remove()
    event.preventDefault()

  $(document).on 'click', '.add-fields', (event) ->
    count = $('.new-item-fields').length
    field = $('.new-item-fields').last().clone().find('input') .val('').end()
                        .find('input')
                            .prop({id: 'item' + count, name: 'items[][name]'  })
                                .end()
                                  .find('select')
                                    .prop({id: 'item' + count + '_category', name: 'items[][category]'  })
                                      .end()
    $('#items').prepend(field)
    event.preventDefault()
