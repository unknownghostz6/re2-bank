local Translations = {
    open = "Open ",
    welcome = "Welcome to ",
    personalInfo = "Personal Info",
    cash = "Cash : ",
    bank = "Bank : ",
    submit = "Submit",
    deposit = "Deposit",
    depositTxt = "Deposit Money To Bank",
    amount = "Amount",
    withdraw = "Withdraw",
    withdrawTxt = "Withdraw Money From Bank",
    withdrawSuccess = "You withdraw ",
    fromBank = " from Bank",
    withdrawError = "U dont Have this Much Money in your Bank",
    depositSuccess = "You Deposit ",
    toBank = " To Bank",
    depositError = "U dont Have this Much Money in your Packet"
}


Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
