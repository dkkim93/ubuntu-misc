### For MuJoCo installation on ACL server
`sudo apt install libosmesa6-dev libgl1-mesa-glx libglfw3 patchelf`

### For enabling history logging with timestamp
Add the following line in `~/.bash_profile`
```
# For saving history with timestamp
# Reference: https://stackoverflow.com/questions/38526588/linux-command-history-with-date-and-time
export HISTTIMEFORMAT="%d/%m/%y %T "
```
