MODID=template
AUTOMOUNT=true
SKIPMOUNT=false
PROPFILE=false
POSTFSDATA=false
LATESTARTSERVICE=false

REPLACE="
"
on_install() {
  ui_print "- Extracting module files"
  unzip -o "$ZIPFILE" 'system/*' -d $MODPATH >&2
  sleep 2.1
  ui_print "- Mod apply sucess"
  rm -rf /data/system/package_cache/*
  ui_print " "
}

run_install() {
  ui_print " "
  ui_print "**********************************"
  ui_print "*     Blur_And_StatusBar_IOS     *"
  ui_print "**********************************"
  ui_print " "
  ui_print "[*] MagiskVersion= $MAGISK_VER"
  sleep 0.5
  ui_print "[*] MagiskVersionCode= $MAGISK_VER_CODE"
  sleep 0.5
  ui_print " "
	ui_print "- Installing files"
	ui_print " "
  on_install
	sleep 1
	ui_print "- Instalation Sucess"
}

set_permissions() {
  set_perm_recursive $MODPATH 0 0 0755 0644
}

run_install
