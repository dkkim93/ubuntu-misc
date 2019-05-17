# Path to your oh-my-zsh installation.
export ZSH=/home/dongki/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-256color)

source $ZSH/oh-my-zsh.sh

# Aliases
alias matlab='LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.21 /usr/local/bin/matlab -desktop'
alias op='xdg-open'
alias pip='pip2'
alias python3='python3.6'
alias cdw='cd /home/dongki/research/lids/git/2019-hierarchical-teach-v2/2018-hierarchical-teach'
# alias cdw='cd /home/dongki/research/lids/git/opponent-modeling/opponent-modeling'
alias journal='cd /home/dongki/research/lids/git/2017-avrl/branch/journal/src/tensorflow/GA3C'

# For oh-my-zsh
# ref: https://gist.github.com/renshuki/3cf3de6e7f00fa7e744a
eval `dircolors ~/.dir_colors/dircolors`

# For cuda-8.0
export PATH=/usr/local/cuda-8.0/bin${PATH:+:${PATH}} 
export LD_LIBRARY_PATH=/usr/local/cuda-8.0/lib64\${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

# For history
HISTFILE=~/.zsh_history
HISTSIZE=999999
SAVEHIST=$HISTSIZE

# Prevent duplicates in history
setopt hist_ignore_all_dups hist_save_nodups

# # For ros-kenetic
# source /opt/ros/kinetic/setup.zsh

# Python path for custom pkg
# export PYTHONPATH=$PYTHONPATH:/home/dongki/research/lids/git/2018-hierarchical-teach/2018-hierarchical-teach/thirdparty/multiagent-particle-envs

# IBM cloud
. /usr/local/ibmcloud/bx/zsh_autocomplete
source ~/research/ibm/set_env_vars.sh
alias bxaws='aws --profile dongki --endpoint-url=http://s3-api.us-geo.objectstorage.softlayer.net'

# Mujoco
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/dongki/.mujoco/mjpro150/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/nvidia-384
export LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libGLEW.so.1.13

# # Rllab
# export PYTHONPATH=/home/dongki/library/rllab:$PYTHONPATH

# # For CASL
# export LD_PRELOAD='/usr/lib/libtcmalloc_minimal.so.4'

# For hiding user@hostname in zshrc
DEFAULT_USER=`whoami`

# For zsh autocomplete
# ref: https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md
# Find color at: https://upload.wikimedia.org/wikipedia/commons/1/15/Xterm_256color_chart.svg
source ~/.oh-my-zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=241"

# # For syntax highlight
# source ~/.oh-my-zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
