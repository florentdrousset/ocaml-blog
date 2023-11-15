let () =
  Dream.run 
  @@ Dream.logger
  @@ Dream.router [
    Dream.get "/"
      (fun request ->
        Dream.log "Sending greeting to %s" (Dream.client request);
        Dream.html "Hi";
      );
  ]
