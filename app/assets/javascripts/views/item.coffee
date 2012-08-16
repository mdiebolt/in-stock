#= require templates/item

namespace "InStock.Views", (Views) ->
  class Views.Item extends Backbone.View
    className: 'item'

    render: =>
      @$el.html JST['item'](@model.toJSON())

      return @
