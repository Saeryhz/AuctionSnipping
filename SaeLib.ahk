getFH4Status(){
  global FH4PID
  WinGet, FH4PID, PID, ahk_exe ApplicationFrameHost.exe

  if (FH4PID == ""){
    MsgBox, 16, AuctionSnipping, Forza Horizon 4 isn't running.
    ExitApp
  }
  else {
    updateToolTip("Found Forza Horizon 4 on " FH4PID)
    Sleep 1000
  }
}

auctionHouseMenuWarning(){
  i = 8
  while(i>0){
    ToolTip, You have to be on the auction house main menu and have SEARCH CARS MENU PRE-SELECTED else press INSERT to exit. Starting in %i% seconds, 0, 0, 1
    Sleep 1000
    i--
  }
}

updateToolTip(a){
  ToolTip, %a%, 0, 0, 1
}

searchBugattiVeryon(){
  ; TODO : Remove WinActivate and use ControlSend / pid
  WinActivate, ahk_exe ApplicationFrameHost.exe
  WinWaitActive, ahk_exe ApplicationFrameHost.exe
  updateToolTip("Searching Bugatti Veyron for 2.000.000 CR")

  ;menuNavLeft(1) ; Select "Search Cars"
  menuNavEnter(1) ; Enter "Search Cars"
  menuNavUp(7) ; Go to "Make"
  ; ----------------------------------------
  ; EDIT THESES 3 LINES TO YOUR DESIRED CAR AND PRICE
  ; ----------------------------------------
  menuNavRight(19) ; Select "Bugatti"       ; <== EDIT THIS VALUE
  ; ----------------------------------------
  menuNavDown(1) ; Go to "Model"
  ; ----------------------------------------
  menuNavLeft(1) ; Select "Bugatti Veryon"  ; <== EDIT THIS VALUE
  ; ----------------------------------------
  menuNavDown(4) ; Go to "Max Buyout"
  ; ----------------------------------------
  menuNavRight(32) ; Set to 2.000.000 CR    ; <== EDIT THIS VALUE
  ; ----------------------------------------

  menuNavDown(1) ; Select "Confirm"
  menuNavEnter(1) ; Confirm

  Sleep 3000 ; Wait 5 seconds until results

  menuAuctionOptions() ; Auction options
  menuNavDown(1) ; Select "Buy Out"
  menuNavEnter(1) ; Buy out
  Sleep 500 ; Wait confirmation window

  menuNavEnter(1) ; Confirm buy out
  Sleep 5000 ; Wait for potential purchase

  menuNavEnter(1) ; Confirm error, if successful it will stuck at the success window
  menuNavBack(2) ; Back to auction main menu
}

searchBMWM6FE(){
  ; TODO : Remove WinActivate and use ControlSend / pid
  WinActivate, ahk_exe ApplicationFrameHost.exe
  WinWaitActive, ahk_exe ApplicationFrameHost.exe
  updateToolTip("Searching BMW M6'13 FE for 200.000 CR")

  ;menuNavLeft(1) ; Select "Search Cars"
  menuNavEnter(1) ; Enter "Search Cars"
  menuNavUp(7) ; Go to "Make"
  ; ----------------------------------------
  menuNavRight(17) ; Select "BMW"
  ; ----------------------------------------
  menuNavDown(1) ; Go to "Model"
  ; ----------------------------------------
  menuNavLeft(7) ; Select "M6'13 FE"
  ; ----------------------------------------
  menuNavDown(4) ; Go to "Max Buyout"
  ; ----------------------------------------
  menuNavRight(22) ; Set to 200.000 CR
  ; ----------------------------------------

  menuNavDown(1) ; Select "Confirm"
  menuNavEnter(1) ; Confirm

  Sleep 3000 ; Wait 5 seconds until results

  menuAuctionOptions() ; Auction options
  menuNavDown(1) ; Select "Buy Out"
  menuNavEnter(1) ; Buy out
  Sleep 500 ; Wait confirmation window

  menuNavEnter(1) ; Confirm buy out
  Sleep 5000 ; Wait for potential purchase

  menuNavEnter(1) ; Confirm error, if successful it will stuck at the success window
  menuNavBack(2) ; Back to auction main menu
}

; Using != instead of >= to improve "Send" reliability
menuNavUp(i){
  while(i!=0){
    SendInput, {UP}
    Sleep 200
    i--
  }
}
menuNavLeft(i){
  while(i!=0){
    SendInput, {LEFT}
    Sleep 200
    i--
  }
}
menuNavRight(i){
  while(i!=0){
    SendInput, {RIGHT}
    Sleep 200
    i--
  }
}
menuNavDown(i){
  while(i!=0){
    SendInput, {DOWN}
    Sleep 200
    i--
  }
}
menuNavEnter(i){
  while(i>=0){
    SendInput, {ENTER}
    Sleep 200
    i--
  }
}
menuNavBack(i){
  while(i>=0){
    SendInput, {BACKSPACE}{ESC}
    Sleep 200
    i--
  }
}
menuAuctionOptions(){
  SendInput, {Y}
  Sleep 400
}
