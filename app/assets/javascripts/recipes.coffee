# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $(document).on 'click', '.remove-fields', (event) ->
    # If there's only one left don't allow
    $(this).closest('fieldset').remove()
    event.preventDefault()

  $(document).on 'click', '.add-fields', (event) ->
    count = $('.new-item-fields li').length
    field = $('.new-item-fields li').first()
        .clone()
            .find('input')
                .val('')
                    .end()
                        .find('input')
                            .prop({id: 'items_attributes_' + count + '_name', name: 'recipe[items_attributes][' + count + '][name]'  })
                                .end()
                                  .find('select')
                                    .prop({id: 'items_attributes_' + count + '_category_id', name: 'recipe[items_attributes][' + count + '][category_id]'  })
                                      .end()
    $('.new-item-fields').append(field)
    event.preventDefault()
