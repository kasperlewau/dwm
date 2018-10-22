let SessionLoad = 1
if &cp | set nocp | endif
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/code/c/dwm
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +1 ~/code/c/dwm
badd +1 dwm.c
badd +125 config.h
badd +1 util.c
badd +226 drw.c
badd +32 transient.c
badd +1 util.o
badd +1 drw.o
badd +1 config.mk
badd +1 BUGS
badd +1 TODO
badd +1 util.h
badd +1 ~/.vimrc
argglobal
silent! argdel *
$argadd ~/code/c/dwm
edit dwm.c
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 154 + 155) / 310)
exe 'vert 2resize ' . ((&columns * 155 + 155) / 310)
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 372 - ((31 * winheight(0) + 37) / 75)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
372
normal! 08|
lcd ~/code/c/dwm
wincmd w
argglobal
if bufexists('~/code/c/dwm/config.h') | buffer ~/code/c/dwm/config.h | else | edit ~/code/c/dwm/config.h | endif
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 13 - ((7 * winheight(0) + 37) / 75)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
13
normal! 0
lcd ~/code/c/dwm
wincmd w
2wincmd w
exe 'vert 1resize ' . ((&columns * 154 + 155) / 310)
exe 'vert 2resize ' . ((&columns * 155 + 155) / 310)
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToO
set winminheight=1 winminwidth=1
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
let g:this_session = v:this_session
let g:this_obsession = v:this_session
let g:this_obsession_status = 2
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
