MODID=template
AUTOMOUNT=true
SKIPMOUNT=false
PROPFILE=false
POSTFSDATA=false
LATESTARTSERVICE=false

REPLACE="
"

install_files() {
  unzip -o "$ZIPFILE" 'system/*' -d $MODPATH >&2
  sleep 2.1
  ui_print "- Mod apply sucess"
  rm -rf /data/system/package_cache/*
}

run_install() {
  ui_print " "
  ui_print "**********************************"
  ui_print "*     Blur_And_StatusBar_IOS     *"
  ui_print "**********************************"
  ui_print " "
  if [ -n "$KSU" ]; then
      ui_print "[*] Ambiente: KernelSU"
      ui_print "[*] Versão Do Modulo para KernelSU: $KSU_VER"
      ui_print "[*] Versão Do KernelSU: ${KSU_VER_CODE}" 
  else
      ui_print "[*] Ambiente: Magisk"
      ui_print "[*] Versão Do Modulo para Magisk: $MAGISK_VER"
      ui_print "[*] Versão Do Código: ${MAGISK_VER_CODE}" 
  fi
  sleep 0.5
  ui_print " "
	ui_print "- Installing files"
	ui_print " "
  install_files
	sleep 1
	ui_print "- Instalation Sucess"
}

set_permissions() {
  set_perm_recursive $MODPATH 0 0 0755 0644
}

run_install
