let s:x="𝕏"
let s:t="twitter"
let s:s=10
let s:flag=v:false

function twitter_x#Replace()
  let p=getcurpos()
  execute "%s/".s:t."/".s:x."/g"
  call cursor(p[1],p[2])
endfunction

function twitter_x#Start()
  let s:flag=v:true
  call timer_start(s:s,function("s:loop"))
endfunction

function twitter_x#Stop()
  let s:flag=v:false
endfunction

function s:loop(timer)
  try
    call twitter_x#Replace()
  catch
  endtry
  if s:flag
    call timer_start(s:s,function("s:loop"))
  endif
endfunction
