#= require templates/item

namespace "InStock.Views", (Views) ->
  class Views.ItemManager extends Backbone.View
    className: 'item_manager'

    events:
      'click .add' : 'create'

    initialize: ->
      @collection = new InStock.Models.ItemsCollection

      @collection.on 'reset', (c) =>
        c.each(@add)

      @collection.fetch()

    create: =>
      model = @collection.create()

      @add(model)

    add: (model) =>
      view = new InStock.Views.Item
        model: model

      el = view.render().$el

      @$('.items').append(el)

      # css transitions
      _.defer ->
        el.css
          opacity: 1

    render: =>
      @$el.html JST['item_manager']()

      return @
