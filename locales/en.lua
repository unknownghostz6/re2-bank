local Translations = {
    menu = {
        menu_var = 'Example Text',
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
