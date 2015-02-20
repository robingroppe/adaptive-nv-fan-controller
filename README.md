# adaptive-nv-fan-controller
An adaptive fan controller for nvidia cards which refuse to control themselves. 

Die Lüfter der 550ti lassen sich durch den Treiber zwar ansteuern allerdings funktioniert die automatische Regelung nicht. Das heißt der Lüfter der Karte läuft immer mit 26% und regelt auch bei kritischen Temperaturen nicht hoch.

Hierfür muss die "manuelle" Lüftersteuerung aktiviert werden.

cd /etc/X11
sudo nvidia-xconfig --cool-bits=4

Danach einfach die beiden Dateien in einen Ordner, die nvautofan.sh beim Systemstart automatisch starten lassen und schon regelt auch die nVidia GTX 550 ti ihren Lüfter.
