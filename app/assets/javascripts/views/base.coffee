namespace "InStock.Views", (Views) ->
  class Views.Base extends Backbone.View
    className: 'search_result'

    delegateEvents: (events) =>
      super

      @externalEvents ||= {}

      for action, handler of @externalEvents
        InStock.ItemManager.eventBus.on action, _.bind @[handler], @
