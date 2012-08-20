#= require templates/search_result

namespace "InStock.Views", (Views) ->
  class Views.SearchResult extends Backbone.View
    className: 'search_result'

    events:
      'click .select': 'selectItem'

    initialize: (options) ->
      @itemId = options.itemId

    render: =>
      @$el.html JST['search_result'](@model.toJSON())

      return @

    selectItem: (e) =>
      InStock.ItemManager.eventBus.trigger 'updateAmazonInfo', @itemId, @model.get('amazon_id'), @model.get('image')
