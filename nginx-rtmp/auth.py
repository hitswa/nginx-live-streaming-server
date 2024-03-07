#!/usr/bin/env python3

import sys

def main():
    # Read username and password from NGINX
    username = sys.stdin.readline().strip()
    password = sys.stdin.readline().strip()

    # Perform authentication (replace with your authentication logic)
    if username == "admin" and password == "admin":
        print("1")
    else:
        print("0")

if __name__ == "__main__":
    main()
