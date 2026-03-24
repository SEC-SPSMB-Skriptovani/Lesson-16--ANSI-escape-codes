# 🎨 Barevné výstupy v konzole (ANSI Escape Codes)

Barevné výstupy umožňují **zvýraznit text**, upozornit na chyby,
zobrazit výstup přehledněji a přidat vizuální prvky do programů (v Bash,
Pythonu i dalších jazycích).

> Většina terminálů podporuje tzv. **ANSI Escape Codes**, což jsou
> speciální sekvence znaků, které změní barvu nebo styl textu.

------------------------------------------------------------------------

## 🎥 Doporučené video (ANSI Colors)

[![YouTube - Terminal Colors &
Formatting](https://img.youtube.com/vi/PKfM4GvWCYc/0.jpg)](https://www.youtube.com/shorts/PKfM4GvWCYc)

------------------------------------------------------------------------

## 🔵 Jak fungují ANSI escape sekvence?

Základní tvar:

    \e[<kód_módu>m

-   `\e` --- escape znak
-   `[` --- začátek příkazu
-   `<kód>` --- číslo určující barvu nebo styl
-   `m` --- ukončení sekvence

Příklad:

``` bash
echo -e "\e[31mTento text je červený!\e[0m"
```

`[0m]` resetuje barvy zpět do normálu.

------------------------------------------------------------------------

# 🎨 Základní barvy textu

  Barva       Kód    Ukázka
  ----------- ------ ----------
  Černá       `30`   `\e[30m`
  Červená     `31`   `\e[31m`
  Zelená      `32`   `\e[32m`
  Žlutá       `33`   `\e[33m`
  Modrá       `34`   `\e[34m`
  Purpurová   `35`   `\e[35m`
  Tyrkysová   `36`   `\e[36m`
  Bílá        `37`   `\e[37m`

Ukázka:

``` bash
echo -e "\e[32mZpráva byla úspěšně uložena.\e[0m"
echo -e "\e[31mChyba: soubor nebyl nalezen!\e[0m"
```

------------------------------------------------------------------------

# 🟩 Barvy pozadí

Stačí přidat **10** ke kódu textu.

  Barva     Kód pozadí
  --------- ------------
  Červená   `41`
  Zelená    `42`
  Modrá     `44`
  Žlutá     `43`

Příklad:

``` bash
echo -e "\e[43;30mVAROVÁNÍ: Málo místa na disku!\e[0m"
```

------------------------------------------------------------------------

# 🔧 Kombinování stylů (bold, underline, ...)

  Styl                Kód
  ------------------- -----
  Tučné               `1`
  Podtržené           `4`
  Blikající           `5`
  Invertované barvy   `7`

Příklad:

``` bash
echo -e "\e[1;34mNadpis\e[0m"
echo -e "\e[4;33mDůležitá informace\e[0m"
```

------------------------------------------------------------------------

# 🌈 256barevný mód

    \e[38;5;<kód>m   # barva textu
    \e[48;5;<kód>m   # barva pozadí

Příklad:

``` bash
echo -e "\e[38;5;202mOranžový text\e[0m"
echo -e "\e[48;5;27m\e[97mBílý text na modrém pozadí\e[0m"
```

------------------------------------------------------------------------

# 💡 Tip: Použij si proměnné!

``` bash
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
RESET="\e[0m"

echo -e "${GREEN}Hotovo!${RESET}"
echo -e "${RED}Chyba!${RESET}"
```

------------------------------------------------------------------------

# 🧪 Cvičení 1: Semafor 🚦

Vytvoř skript `semafor.sh`, který: 1. Vypíše **ČERVENÁ -- STOP**
(červeně) 2. Po 2 sekundách vypíše **ŽLUTÁ -- PŘIPRAVIT** (žlutě) 3. Po
1 sekundě vypíše **ZELENÁ -- JEĎ** (zeleně) 4. Vše v cyklu (opakování
pořád dokola)

------------------------------------------------------------------------

# 🧪 Cvičení 2: Barevné menu

Napiš skript `menu.sh`, který vypíše: - nadpis modře tučně - položky
bílou - chybnou volbu červeně

------------------------------------------------------------------------

# 🧪 Cvičení 3: Duha 🌈

Skript `duha.sh` vypíše text „DUHA" barvami duhy.

------------------------------------------------------------------------

# 🧩 Bonus: Banner z ASCII umění

https://patorjk.com/software/taag/

Vybarvi ho libovolnou barvou.
