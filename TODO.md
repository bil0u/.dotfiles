## Todo

Resources:

- Remove bloatware + elevate as admin _([link](https://raw.githubusercontent.com/Sycnex/Windows10Debloater/master/Windows10DebloaterGUI.ps1))_

#### Global

- [ ] Finish writing documentation
- [ ] Propose to keep existing computer name if not set to default
- [ ] Big refacto:
  1.  split scripts into the smallest units possible
      - take advantage of chezmoi scripts order
      - easier to debug
      - each script only execute if config is found in [.chezmoidata](/home/.chezmoidata.yaml), which allow to enable or disable scripts just by commenting a few lines in the file
  2.  documentation:
      - each script documented with possible configuration and synopsis
      - per platform general overview, linking to script docs
      - config documentation: each key is mapped to the corresponding script docs where it's used

#### macOS

- ☕️ **Homebrew**
  - [ ] Add [clop](https://lowtechguys.com/clop/) cask to personal tap
  - [ ] Add [rcmd](https://lowtechguys.com/rcmd/) cask to personal tap
  - [ ] Add [volum](https://lowtechguys.com/volum/) cask to personal tap
- 🤖 **Scripts**
  - [ ] set default browser
  - [ ] unquaratine installed apps using `sudo xattr -rd com.apple.quarantine /Applications/LockedApp.app`
- ✨ **Cosmetic**
  - [ ] Set Dock icons
  - [ ] Set Mission control icons
- ⚙️ **Apps settings**
  - [ ] adguard
  - [ ] arduino
  - [ ] browserosaurus
  - [ ] chromedriver
  - [ ] discord
  - [ ] docker
  - [ ] figma
  - [ ] firefox
  - [ ] google-chrome
  - [ ] handbrake
  - [ ] iconjar
  - [ ] iina
  - [x] iterm2
  - [ ] lepton
  - [ ] lunar
  - [ ] microsoft-auto-update
  - [ ] microsoft-word
  - [ ] microsoft-excel
  - [ ] microsoft-powerpoint
  - [ ] microsoft-teams
  - [ ] nordvpn
  - [ ] notion
  - [ ] nzbget
  - [ ] oracle-jdk
  - [ ] postman
  - [ ] protonmail-bridge
  - [ ] shapr3d
  - [ ] slack
  - [ ] teamviewer
  - [ ] the-unarchiver
  - [ ] tor-browser
  - [ ] transmission
  - [ ] vanilla
  - [ ] visual-studio-code
  - [ ] whatsapp
  - [ ] xmind
  - [ ] zoom
  - [ ] utm
  - Auto fetch & update [spice guest tools](https://github.com/utmapp/qemu/releases/download/v6.2.0-utm/spice-guest-tools-0.164.3.iso) using `.chezmoiexternal.yaml`

#### Windows

- ✨ Cosmetics
  - [ ] Taskbar
  - [ ] Shortcuts
- ⚙️ Settings
  - [ ] Keyboard & language
  - [ ] Apps
    - [ ] Powertoys
- 📀 Install extras applications
  - [ ] Windows features
  - [ ] Drivers
  - [ ] Applications
  - [ ] Games
- 🗃 Misc
  - [ ] Files associations
  - [ ] Powershell profile
  - [ ] Create a restore point : Checkpoint-Computer -Description "Clean install" -RestorePointType "MODIFY_SETTINGS" # Create a restore point
