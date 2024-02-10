suckless=~/suckless/
config=~/suckless/masterConfig.h
cd $suckless
cp masterConfig.h dwm/
cp masterConfig.h dmenu/
cp masterConfig.h st/
cp masterConfig.h slstatus/
cd dwm
sudo make clean install
cd ../dmenu
sudo make clean install
cd ../st
sudo make clean install
cd ../slstatus
sudo make clean install
