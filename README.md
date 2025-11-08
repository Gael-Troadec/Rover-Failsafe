# Rover Failsafe System - Mission A ✅

Simulates a Mars rover with a critical failsafe: if Earth signal is lost for &gt;90 seconds, the rover automatically shuts down its motors.

## Mission A: Heartbeat Monitor & Loss-of-Signal Failsafe

### Components
- **earth_server.sh**: Simulates Earth communication (30% random failure)
- **rover_motor.py**: Simulates rover motor process
- **watchdog.sh**: Monitors signal and triggers failsafe after 3 consecutive failures

### Usage
```bash
# Terminal 1: Start rover motor
./rover_motor.py

# Terminal 2: Start watchdog
./watchdog.sh

# After ~5-15 min, check log
cat failsafe.log

Expected Output
JSON

{"timestamp":"2025-11-08T17:45:45+01:00","event":"LOSS_OF_SIGNAL","action":"MOTOR_SHUTDOWN"}

Test Results

    Debug mode (100% failure): ✅ Failsafe triggered in 90s
    Real mode (30% failure): ✅ Failsafe triggered after ~15min

Portfolio Impact
Demonstrates reliability engineering, process management, and structured logging (critical for ESA, Palantir, Helsing).
