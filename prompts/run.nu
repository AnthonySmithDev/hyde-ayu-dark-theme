
export def main [] {
  let prompt = $"
  Este es mi script wallbash:
  (open ../scripts/wallbash.sh)

  Este es la paleta de colores que me genero mi script wallbash:
  (open ../Configs/.config/hyde/themes/Ayu-Dark/theme.dcol)

  Esta es mi paleta de colores de mi thema
  (open ../colors/hex/dark.css)

  Quiero que me edites este codigo para que use mi paleta de colores:
  (open ../lab/theme.dcol.css)
  "
  mo $prompt
}
