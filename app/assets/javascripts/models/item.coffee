namespace "InStock.Models", (Models) ->
  class Models.Item extends Backbone.Model

  class Models.ItemsCollection extends Backbone.Collection
    model: Models.Item

    url: ->
      '/items'
