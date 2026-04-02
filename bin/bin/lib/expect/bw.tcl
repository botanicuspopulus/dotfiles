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
  set ret [catch {exec rbw list} output]

  if {$ret != 0} {
    send_user "rbw vault is locked or agent isn't running.\nRun 'rbw unlock' to unlock the vault"
    exit 1
  }
}

proc select_bw_entry {} {
  bitwarden_unlock

  set bw_entry [exec sh -c "rbw list | grep -i vpn | fzf --reverse --height 40%"]

  if {$bw_entry == ""} {
    send_user "No entry selected. Exiting.\n"
    exit 1
  }

  return $bw_entry
}
