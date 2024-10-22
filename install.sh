SKIPMOUNT=false
PROPFILE=false
POSTFSDATA=false
LATESTARTSERVICE=false

REPLACE_EXAMPLE="
/system/app/Youtube
/system/priv-app/SystemUI
/system/priv-app/Settings
/system/framework
"

REPLACE="
"

# Set what you want to display when installing your module

print_modname() {
  ui_print " "
  ui_print "**********************************"
  ui_print "*     Blur_And_StatusBar_IOS     *"
  ui_print "**********************************"
  sleep 1
  ui_print " "
  ui_print "[*] MagiskVersion= $MAGISK_VER"
  sleep 0.5
  ui_print "[*] MagiskVersionCode= $MAGISK_VER_CODE"
  sleep 0.5
  ui_print " "
}


# Copy/extract your module files into $MODPATH in on_install.

on_install() {
  ui_print "- Extracting module files"
  unzip -o "$ZIPFILE" 'system/*' -d $MODPATH >&2
  sleep 2.1
  #ui_print " "#
  ui_print "- Mod apply sucess"
  rm -rf /data/system/package_cache/*
  ui_print " "
}

set_permissions() {
  # The following is the default rule, DO NOT remove
  set_perm_recursive $MODPATH 0 0 0755 0644
}