Config = {}

Config.UseTarget = GetConvar('UseTarget', 'false') == 'true'

Config.BankLocations = {
    {name = 'Bank of Rhodes',           bankType = "rhodes",     coords = vector3(1292.307, -1301.539, 77.04012),    showblip = true},
    {name = 'Lemoyne National Bank',    bankType = "lemoyne",    coords = vector3(2644.579, -1292.313, 52.24956),    showblip = true},
    {name = 'Valentine Savings Bank',   bankType = "valentine",    coords = vector3(-308.4189, 775.8842, 118.7017),    showblip = true},
    {name = 'First National Bank',      bankType = "firstnational",    coords = vector3(-813.1633, -1277.486, 43.63771),   showblip = true},
}