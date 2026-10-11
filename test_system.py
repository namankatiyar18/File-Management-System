"""
Filequh System Verification and Health Checker
Tests the backend API endpoints and verifies frontend accessibility.
"""

import sys
import json
import urllib.request
import urllib.error

BACKEND_URL = "http://localhost:5000"
FRONTEND_URL = "http://localhost:3000"

def test_endpoint(name, url, expected_code=200):
    print(f"[*] Testing {name} -> {url} ... ", end="")
    try:
        req = urllib.request.Request(url, headers={"User-Agent": "FilequhTest/1.0"})
        with urllib.request.urlopen(req, timeout=15) as response:
            code = response.getcode()
            if code == expected_code:
                print(f"[PASS] ({code})")
                return True, response.read().decode("utf-8")
            else:
                print(f"[FAIL] Expected {expected_code}, got {code}")
                return False, None
    except Exception as e:
        print(f"[OFFLINE/ERROR] {e}")
        return False, None

def main():
    print("=" * 60)
    print("       FILEQUH SYSTEM HEALTH CHECK")
    print("=" * 60)
    print()

    tests = [
        ("Backend Health", f"{BACKEND_URL}/health"),
        ("Folders API", f"{BACKEND_URL}/api/folders"),
        ("Files API", f"{BACKEND_URL}/api/files"),
        ("Storage API", f"{BACKEND_URL}/api/storage/usage"),
        ("Search API", f"{BACKEND_URL}/api/search?q=doc"),
        ("Frontend Landing Page", FRONTEND_URL),
    ]

    passed = 0
    total = len(tests)

    for name, url in tests:
        success, body = test_endpoint(name, url)
        if success:
            passed += 1
            if body and body.startswith("{"):
                try:
                    data = json.loads(body)
                    if "status" in data:
                        print(f"    Status: {data['status']}")
                    if "total_bytes" in data:
                        print(f"    Storage used: {data.get('usage_percentage')}%")
                except Exception:
                    pass

    print()
    print("=" * 60)
    print(f"Results: {passed}/{total} endpoints passed.")
    if passed == total:
        print("[SUCCESS] All Filequh services are running and healthy!")
    else:
        print("[INFO] If services are not yet started, run 'run_all.bat' first.")
    print("=" * 60)

if __name__ == "__main__":
    main()
