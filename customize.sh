SKIPMOUNT=false
PROPFILE=false
POSTFSDATA=false
LATESTARTSERVICE=false

REPLACE="
"

run_install() {
  ui_print " "
  ui_print "**********************************"
  ui_print "*     Blur_And_StatusBar_IOS     *"
  ui_print "**********************************"
  ui_print " "
  if [ -n "$KSU" ]; then
    ui_print "[*] Ambiente: KernelSU"
    ui_print " "
    ui_print "[*] Versão Do Modulo para KernelSU: $KSU_VER"
    ui_print "[*] Versão Do KernelSU: ${KSU_VER_CODE}"
    sleep 0.5
    ui_print " "
    ui_print "[*] Installing files"
    ui_print " "
    unzip -o "$ZIPFILE" 'system/*' -d $MODPATH >&2
    sleep 2.1
    ui_print "[*] Applied Successfully"
    ui_print " "
    sleep 0.5
    ui_print "[*] Cleaning up"
    ui_print " "
    rm -rf /data/system/package_cache/*
    sleep 1
    ui_print "[*] Instalation sucess"
    ui_print " "
  else
    ui_print "[*] Ambiente: Magisk"
    ui_print " "
    ui_print "[*] Versão Do Modulo para Magisk: $MAGISK_VER"
    ui_print "[*] Versão Do Magisk: ${MAGISK_VER_CODE}"
    sleep 0.5
    unzip -o "$ZIPFILE" 'system/*' -d $MODPATH >&2

    SYSTEM_FILES="$MODPATH\system\product\media\theme\default\*"

    # Mount overlay to replace system 
    mount -o bind "$SYSTEM_FILES" "$SYSTEM_FONT_FILES"

    # Ensure correct permissions for the replacement file
    chmod 644 "$SYSTEM_FONT_FILES"

    sleep 0.5
    ui_print " "
    ui_print "[*] Cleaning up"
    ui_print " "
    rm -rf /data/system/package_cache/*
    sleep 1
    ui_print "[*] Instalation sucess"
    ui_print " "

  fi
}

set_permissions() {
  set_perm_recursive  $MODPATH  0  0  0755  0644
}

run_install