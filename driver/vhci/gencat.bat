cd %1
if exist vhci_cat del /s /q vhci_cat
mkdir vhci_cat
cd vhci_cat
copy ..\usbip_vhci.sys
copy ..\usbip_vhci.cer
copy ..\usbip_vhci.inf
inf2cat /driver:.\ /os:%2 /uselocaltime
signtool sign /n %3 /fd SHA256 /t http://timestamp.verisign.com/scripts/timestamp.dll usbip_vhci.cat
copy /y usbip_vhci.cat ..
cd ..
del /s /q vhci_cat
