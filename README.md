#Combines Torch7 and phusion/passenger-customizable

This is a Docker image containing Torch7.
See: http://torch.ch


#Installation (Linux):

TMP="$(mktemp -d)"  &&  git clone https://github.com/haukehein/torch7.git "$TMP" --recursive  &&  cd "$TMP"  &&  bash ./build.sh  &&  cd -  &&  rm -rf "$TMP"
 
