#add each topic folder to fpath so that they can add functions and completion scripts
for topic_folder ($DOTFILES/*) if [ -d $topic_folder ]; then  fpath=($topic_folder $fpath); fi;

# add our functions directory to fpath
fpath=($DOTFILES/functions $fpath)
