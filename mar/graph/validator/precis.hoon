/-  *post, graph=graph-store, *precis
/+  p=precis
=>
|%
++  is-target-valid
  |=  [target=@tas]
  ^-  ?
  %.y
--
|_  i=indexed-post
++  grow
  |%
  ++  noun  i
  ::
  ++  notification-kind  `[%message [0 1] %count %none]
  ::
  ++  graph-indexed-post
    ^-  indexed-post
    ?+  index.p.i  !!
    
    :: ::  top level node : point
    :: ::  structural node
    :: ::  @p target
          [%in ~]
        ~|  "top level point node should be empty"
        ?>  ?=(~ contents.p.i)
        i
    ::  The actual point node indexed by its time
          [%in @ ~]
        =/  contents  contents.p.i
        =/  mpoint=(unit point)  (indexed-post-to-point:p i)
        ?~  mpoint
          ~|  "somehow the stored point was invalid"
          !!
        i
    :: ==
      
    ==
  --
++  grab
  |%
  ++  noun  indexed-post
  --
++  grad  %noun
--