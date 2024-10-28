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
  ui_print "[*] Applied Successfully"
  ui_print " "
}

cleanup() {
  rm -rf /data/system/package_cache/*
}

run_install() {
  unzip -o "$ZIPFILE" -x 'META-INF/*' -d $MODPATH >&2
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
    ui_print "[*] Versão Do Magisk: ${MAGISK_VER_CODE}" 
  fi
  sleep 0.5
  ui_print " "
	ui_print "[*] Installing files"
	ui_print " "
  install_files
	sleep 0.5
  ui_print "[*] Cleaning up"
	ui_print " "
	cleanup
  sleep 1
	ui_print "[*] Instalation sucess"
  ui_print " "
}

set_permissions() {
  set_perm_recursive $MODPATH 0 0 0755 0644
}

run_install
