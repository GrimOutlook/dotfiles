# When GUIs aren't working when using WSL this has been a pretty common fix that
# I've needed to do: https://github.com/microsoft/wslg/issues/1192
ln -s /mnt/wslg/.X11-unix/X0 /tmp/.X11-unix/

export PATH+=":/mnt/c/Windows/System32/WindowsPowerShell/v1.0/:/mnt/c/Windows/SysWOW64/"
