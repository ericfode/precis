/-  p=precis, post
/+  *test, precis, graph-store
|%
++  empty-point  *point.p
++  point-with-data  =/  pt=point.p  empty-point  pt(aspect-tag %test, score 10)
++  cycle-point
  |=  [test-p=point.p]
  =/  test-contents=(list content.post)
    %-  make-point-contents:precis  test-p
  =/  test-post=indexed-post.post
    [a=~ p=(post:create:graph-store ~ test-contents)]
  =/  inverted-point=(unit point.p)
    %-  indexed-post-to-point:precis  test-post
  ?~  inverted-point
    ~|("make-point-contents:precis failed" !!)
  u.inverted-point
++  test-cycle-point-with-no-data
  =/  this-p  empty-point
  %+  expect-eq
    !>  %-  point.p  this-p
    !>  %-  cycle-point  this-p
++  test-cycle-point-with-data
  %+  expect-eq
    !>  %-  point.p  point-with-data
    !>  %-  cycle-point  point-with-data        
--