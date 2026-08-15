#!/data/data/com.termux/files/usr/bin/bash


security_scan(){

echo ""
echo "DIVINITY SECURITY SCAN"
echo ""

echo "[✓] Searching suspicious files..."

find . \
-not -path "./.git/*" \
-type f \
\( -name "*.env" -o -name "*.key" -o -name "*.pem" \)


echo ""

echo "[✓] Checking exposed secrets..."

grep -RniE "password|secret|token|api_key|private_key" . \
--exclude-dir=.git \
2>/dev/null


echo ""

echo "[✓] Checking writable files..."

find . -type f -perm -o+w \
-not -path "./.git/*"


echo ""

echo "SCAN COMPLETE"

}
