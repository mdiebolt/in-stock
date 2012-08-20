namespace "InStock.Models", (Models) ->
  class Models.SearchResult extends Backbone.Model

  class Models.SearchResultsCollection extends Backbone.Collection
    model: Models.SearchResult

    url: ->
      '/items/search'
