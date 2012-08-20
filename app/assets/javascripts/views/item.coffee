#= require templates/item

namespace "InStock.Views", (Views) ->
  class Views.Item extends Views.Base
    className: 'item'

    events:
      'click .save': 'updateItem'
      'click .remove': 'removeItem'
      'keydown .search_term': 'searchAmazonReturn'
      'click .search': 'searchAmazon'
      'keydown .name': 'blurField'

    externalEvents:
      'updateAmazonInfo': 'updateAmazonInfo'

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

    searchAmazonReturn: (e) =>
      if e.keyCode is 13
        @searchAmazon()

    searchAmazon: =>
      searchResults = new InStock.Models.SearchResultsCollection

      searchResults.on 'reset', (collection) =>
        @$('.search_result').remove()

        collection.each (model) =>
          view = new InStock.Views.SearchResult
            model: model
            itemId: @model.id

          @$el.append(view.render().$el)

      searchResults.fetch
        data:
          search: @$('.search_term').val()
        processData: true

    updateAmazonInfo: (itemId, amazonId, image) =>
      if itemId is @model.id
        @model.set
          amazon_id: amazonId
          image_url: image

        @updateItem()

    updateItem: ->
      name = @$('.name').text()
      quantity = @$('.quantity').val()
      reorderThreshold = @$('.reorder_threshold').val()

      @model.save
        name: name
        quantity: quantity
        reorder_threshold: reorderThreshold

    render: =>
      @$el.html JST['item'](@model.toJSON())

      return @
