# 🤖 Thai1-Agent-OpenClaw-Typhoon (xFusion Agent)

โครงการนี้คือระบบ AI Agent อัจฉริยะที่ออกแบบมาเพื่อสนับสนุนการทำงานของ **xFusion** โดยเฉพาะ พัฒนาบนเฟรมเวิร์ก **OpenClaw** และขับเคลื่อนด้วยโมเดลภาษา **Typhoon** เพื่อให้รองรับภาษาไทย ภาษาราชการ และเอกสารจัดซื้อจัดจ้างภาครัฐ (e-GP) ได้อย่างแม่นยำ

## 🎯 หน้าที่หลักของ Agent (Responsibilities)

xFusion Agent ถูกแบ่งหน้าที่ออกเป็น 4 ฟังก์ชันหลักผ่าน Multi-Agent System:

1. **Name Card Collection:** สกัดข้อมูลจากรูปภาพนามบัตรและบันทึกลง Google Sheets อัตโนมัติ
2. **Reimbursement Management:** วิเคราะห์ใบเสร็จค่าใช้จ่ายและจัดการข้อมูลเบิกจ่ายใน Google Sheets
3. **TOR Gap Analysis:** วิเคราะห์เอกสาร TOR (ทีโออาร์) โครงการจัดซื้อจัดจ้างภาครัฐ วิเคราะห์ช่องว่างทางการแข่งขัน
4. **Task & To-Do Management:** จัดการงานทั่วไปผ่าน Telegram ช่วยแจ้งเตือนและสรุปสถานะโครงการ

## 🧠 การเลือกใช้โมเดล (Typhoon Specialized Models)

เราได้แยกโมเดลตามความเหมาะสมของงานเพื่อประสิทธิภาพสูงสุด:
- **`typhoon-ocr`**: ใช้สำหรับการสกัดข้อมูลจากเอกสาร (Name Card, Receipts) 
- **`typhoon-2-72b-instruct`**: ใช้สำหรับงานวิเคราะห์เอกสารที่มีความซับซ้อนสูง (TOR Analysis)
- **`typhoon-2-8b-instruct`**: ใช้สำหรับงานทั่วไปและการตอบโต้ผ่าน Telegram (Low Latency)

## 🛠️ ระบบงาน (Architecture)
- **Framework**: OpenClaw (Node.js/Docker)
- **Interface**: Telegram Bot
- **Database/Logging**: Google Sheets (via Apps Script Webhook)
- **Deployment**: Docker on Google Cloud (Ubuntu VM)

## 🚀 การติดตั้ง

1. Clone repo:
   `git clone https://github.com/thanukonkie-code/thai1-agent-openclaw-typhoon.git`
2. ตั้งค่าไฟล์ `.env` (ดู `.env.example` เป็นตัวอย่าง)
3. รันระบบผ่าน Docker:
   `docker compose up -d`

---
*Developed for xFusion Enterprise.*
