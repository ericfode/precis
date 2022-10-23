|%
+$  target       @p                         :: Who is the target of this point
+$  witness      (set @p)                   :: Who witnessed this point
+$  evidence     @t                         :: What evidence is this point based on
+$  score        @ud
+$  index        @u
+$  aspect
  $:  tag=@tas
      desc=cord
  ==
+$  point                         :: The point itself
  $:  =index
      =target 
      =witness 
      =evidence 
      aspect-tag=@tas             :: The tag the of aspect the point relates to         
      =score
  ==
+$  insight                        :: One who makes a claim about point
  $:  point-index=index
      details=@t
      position=?
      confidence=@ud
  ==
::  Actions that precis responds too
::
+$  action                         ::
  $%  [%see =point]               :: For when reputation is logged 
      [%espy =insight]             :: For when someone echos or disagrees a point
      [%declare =aspect]
  ==
+$  logged  (pair @ action)        :: Holds an action that happened at a time
+$  update
  %+  pair  @
  $%  [%dot (list point)]       :: A list of all of the dots up to @ (time)
      [%aspects (list aspect)]
      [%logs (list logged)]    :: A list of all of the logs up to @ (time)
  ==
::  Types for the agent state
::
+$  collector  ((mop index point) gth)         :: All points in ascending order (newest first)
+$  aspects   (map @tas aspect)
+$  log       ((mop @ action) lth)       :: All points actions in descending order (oldest first)
--