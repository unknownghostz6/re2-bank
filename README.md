# Re2 Bank

Each bank Have sperate Amount and Seperate Banking System

For Example Valentine Money is seperate with Rhodes and ...

## Requirment

- rsg-core
- rsg-input
- rsg-menu


## How to Use

1- Download Script from Release page(dont use repository if u dont know about development a lot)
2- Stop all of banking system and ensure re2-bank
3- go to the `rsg-core->config.lua` and replace line 10 with code under
```lua
    RSGConfig.Money.MoneyTypes = {
        cash = 500, 
        bloodmoney = 0,
        rhodes = 0, -- Bank of Rhodes
        lemoyne = 0, -- Lemoyne National Bank
        valentine = 0, -- Valentine Savings Bank
        firstnational = 0, -- First National Bank
    }

```

## WIP -- Near Future

``` 
- Add Bank Money Transfer Cheque 
- Add Gold System
- Add Share Account and Account Management
```