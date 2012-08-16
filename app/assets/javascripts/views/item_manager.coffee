#= require templates/item

namespace "InStock.Views", (Views) ->
  class Views.ItemManager extends Backbone.View
    className: 'item_manager'

    events:
      'click .add' : 'add'

    add: =>
      model = new InStock.Models.Item
      view = new InStock.Views.Item
        model: model

      @$('.items').append(view.render().$el)

    render: =>
      @$el.html JST['item_manager']()

      return @
