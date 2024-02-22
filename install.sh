echo Welcome to the Fluorine setup.
echo This only runs as intended on Arch based distros.
echo Make sure that X11 is installed!
echo  
printf 'Do you want to install the Fluorine desktop? (y/n)? '
old_stty_cfg=$(stty -g)
stty raw -echo ; answer=$(head -c 1) ; stty $old_stty_cfg
if [ "$answer" != "${answer#[Yy]}" ];then
    echo  
    echo Installing packages, cancel if they are already installed.
    sudo pacman -S openbox tint2 xwallpaper pcmanfm xorg-xinit
    echo  
    echo Make sure that you have installed the required dependencies!
    clear
    echo To proceed with installation, press enter.
    echo This will overwrite various configuration files relating to Openbox, X11, and Tint2!
    echo If you do not want to continue, exit this window or do Ctrl+C.
    echo 
    read -p "Continue with installation? " -n 1 -r
    clear
    echo Extracting...
    unzip fluorine.zip
    echo Making directories, errors may appear if they exist...
    mkdir ~/.config
    mkdir ~/.config/tint2
    mkdir ~/.config/fluorine
    mkdir ~/.config/jgmenu
    mkdir ~/.config/openbox
    cp .xinitrc ~/.xinitrc
    cp -r .config/fluorine/background.png ~/.config/fluorine/background.png
    cp -r .config/tint2/tint2rc ~/.config/tint2/tint2rc
    cp -r .config/openbox/rc.xml ~/.config/openbox/rc.xml
    cp -r .config/openbox/environment ~/.config/openbox/environment
    clear
    echo Installation complete!
    echo Fluorine can now be started by running "startx" in any tty.
    exit
else
    clear
    echo Installation aborted.
    exit
fi
