" my filetype file
if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  au! BufRead,BufNewFile *.fun		setfiletype funtype
  au! BufRead,BufNewFile *.erb		setfiletype erb
augroup END
