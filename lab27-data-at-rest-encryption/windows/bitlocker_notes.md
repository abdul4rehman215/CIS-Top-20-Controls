# BitLocker Notes — Lab 27 (Windows 11 Pro)

## Actions Performed (GUI)
1) Opened **Control Panel**
2) Navigated to **System and Security → BitLocker Drive Encryption**
3) Selected test drive:
   - **E:** (Data Volume - 10GB) *(example lab disk)*
4) Clicked **Turn on BitLocker**

## Encryption Settings (Documented)
- Encryption method: **XTS-AES 128-bit** (default)
- Mode: **Encrypt entire drive**
- Unlock method: **Password**
- Recovery key: **Saved securely** (offline / password manager / encrypted vault)
- Plaintext recovery key storage: **Not used**

## Observed Result
- Encryption progress: **100% complete**
- Drive status: **BitLocker on**
- Protection status: **Protection On**

## Verification (After Reboot)
- Drive E: shows locked icon
- Access prompts for BitLocker password
- Without password: drive contents inaccessible
