function mint () {
  cd ~/development/mint-velvet/$1
}

function mvhq () {
  cd ~/development/mint-velvet/applications/mvhq/$1
}


function fashion () {
  cd ~/development/newin/myfashioninbox2
}

function ape () {
  cd ~/development/mint-velvet/projects/mailchimp/apebuilder
}

function engage () {
  cd ~/development/mint-velvet/applications/mint-engage
}

function outfits () {
  cd ~/development/mint-velvet/applications/outfits
}

function spacetalk () {
  cd ~/code/meteor/SpaceTalk
}

function ape () {
  cd ~/development/mint-velvet/projects/mailchimp/apebuilder
}

function engage () {
  cd ~/development/mint-velvet/applications/mint-engage
}

function outfits () {
  cd ~/development/mint-velvet/applications/outfits
}

function spacetalk () {
  cd ~/code/meteor/SpaceTalk
}

function zoom_image () {
# typeset -a product_ids
  prefix="http://www.mintvelvet.co.uk/pws/client/images/responsive/catalogue/$1/1200px/"
  wget ${prefix}$1.jpg
  for i in {1..3}
  do
    wget ${prefix}$1_${i}.jpg
  done
}

function proto () {
  cd ~/code/meteor/prototyping
}

function focuster () {
  cd ~/development/focuster
}
