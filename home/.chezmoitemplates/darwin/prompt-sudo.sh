prompt "Please enter sudo password to run this script (press Ctrl+C to exit)"
sudo -v

# Keep-alive: update existing `sudo` time stamp until script has finished
while true; do
    sudo -n true
    sleep 60
    kill -0 "$$" || exit
done 2>/dev/null &
