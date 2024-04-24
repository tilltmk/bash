---
# DNS-Fix Script

Dies ist ein Skript, das entwickelt wurde, um DNS-Probleme auf Linux-Systemen zu beheben, insbesondere in Verbindung mit dem Network Manager. Es ändert die DNS-Konfiguration für eine angegebene Netzwerkschnittstelle und fügt einen bestimmten DNS-Server hinzu.

## Verwendung

1. Lade das Skript herunter und öffne es in einem Texteditor.
2. Passe die Netzwerkschnittstelle (`wlan0`) und den gewünschten DNS-Server (`8.8.8.8`) nach Bedarf an.
3. Öffne ein Terminal mit Root-Rechten (sudo -s).
4. Navigiere in das Verzeichnis, in dem sich das Skript befindet.
5. Führe den Befehl `chmod +x dns-fix.sh` aus, um dem Skript Ausführungsrechte zu geben.
6. Führe das Skript mit `./dns-fix.sh` aus, um die DNS-Einstellungen zu ändern.

## Automatisierung mit Cron

Um das Skript automatisch auszuführen, kannst du einen Cron-Job einrichten:

1. Öffne ein Terminal mit Root-Rechten (sudo -s).
2. Öffne den Cron-Job-Editor mit `crontab -e`.
3. Füge folgende Zeile hinzu, um das Skript alle Minute auszuführen:

```
*/1 * * * * root /pfad/zur/datei/dns.sh
```

4. Speichere und schließe den Editor.
5. Füge denselben Cron-Task möglicherweise auch zur Datei `/etc/crontab` hinzu, um sicherzustellen, dass er auch bei Systemneustarts ausgeführt wird.

Bitte beachte, dass das Ändern von Systemdateien wie `/etc/resolv.conf` und das Hinzufügen von Cron-Jobs mit Bedacht erfolgen sollte und nur von erfahrenen Benutzern durchgeführt werden sollte.
