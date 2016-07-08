dep 'homebrew' do
  require 'brew'
  met? {
    shell "dscl -q . -read /Groups/brew RealName 2> /dev/null"
  }
  meet {
    log "Group creation requires superuser priviledges"
    sudo "dscl . create /Groups/brew"
    sudo "dscl . create /Groups/brew RealName HomeBrew"
    sudo "dscl . create /Groups/brew gid 599"
    sudo "dscl . passwd /Groups/brew \"*\""
    sudo "sudo chgrp -R brew /usr/local"
    sudo "sudo chmod -R g+w /usr/local"
    sudo "sudo chgrp -R brew /Library/Caches/Homebrew"
    sudo "sudo chmod -R g+w /Library/Caches/Homebrew"
  }
end
