#= require controllers/editor

((plunker) ->
  
  
  $.extend $.gritter.options,
    position: "bottom-right"
  
  plunker = _.defaults (@plunker or {}),
    mediator: _.extend {}, Backbone.Events
    models: {}
    views: {}
    controllers: {}
  
    
  $ ->
    # Controller for the editor environment
    plunker.controller = new plunker.EditorController
    
    window._gaq ||= []
    plunker.mediator.on "event:import", (json, source) -> _gaq.push ["_trackEvent", "Editor", "Import", source]
    plunker.mediator.on "event:load", (plunk, id) -> _gaq.push ["_trackEvent", "Editor", "Load", id]
    plunker.mediator.on "event:save", (plunk) -> _gaq.push ["_trackEvent", "Editor", "Save", plunk.id]
    plunker.mediator.on "event:delete", (plunk) -> _gaq.push ["_trackEvent", "Editor", "Delete", plunk.id]
    plunker.mediator.on "event:preview-enable", (plunk) -> _gaq.push ["_trackEvent", "Preview", "Preview", plunk.id]
    
    plunker.mediator.trigger "intent:reset"
    
    Backbone.history.start
      pushState: true

  
)(@plunker ||= {})