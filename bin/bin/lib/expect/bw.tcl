proc bitwarden_vault_status {} {
  spawn sh -c "bw status | jq -r .status"
  expect {
    -re "((un)?locked)\r\n" { return $expect_out(1,string) }
    "unauthenticated" { 
      send_user "Bitwarden is not currently logged in. Log in before you attempt to unlock"
      exit 1
    }
  }
}

proc bitwarden_unlock {} {
  set vault_status [bitwarden_vault_status]

  if {$vault_status == ""} {
    send_user "Bitwarden Vault Status Unknown. Exiting."
    exit 1
  }

  if {[info exists ::env(BW_SESSION)] && $vault_status == "unlocked"} {
    return $::env(BW_SESSION)
  }

  stty -echo
  send_user "Enter Bitwarden Master Password: "
  expect_user -re "(.*)\n"
  send_user "\n"
  stty echo

  set ::env(BW_PASS) $expect_out(1,string)
  spawn bw unlock --raw --passwordenv BW_PASS
  expect {
    -re "(.*)\n" { set session $expect_out(buffer) }
    "Invalid master password." { exit 1 }
    timeout abort
  }
  unset ::env(BW_PASS)

  if {$session == "" && [info exists ::env(BW_SESSION)]} {
    unset ::env(BW_SESSION)
  } else {
    set ::env(BW_SESSION) $session
  }

  return $session
}

proc select_bw_entry {} {
  if {$vault_status == "" } {
    send_user "Bitwarden Vault Status Unknown. Exiting."
    exit 1
  }

  if {$vault_status == "locked"} {
    bitwarden_unlock
  }

  set match_max 10000000
  set vault_items {}

  spawn bash -c "bw --nointeraction list items | jq --unbuffered --raw-output '.\[\].name'"
  expect {
    {Vault is locked.} { 
      send_user "Bitwarden Vault is locked"
      exit 1 
    }
    -re {(.*)\r\n} { append vault_items $expect_out(1,string); exp_continue }
  }

  set bw_entry [exec sh -c "echo \"$vault_items\" | fzf --reverse --height 40%"]

  return $bw_entry
}
