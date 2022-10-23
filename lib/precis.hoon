/-  *post, *precis, resource, spider
/+  *graph-store, strandio
|%
++  make-point-contents
    |=  [=point]
    ^-  (list content)
    :~  [%mention target.point]
        [%text evidence.point]
        [%text (cord aspect-tag.point)]
        [%text `@t`(scot %ud score.point)]
    ==

++  indexed-post-to-point
    |=  [=indexed-post]
    ^-  (unit point)
    =/  contents  contents.p.indexed-post
::    ?.  
::      ?=  [[%mention @p] [%text cord] [%text cord] [%text cord] ~] 
::        contents  
::      ~
    ?>  ?&
      ?=  [%mention @p]  -.contents
      ?=  [%text cord]   +<.contents
      ?=  [%text cord]   +>-.contents
      ?=  [%text cord]   +>+<.contents
      ?=  ~              +>+>.contents
    ==
        
    =/  [[@ t=@p] [@ e=cord] [@ a=cord] [@ s=cord] ~]   
      contents
    =|  blank=point
    =:  target.blank      t
        evidence.blank    e
        aspect-tag.blank  ?~  a  %$  (scan (trip a) sym)
        score.blank       (scan (trip s) dem)
    ==
    `blank
    
++  index-to-path
    |=  [idx=index:post]
    ^-  path
    (turn idx (cury scot %ud))

:: ++  create-precis
::     |=  [[owner=ship name=@tas] time-sent=time]
::     ^-  update
::     :-  time-sent
::     :*  %add-graph
::         [owner name]
::         *graph
::         `%graph-validator-precis
::         %n
::     ==
--

