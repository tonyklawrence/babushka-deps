dep 'create user account' do
  require 'homebrew'
  met? {
    shell "dscl -q . -read /Users/tony RealName 2> /dev/null"
  }
  meet {
    log "Account creation requires superuser priviledges"
    sudo "dscl . create /Users/tony"
    sudo "dscl . create /Users/tony UserShell /bin/bash"
    sudo "dscl . create /Users/tony RealName 'Tony Lawrence'"
    sudo "dscl . create /Users/tony UniqueID 555"
    sudo "dscl . create /Users/tony PrimaryGroupID 1000"
    sudo "dscl . create /Users/tony NFSHomeDirectory /Local/Users/tony"
    sudo "dscl . passwd /Users/tony password"
    sudo "dscl . append /Groups/brew GroupMembership tony"
  }
end
