#!/usr/bin/env python3

import time, signal
def handler(signum, frame): print("MOTOR SHUTDOWN"); exit(0)
signal.signal(signal.SIGTERM, handler)
while True: print("Rover moving..."); time.sleep(2)
