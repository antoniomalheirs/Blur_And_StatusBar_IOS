MODID=template
AUTOMOUNT=true
PROPFILE=false
POSTFSDATA=true
LATESTARTSERVICE=false

print_modname() {
  ui_print "*******************************"
  ui_print "*    Sound_And_Emoji_IOS      *"
  ui_print "*******************************"
}

REPLACE="
"

REPLACE="
"

set_permissions() {
  set_perm_recursive  $MODPATH  0  0  0755  0644
}
