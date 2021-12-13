#!/bin/env bash

#install tools
echo "you must be root to run this script"

echo "install gui support"
sudo xpbs-install -S xorg elecritty awesome 

echo "install cool tools"
sudo xpbs-install -S vim git neofetch zsh mpv htopbmon wget nnn nmap cmatrix fzf tmux nodm exagcc make font-inconsolata-otf zathura-pdf-mupdf 

echo "install firefox && arandr"
sudo xpbs-install -S firefox arandr 

#AUTO startx
autolog () {

    cat >> /etc/zsh/zprofile <<- _EOF_
        # autologin on tty1
        if [ -z "$DISPLAY" ] && [ "$(fgconsole)" -eq 1 ]; then
        exec startx
        fi
    _EOF_ 
}


#.Dotfiles .xinitrc .zshrc .vimrc 
dot () {

    cp -r $HOME/void/. ~/
    
    #Setup nodm
    cp -r conf /etc/sv/nodm
    cd /etc/sv/nodm
    chmod +x conf
    sudo ln -s /etc/sv/nodm /var/service
    cd $HOME
}


#vim and oh my zsh
config () {                                                                                                                                              curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim                                sleep 2                                            wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
}



themes () {
    cat > $HOME/.oh-my-zsh/custom/themes/aditya.zsh-theme <<- _EOF_
    │   # Default OMZ theme

    │   if [[ "\$USER" == "root" ]]; then
    │     PROMPT="%(?:%{\$fg_bold[red]%}%{\$fg_bold[yellow]%}%{\$fg_bold[red]%} :%{\$fg_bold[red]%} )"
    │     PROMPT+='%{\$fg[cyan]%}  %c%{\$reset_color%} \$(git_prompt_info)'
    │   else
    │     PROMPT="%(?:%{\$fg_bold[red]%}%{\$fg_bold[green]%}%{\$fg_bold[yellow]%} :%{\$fg_bold[red]%} )"
    │     PROMPT+='%{\$fg[cyan]%}  %c%{\$reset_color%} \$(git_prompt_info)'
    │   fi

    │   ZSH_THEME_GIT_PROMPT_PREFIX="%{\$fg_bold[blue]%}  git:(%{\$fg[red]%}"
    │   ZSH_THEME_GIT_PROMPT_SUFFIX="%{\$reset_color%} "
    │   ZSH_THEME_GIT_PROMPT_DIRTY="%{\$fg[blue]%}) %{\$fg[yellow]%}✗"
    │   ZSH_THEME_GIT_PROMPT_CLEAN="%{\$fg[blue]%})"
    _EOF_

}

install () {

    autolog
    config
    dot
    themes
}

## Main
if [[ "$1" == "--install" ]]; then
    install
else
    echo "please input >> --install"
fi

