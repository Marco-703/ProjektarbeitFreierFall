# ProjektarbeitFreierFall

Simuliert die Nutzung eines linearen Kalmanfilters zur Verbesserung der Messgenauigkeit eines Abstandssensors.
Ein wählbarer Körper fällt senkrecht Richtung Boden und wird dabei durch den Luftwiderstand gebremst.
Der Sensor am Boden misst seine Höhe, wobei die Messung durch ein normalverteiltes Rauschen beeinflusst wird.

Das Sensorfusionsmodell nutzt Kenntnisse über die Systemdynamik und die Höhenmessungen, um das Rauschen der Höhenmessung zu reduzieren.
Zusätzlich werden Geschwindigkeit und Reibungskraft (Luftreibung) geschätzt.

Die Kovarianzmatrix Q repräsentiert das Prozessrauschen. Sie ist kalibriert, um den Fall einer Kugel mit einer Masse von 2,5 Kg und Fläche von 0,02 m^2 zu messen.
Im Ordner Results befinden sich Beispiele für verschiedene Szenarien.
Best Case beschreibt das o.g. Beispiel. 
Worst Case verwendet dieselbe Kovarianzmatrix bei einem anderen Objekt. Sie ist dort nicht so gut abgestimmt.
Das Resultat ist ein Signal, das stärker durch Prozessungenaugkeiten beeinflusst wurde, was sich in Signalrauschen ausdrückt.