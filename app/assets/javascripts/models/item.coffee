namespace "InStock.Models", (Models) ->
  class Models.Item extends Backbone.Model
    defaults:
      name: 'New Item'
      quantity: 0

  class Models.ItemsCollection extends Backbone.Collection
    model: Models.Item

    comparator: (item) ->
      -new Date(item.get('created_at')).getTime()

    url: ->
      '/items'
