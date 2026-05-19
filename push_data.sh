#!/bin/bash

# ข้อมูลตัวแปร
IMG_PATH="$1"
URL="https://script.google.com/macros/s/AKfycbzYDF4HPp1SuPCIQPCxL4n6XvbXFFADJBHhoSfj5NDEMv-TJyGBVHVlVOhTS8mb0DUT2Q/exec"
KEY="XFUSION_SECRET_ABC_123"

echo "⏳ กำลังแปลงรูปภาพและเตรียมข้อมูล..."
# แปลงรูปเป็น Base64
IMG_BASE64=$(sudo base64 -w 0 "$IMG_PATH")

# สร้าง JSON Payload
cat << JSON_EOF > payload.json
{
  "key": "$KEY",
  "name": "Inrita",
  "familyName": "Fahkiattipong",
  "position": "Assistant Sales Director",
  "company": "PPlus Visions Co., Ltd.",
  "mobile": "092-596-2266",
  "email": "inrita.f@pplusnetwork.com",
  "imageName": "business-card-inrita.jpg",
  "imageData": "$IMG_BASE64"
}
JSON_EOF

echo "🚀 กำลังส่งข้อมูลเข้า Google Sheet & Drive..."
# ยิง curl (ไม่มี -X POST)
curl -L -H 'Content-Type: application/json' -d @payload.json "$URL"

# ลบไฟล์ชั่วคราว
rm payload.json
echo -e "\n✅ เสร็จสิ้น!"
