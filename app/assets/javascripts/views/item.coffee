#= require templates/item

namespace "InStock.Views", (Views) ->
  class Views.Item extends Backbone.View
    className: 'item'

    events:
      'click .save': 'updateItem'
      'click .remove': 'removeItem'
      'keydown .name': 'blurField'

    initialize: ->
      @model.on 'remove', (model) =>
        @$el.css
          opacity: 0

        _.delay =>
          @$el.remove()
        , 200

    blurField: (e) ->
      $(e.currentTarget).blur() if e.keyCode is 13

    removeItem: ->
      @model.destroy()

    updateItem: ->
      name = @$('.name').text()
      quantity = @$('.quantity').val()

      @model.save
        name: name
        quantity: quantity

    render: =>
      @$el.html JST['item'](@model.toJSON())

      return @
